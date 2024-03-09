import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'package:pizza_story/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_story/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_story/screens/auth/views/welcome_screen.dart';
import 'package:pizza_story/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_story/screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pizza Story',
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => SignInBloc(context.read<AuthenticationBloc>().userRepository)),
                  BlocProvider(create: (_) => GetPizzaBloc(FirebasePizzaRepo())..add(GetPizza()),),
                ],
                child: const HomeScreen());
            }
            return const WelcomeScreen();
          },
        ),
        theme: ThemeData(
            colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        )));
  }
}
