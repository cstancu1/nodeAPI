const db = require('../../modules/database/_db')

const getTaskDetails = async (taskId, company_id) => {
    const queryString = 'SELECT * FROM tasks WHERE id = $1 AND company_id = $2'
    const values = [taskId, Number(company_id)]
    const taskDetails = await db(queryString, values)
    return taskDetails.rows[0]
}

const getAuthorDetails = async (authorID, company_id) => {
    const queryString = 'SELECT * FROM users WHERE id = $1 AND company_id = $2'
    const values = [Number(authorID), Number(company_id)]
    const authorDetails = await db(queryString, values)
    return authorDetails.rows[0]
}

const getAssignedDetails = async (assignedId, company_id) => {
    const queryString = 'SELECT id, email, group_id, created_at, profile_picture, type, company_id, name, last_login FROM users WHERE id = $1 AND company_id = $2'
    const values = [Number(assignedId), Number(company_id)]
    const assignedDetails = await db(queryString, values)
    return assignedDetails.rows[0]
}


const getFinnishedBy = async (id) => {
    const queryString = 'SELECT id, email, group_id, name, profile_picture, type FROM users WHERE id = $1'
    const values = [Number(id)]
    const finnishedBy = await db(queryString, values)
    return finnishedBy.rows[0]
}

const getLocationDetails = async (locationId, company_id) => {
    const queryString = 'SELECT * FROM locations WHERE id = $1 AND company_id = $2'
    const values = [Number(locationId), Number(company_id)]
    const locationDetails = await db(queryString, values)
    return locationDetails.rows[0]
}

const viewTask = async (request, response) => {
    const taskId = Number(request.params.id)
    const company_id = request.decodedToken.company_id
    const taskDetails = await getTaskDetails(taskId, company_id)
    const authorDetails = await getAuthorDetails(taskDetails.author_id, company_id)
    var assignedDetails
    var locationDetails
    var finnishedBy
    
    if(taskDetails.finnished_time){
        finnishedBy = await getFinnishedBy(taskDetails.closed_by)
    }else{
        finnishedBy = 'null'
    }

    if(taskDetails.assigned_to!=0){
        assignedDetails = await getAssignedDetails(taskDetails.assigned_to, company_id)
    }else{
        assignedDetails = 'null'
    }

    if(taskDetails.location_id == 0){
        locationDetails = 'null'
    }else{
        locationDetails = await getLocationDetails(taskDetails.location_id, company_id)
    }

    response.status(200).json({
        taskDetails : taskDetails,
        authorDetails : authorDetails,
        assignedDetails : assignedDetails,
        locationDetails : locationDetails,
        finnishedBy : finnishedBy
    })
}

module.exports = viewTask