"use strict"
module.exports = (sequelize,DataTypes)=>{
  const UserDetails = sequelize.define("UserDetails",{
    email :{
      type:DataTypes.String,
      allowNull : false,
      isEmail : true,
      unique : true,
    },
    password : {
      type: DataTypes.STRING,
      allowNull: false,
    }
  });
return UserDetails;

}