import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_story/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_story/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_story/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  bool obscurePassword = true;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignInBloc(context.read<AuthenticationBloc>().userRepository),
      child: BlocListener<SignInBloc, SignInState>(
        listener: ((context, state) {
          if (state is SignInSuccess) {
            setState(() {
              signInRequired = false;
            });
          } else if (state is SignInFailure) {
            setState(() {
              signInRequired = false;
            });
          } else if (state is SignInLoading) {
            setState(() {
              signInRequired = false;
              errorMessage = 'Invalid email or password';
            });
          }
        }),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obsecureText: false,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(CupertinoIcons.mail_solid),
                      errorMessage: errorMessage,
                      validatior: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                            .hasMatch(val)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      })),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: obscurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(CupertinoIcons.lock_fill),
                  errorMessage: errorMessage,
                  validatior: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
                        .hasMatch(val)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: obscurePassword
                        ? const Icon(CupertinoIcons.eye)
                        : const Icon(CupertinoIcons.eye_slash),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              !signInRequired
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<SignInBloc>().add(SignInRequired(
                                  emailController.text,
                                  passwordController.text));
                            }
                          },
                          style: TextButton.styleFrom(
                              elevation: 3.0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
