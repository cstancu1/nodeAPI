const express = require('express');
const router = express.Router();
const tokenModule = require('../../modules/tokenModule/_token')

//import controllers
const getTasks = require('./getTasks')
const addTask = require('./addTask')
const finnishTask = require('./finnishTask')
const assignTask = require('./assignTask')
const viewTask = require('./viewTask')

//assign controllers to routes
router.get('/view/:id', tokenModule.checkToken, (request, response) => {
    viewTask(request, response);
})

router.get('/gettasks/:page/:perpage/:sortby/:order/:bystatus?/:searchterm?',tokenModule.checkToken, (request, response) => {
    getTasks(request, response);
})

router.post('/addtask/', tokenModule.checkToken, (request, response) => {
    addTask(request, response);
})

router.post('/closetask/', tokenModule.checkToken, (request, response) => {
    finnishTask(request, response);
})

router.post('/assigntask/', tokenModule.checkToken, (request, response) => {
    assignTask(request, response);
})

module.exports = router;