const db = require('../../modules/database/_db')

const checkOwner = async (notificationId, userId) => {
    const queryString = 'SELECT user_id FROM notifications WHERE id = $1'
    const values = [notificationId]
    const res = await db(queryString, values)
    console.log(notificationId, userId, res.rows)
    if(res.rows.length>=1){
        if(Number(res.rows[0].user_id) == userId){
            return true
        }else{
            return false
        }
    }else{
        return false
    }
}

const notificationSeen = async (request, response) => {
    const notificationId = request.body.notificationId
    const queryString = 'UPDATE notifications SET seen = 1 WHERE id = $1'
    const values = [Number(notificationId)]
    var isOwner = await checkOwner(notificationId, request.decodedToken.id)
    if(isOwner == true){
       await db(queryString, values)
       response.status(200).json({ok:'ok'})
    }else{
        response.status(500).json({error:'error'})
    }
}

module.exports = notificationSeen