//defining express app
const express = require('express');
const server = express();
const port = 3000;

//helper for parsing post body data
const bodyParser = require('body-parser');
server.use(bodyParser.json())
//OLD and FUNCTIONAL!!!!!!!!!!!!!! :::::: server.use(bodyParser.urlencoded({ extended: true }));

//Setting up CORS
const cors = require('cors')

server.use(cors());

//importing routes
//users router (login, register, profile)
const usersRouter = require('./routes/users/_usersRouter.js')
server.use('/users/', usersRouter);

//notifications main router
const notificationsRouter = require('./routes/notifications/_notificationsRouter')
server.use('/notifications/', notificationsRouter);

//tasks main router
const tasksRouter = require('./routes/tasks/_tasksRouter')
server.use('/tasks/', tasksRouter);

server.locals.title="teamIT"

server.get('/', (request, response) => {
    response.status(200).json({'Server status':'OK'})
});

server.listen(port, '0.0.0.0', () => {
    console.log(`Server listening on port ${port} .`)
});