//creating router
const express = require('express');
const router = express.Router();
const tokenModule = require('../../modules/tokenModule/_token')

//importing controllers
const loginController = require('./loginController');
const registerController = require('./registerController');
const profileController = require('./profileController');

//assigning controllers to routes
router.get('/profile', tokenModule.checkToken, (request, response) => {
    profileController(request, response);
})

router.post('/register', (request, response) => {
    registerController(request, response);
});

router.post('/login', (request, response) => {
    loginController(request, response);
});

module.exports = router;