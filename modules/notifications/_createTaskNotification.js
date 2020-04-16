const db = require('../database/_db')

const getTaskDetails = async (task_id) => {
    const queryString = 'SELECT * FROM tasks WHERE id = $1'
    const values = [Number(task_id)]
    const details = await db(queryString, values)
    return details.rows[0]
}

const getGroupUsers = async (taskDetails) => {
    if(taskDetails.assigned_to != 0){
        var queryString = 'SELECT * FROM users WHERE id = $1'
        var values = [Number(taskDetails.assigned_to)]
    }else{
        var queryString = 'SELECT * FROM users WHERE group_id = $1'
        var values = [Number(taskDetails.group_id)]
    }
    const users = await db(queryString, values)
    return users.rows
}
 
const addTaskNotification = async (task_id) => {
    const taskDetails = await getTaskDetails(task_id)
    const usersList = await getGroupUsers(taskDetails)
    var author_user = usersList.filter(function (user) {
        return user.id == taskDetails.author_id
    })
    const type = "task"
    const urgent = Number(taskDetails.urgent)
    const title = taskDetails.title
    const text = `${author_user[0].name} | ${taskDetails.created_at}`
    const seen = 0
    const redirect = `/tasks/${taskDetails.id}`
    const company_id = taskDetails.company_id
    usersList.forEach(user => {
        var queryString = 'INSERT INTO notifications(type, urgent, title, text, user_id, seen, redirect, company_id) VALUES($1,$2,$3,$4,$5,$6,$7,$8)'
        var values = [type, urgent, title, text, user.id, seen, redirect, company_id]
        db(queryString, values)
    })
}

module.exports = addTaskNotification