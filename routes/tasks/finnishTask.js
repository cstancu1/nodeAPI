const db = require('../../modules/database/_db')
const closeTaskNotification = require('../../modules/notifications/_closeTaskNotification')

const getTaskDetails = async (task_id) => {
    const queryString = 'SELECT * FROM tasks WHERE id = $1'
    const values = [Number(task_id)]
    const taskDetails = await db(queryString, values)
    return taskDetails.rows[0]
} 
//needs in body: resolution, task_id
const finnishTask = async (request, response) => {
    const resolution = request.body.resolution
    const task_id = request.body.task_id
   
    const timeStamp = new Date()
    const user_id = request.decodedToken.id
    const group_id = request.decodedToken.group_id
    const company_id = request.decodedToken.company_id

    const taskDetails = await getTaskDetails(task_id)
    if(Number(user_id) == Number(taskDetails.author_id)){
        console.log('a')
        const queryString = 'UPDATE tasks SET finnished_time = $1::TIMESTAMP, resolution = $2, closed_by = $3 WHERE id = $4 AND company_id = $5'
        const values = [timeStamp, resolution, Number(user_id), Number(task_id), Number(request.decodedToken.company_id)]
        db(queryString, values)
        .catch(err =>{response.status(500).json({error:'Error closing task'})}) 
        .then(res => {response.status(200).json({status:'ok'})})

        closeTaskNotification(Number(taskDetails.author_id), Number(taskDetails.group_id), Number(taskDetails.assigned_to), Number(taskDetails.company_id), 
                                Number(taskDetails.id), taskDetails, request.decodedToken.id, request.decodedToken.name)
    }else if(Number(user_id)==Number(taskDetails.assigned_to)){
        const queryString = 'UPDATE tasks SET finnished_time = $1::TIMESTAMP, resolution = $2, closed_by = $3 WHERE id = $4 AND company_id = $5'
        const values = [timeStamp, resolution, Number(user_id), Number(task_id), Number(request.decodedToken.company_id)]
        db(queryString, values)
        .then(res => {response.status(200).json({status:'ok'})})
        .catch(err =>{response.status(500).json({error:'Error closing task'})}) 

        closeTaskNotification(Number(taskDetails.author_id), Number(taskDetails.group_id), Number(taskDetails.assigned_to), Number(taskDetails.company_id), 
                                Number(taskDetails.id), taskDetails, request.decodedToken.id, request.decodedToken.name)
    }else if(Number(company_id)==Number(taskDetails.company_id) && request.decodedToken.type=="admin"){
        const queryString = 'UPDATE tasks SET finnished_time = $1::TIMESTAMP, resolution = $2, closed_by = $3 WHERE id = $4 AND company_id = $5'
        const values = [timeStamp, resolution, Number(user_id), Number(task_id), Number(request.decodedToken.company_id)]
        db(queryString, values)
        .then(res => {response.status(200).json({status:'ok'})})
        .catch(err =>{response.status(500).json({error:'Error closing task'})})

        closeTaskNotification(Number(taskDetails.author_id), Number(taskDetails.group_id), Number(taskDetails.assigned_to), Number(taskDetails.company_id), 
        Number(taskDetails.id), taskDetails, request.decodedToken.id, request.decodedToken.name)    }else{
        response.status(401).json({error:'unauthorized'})
    }
        
    
}

module.exports = finnishTask