const db = require('../../modules/database/_db')
const assignNotification = require('../../modules/notifications/_assignTaskNotification')

const checkUserDetails = async (user_id) => {
    const queryString = 'SELECT email, name, group_id, company_id FROM users WHERE id = $1'
    const values = [Number(user_id)]
    const userDetails = await db(queryString, values)
    return userDetails.rows[0]
}

const getTaskDetails = async (task_id) => {
    const queryString = 'SELECT * FROM tasks WHERE id = $1'
    const values = [Number(task_id)]
    const taskDetails = await db(queryString, values)
    return taskDetails.rows[0]
}

//needs in request.body: 
// -=> task_id | assigned_to(the id of the user that will be set in the assigned_to field)
const assignTask = async (request, response) => {
    const task_id = request.body.task_id
    const assigned_to = request.body.assigned_to
    const taskDetails = await getTaskDetails(task_id)
    if(taskDetails.assigned_to!=0){
        return 'err'
    }
    const timestamp = new Date()
    const userDetails = await checkUserDetails(Number(request.body.assigned_to))
    if(request.decodedToken.type == "admin" && userDetails.company_id == request.decodedToken.company_id && taskDetails.company_id == request.decodedToken.company_id){
        const queryString = 'UPDATE tasks SET assigned_to = $1 , assigned_time = $2::TIMESTAMP WHERE id = $3'
        const values = [Number(assigned_to), timestamp, Number(task_id)]
        await db(queryString, values).catch(err => {response.status(500).json({error:err})})
        .then(res => {response.status(200).json({status:'ok'})
        assignNotification(request.decodedToken.company_id, taskDetails.title, request.decodedToken.name, request.body.assigned_to, task_id)
    })
    }else if(request.decodedToken.type == "leader" && userDetails.group_id == request.decodedToken.group_id && taskDetails.company_id == request.decodedToken.company_id){
        const queryString = 'UPDATE tasks SET assigned_to = $1 , assigned_time = $2::TIMESTAMP WHERE id = $3'
        const values = [Number(assigned_to), timestamp, Number(task_id)]
        await db(queryString, values).catch(err => {response.status(500).json({error:err})})
        .then(res => {response.status(200).json({status:'ok'})
        assignNotification(request.decodedToken.company_id, taskDetails.title, request.decodedToken.name, request.body.assigned_to, task_id)
    })
    }
    
    else if(request.decodedToken.id == assigned_to && taskDetails.group_id == request.decodedToken.group_id){
        const queryString = 'UPDATE tasks SET assigned_to = $1 , assigned_time = $2::TIMESTAMP  WHERE id = $3'
        const values = [Number(assigned_to), timestamp, Number(task_id)]
        await db(queryString, values).catch(err => {response.status(500).json({error:err})})
        .then(res => {response.status(200).json({status:'ok'})
        assignNotification(request.decodedToken.company_id, taskDetails.title, request.decodedToken.name, request.body.assigned_to, task_id)
    })
    }else{
        response.status(401).json({haHa:'Nope:D'})
    }
}

module.exports = assignTask