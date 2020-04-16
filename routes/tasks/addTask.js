const db = require('../../modules/database/_db');
const addTaskNotification = require('../../modules/notifications/_createTaskNotification')

//will need in request.body 
//-=> title | text | location_id (optional) | group_id |urgent |assigned_to(optional)
const addTask = async (request, response) => {
    const author_id = Number(request.decodedToken.id);
    const title = request.body.title
    const text = request.body.text
    const created_at = new Date() //::timestamp
    var location_id = 0
    if(request.body.location_id){
        location_id = Number(request.body.location_id)
    }
    var group_id = Number(request.body.group_id)
    if (group_id==0){
        group_id = request.decodedToken.group_id
    }
    if(request.decodedToken.type !== "admin" && request.decodedToken.type!="leader"){
        if(group_id !== request.decodedToken.group_id){
            response.status(401).json({error:'unauthorized'})
        }
    }
    var assigned_time = null
    const urgent = Number(request.body.urgent)
    const company_id = Number(request.decodedToken.company_id)
    var assigned_to = 0
    if(request.decodedToken.type=="admin"){
        if(request.body.assigned_to){
            assigned_to = Number(request.body.assigned_to)
            assigned_time = new Date()
        }else{
            assigned_to = 0
        }
    }else{
        assigned_to = 0
    }
    const queryString = 'INSERT INTO tasks(author_id, title, text, created_at, location_id, group_id, urgent, company_id, assigned_to, assigned_time) VALUES($1,$2,$3,$4::TIMESTAMP,$5,$6,$7,$8,$9,$10::timestamp) RETURNING id'
    const values = [author_id, title, text, created_at, location_id, group_id, urgent, company_id, assigned_to, assigned_time]
    await db(queryString, values)
    .then(res => {
        addTaskNotification(res.rows[0].id)
        response.status(200).json({status:'ok'})
    })
    .catch(err=>{
        console.log(err)
        response.status(500).json({error:err})
                                                })
    
}

module.exports = addTask