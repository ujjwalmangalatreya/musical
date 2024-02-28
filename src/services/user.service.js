
const checkUserNameEmpty = (username)=>{
  return !(username === "" || username === null);
}
const  checkPasswordEmpty =(password)=>{
  return !(password === "" || password === null);
}



const checkPasswordValidations = (password) => { 
  // const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
  // console.log(passwordRegex.test(password));
  // return !passwordRegex.test(password);
}

module.exports = {checkUserNameEmpty,checkPasswordEmpty,checkPasswordValidations}