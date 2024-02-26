const { continueSession } = require("pg/lib/crypto/sasl");


const validateUserName = (username)=>{
    const userNameLength = username.length;
    if(userNameLength < 7 && username.slice(" ")){
      return false
    }
    if(userNameLength >=7){
      return true
    }
}

const  validatePassword =(password)=>{
    const passwordLength = password.length
  if(passwordLength < 7){
    return false
  }
  if(passwordLength >=7){
    return true
  }
  if(passwordLength > 15){
    return false
  }
}

module.exports = {validatePassword,validateUserName}