const db = require('../../modules/database/_db')
const hash = require('../../modules/hashing/_hash')
const tokenModule = require('../../modules/tokenModule/_token')

function setLastLogin(id){
    const timestamp = new Date()
    const queryString = 'UPDATE users SET last_login = $1::TIMESTAMP WHERE id = $2'
    const values = [timestamp, id]
    db(queryString, values)
    .catch(err => {console.log(err)})
}

function authenticate(email, password, request, response){
    queryString = 'SELECT * FROM users WHERE email = $1'
    values = [email]
    db(queryString, values)
    .then(result => {
        if(hash.compare(password, result.rows[0].password)==true){
            //data for token
            let data = {
                id : result.rows[0].id,
                email : result.rows[0].email,
                group_id : result.rows[0].group_id,
                profile_picture : result.rows[0].profile_picture,
                company_id : result.rows[0].company_id,
                type : result.rows[0].type,
                name : result.rows[0].name
            }
            setLastLogin(result.rows[0].id)
            var token = tokenModule.generateToken(data, '2d')
            response.status(200).json({xtkn:token})
        }
        else{
            response.status(401).json({login:'invalid'})
        }
    })
    .catch(err => {
        response.status(401).json({login:'invalid'})
    })
}

function loginRoute(request, response){
    let email = request.body.email
    let password = request.body.password
    console.log(email, password)

    if(email && password){
        authenticate(email, password, request, response)
    }else{
        response.status(401).json({login:'invalid'})
    }
}

module.exports= loginRoute;