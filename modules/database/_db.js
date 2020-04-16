const {Pool , Client} = require('pg');
const DBcredentials = require('./config')

function db(querryString, values){
    const query = {
        text:querryString,
        values:values,
        //rowMode:'array'
    }
    const pool = new Pool(DBcredentials)
    return pool.query(query)
} 

module.exports = db;