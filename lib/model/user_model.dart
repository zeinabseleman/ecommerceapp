
class UserModel {
  String userId , email , pic , name ;

  UserModel({this.userId,this.email,this.pic,this.name});

  UserModel.fromJson(Map<dynamic , dynamic> map){
    if(map == null){
      return ;
    }

    userId = map['userId'];
    email = map['email'];
    pic = map['pic'];
    name = map['name'];
  }

  toJson(){
    return{
      'userId' : userId,
      'email' : email,
      'pic' : pic,
      'name' : name,
    };
  }

}