function checkLimits(str){
    if(str.length<3 || str.length>50){
        return true
    }else{
        return false
    }
}

function checkEmail(email){
    if(email.includes('.') && email.includes('@') && email.length>5 && email.length<60){
        return true
    }else{
        return false
    }
}

exports.checkEmail = checkEmail
exports.checkLimits = checkLimits