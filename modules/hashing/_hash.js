const bcrypt = require('bcrypt')
const hashRounds = 5;

function hash(plainText){
    var hash = bcrypt.hashSync(plainText, hashRounds);
    return hash
}

function compare(password, hash){
    return bcrypt.compareSync(password, hash)
}

module.exports = {
    hash,
    compare
}