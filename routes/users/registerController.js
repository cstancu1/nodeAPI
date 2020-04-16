const db = require('../../modules/database/_db');
const hash = require('../../modules/hashing/_hash');
const checker = require('../../modules/database/checker')

function registerRoute(request, response){
    var email = request.body.email;
    var password = request.body.password;
    var timeStamp = new Date()
    console.log(email)
    //check for ok strings
    if(checker.checkEmail(email)==false){
        response.status(401).json({error: 'email validation'})
    }

    if(checker.checkLimits(password)==true){
        response.status(401).json({error:'password validation'})
    }

    //hashing password
    let hashedPassword = hash.hash(password)

    //data to be stored into database
    queryString = 'INSERT INTO users(email, password, created_at)VALUES($1, $2,$3::timestamp)'
    values = [email, hashedPassword, timeStamp]
    db(queryString, values)
    
    .then(res => {
        response.status(200).json({register:'ok'})
    })

    .catch(err => {
        if(err.constraint=='email'){
            response.status(500).json({error:'Email already exists.'})
        }else{
            response.status(500).json({error:'error'})
        }
        
    })
}

module.exports = registerRoute;