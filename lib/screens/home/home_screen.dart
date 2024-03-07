import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_story/blocs/authentication_bloc/authentication_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.read<AuthenticationBloc>().userRepository.signOut();
        }, child: const Text('Sign Out')),
      ),
    );
  }
}