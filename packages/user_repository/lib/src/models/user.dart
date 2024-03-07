
import '../entities/entities.dart';

class MyUser{
  String id;
  String email;
  String name;
  bool hasActiveCart;

  MyUser({required this.name, required this.email, required this.id, required this.hasActiveCart});
  static final empty = MyUser(name: '', email: '', id: '', hasActiveCart: false);

  MyUserEntity toEntity(){
    return MyUserEntity(name: name, email: email, id: id, hasActiveCart: hasActiveCart);
  }

  factory MyUser.fromEntity(MyUserEntity entity) => MyUser(name: entity.name, email: entity.email, id: entity.id, hasActiveCart: entity.hasActiveCart);

  @override
  String toString() {
    return 'MyUser<id:$id email:$email>';
  }
}