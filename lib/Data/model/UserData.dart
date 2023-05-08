
class UserData{
    String firstName;
    String lastName;
    String email;
    String password;
    String phoneNumber;



    UserData(this.firstName,this.lastName,this.email,this.password,this.phoneNumber);
    UserData.getInstance():this("","","","","");

    Map<String,Object> tojson(){
        return {
            "firstName" : firstName,
            "lastName" : lastName,
            "email" : email,
            "password" : password,
            "phoneNumber" : phoneNumber,
            "Array" : [1,2,3,4]
        };
    }


    UserData fromJson(Map json){
        return UserData(json["firstName"],json["lastName"],json["email"],json["password"],json["phoneNumber"]);

    }

}