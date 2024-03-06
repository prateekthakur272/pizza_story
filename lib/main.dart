import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizza_story/app.dart';
import 'package:pizza_story/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlockObserver();
  runApp(App(FirebaseUserRepository()));
}