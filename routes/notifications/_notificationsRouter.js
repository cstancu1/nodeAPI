//creating router
const express = require('express');
const router = express.Router();
const tokenModule = require('../../modules/tokenModule/_token')

//import controllers
const getNotifications = require('./getNotifications')
const notificationSeen = require('./notificationSeen')

//assign controllers to routes
router.get('/getnotifications', tokenModule.checkToken, (request, response) => {
    getNotifications(request, response);
})

router.post('/setseen', tokenModule.checkToken, (request, response) => {
    notificationSeen(request, response);
})


module.exports = router;