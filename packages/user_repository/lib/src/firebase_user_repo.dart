import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository{

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepository({FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try{
      await usersCollection.doc(user.id).set(user.toEntity().toMap());
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser user, String password) async {
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: user.email, password: password);
      user.id = userCredential.user!.uid;
      return user;
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Stream<MyUser> get user {
    return _firebaseAuth.authStateChanges().flatMap((user) async*{
      if(user == null){
        yield MyUser.empty();
      }else{
        yield await usersCollection.doc(user.uid).get().then((data) => MyUser.fromEntity(MyUserEntity.fromMap(data.data()!)));
      }
    });
  }
}