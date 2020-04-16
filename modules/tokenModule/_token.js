const jwt = require('jsonwebtoken');
const key = require('./tokenKey')

function generateToken(data, expire){
    var token = jwt.sign(data, key.private, {algorithm:'RS256', expiresIn: expire});
    return token
}

function checkToken(request, response, next){
    let token = request.headers['xtkn'] || request.headers['authorizaton'];
    if(token){
        jwt.verify(token, key.public, (error, decoded) => {
            if(error){
                return response.status(401).json({error:'invalid token!'})
            }else{
                request.decodedToken = decoded;
                next();
            }
        })
    }else{
        return response.status(401).json({error:'no token'})
    }  
}

module.exports = {
    generateToken,
    checkToken
}