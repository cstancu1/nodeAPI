const db = require('../../modules/database/_db')

const getUsers = async (author_id, group_id, assigned_to, company_id) => {
    var queryString = 'SELECT id FROM users WHERE id = $1 OR id = $2 OR group_id = $3'
    var values = [author_id, assigned_to, group_id]
    var firstList = await db(queryString, values)
    
    //get the admins of the company
    var queryString = 'SELECT id FROM users WHERE company_id = $1 AND type = $2'
    var values = [company_id, "admin"]
    var secondList = await db(queryString, values)
    //merge the two lists with users
    Array.prototype.push.apply(firstList.rows,secondList.rows); 
    var finalList = new Set(firstList.rows.map(e => JSON.stringify(e)))
    var final = Array.from(finalList).map(e => JSON.parse(e));
    return final
}

const closeTaskNotification = async (author_id, group_id, assigned_to, company_id, task_id, taskDetails, user_id, user_name) => {
    const authorId = author_id
    const groupId = group_id
    const assignedTo = assigned_to
    const companyId = company_id
    const usersList = await getUsers(authorId, groupId, assignedTo, companyId)
    var author_user = usersList.filter(function (user) {
        return user.id == authorId
    })
    const urgent = 0
    const type = "closedTask"
    const seen = 0
    const title = `${taskDetails.title}`
    const text = `a fost inchis de ${user_name}.`
    const redirect = `/tasks/${task_id}`
    usersList.forEach(user => {
        var queryString = 'INSERT INTO notifications(type, urgent, title, text, user_id, seen, redirect, company_id) VALUES($1,$2,$3,$4,$5,$6,$7,$8)'
        var values = [type, urgent, title, text, user_id, seen, redirect, companyId]
        db(queryString, values)
        .catch(err => {response.status(500).json({error:'error creating notification'})})
    })
}

module.exports = closeTaskNotification