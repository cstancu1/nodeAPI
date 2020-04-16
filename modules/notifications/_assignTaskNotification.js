const db = require('../database/_db')

const assignTaskNotification = async (company_id, task_name, who_assigned, assigned_to, task_id) => {
    const queryString = 'INSERT INTO notifications(type, title, text, user_id, seen, created_at, redirect, company_id, urgent) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)'
    const type = 'taskAssign'
    const title = `${task_name}`
    const text = `${who_assigned} v-a alocat unei sarcini.`
    const seen = 0
    const created_at = new Date()
    const redirect = `/tasks/${task_id}`
    const urgent = 1

    const values = [type, title, text, assigned_to, seen, created_at, redirect, company_id, urgent]
    db(queryString, values).catch(err=>{console.log(err)})
}

module.exports = assignTaskNotification