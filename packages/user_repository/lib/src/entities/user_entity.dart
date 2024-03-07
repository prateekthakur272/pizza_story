class MyUserEntity{
  String id;
  String name;
  String email;
  bool hasActiveCart;

  MyUserEntity({required this.id, required this.name, required this.email, required this.hasActiveCart});

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'hasActiveCart':hasActiveCart
    };
  }

  factory MyUserEntity.fromMap(Map<String, dynamic> map){
    return MyUserEntity(id: map['id'], name: map['name'], email: map['email'], hasActiveCart: map['hasActiveCarr']??false);
  }
}