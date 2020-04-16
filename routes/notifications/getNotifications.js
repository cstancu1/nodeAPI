const db = require('../../modules/database/_db')

const notificationsController = async (request, response) => {
    const user_id = request.decodedToken.id
    var queryString = 'SELECT * FROM notifications WHERE user_id = $1 ORDER BY created_at ASC LIMIT 10'
    var values = [Number(user_id)]
    
    const notifications = await db(queryString, values)
    
    response.status(200).json(notifications.rows)
}

module.exports = notificationsController