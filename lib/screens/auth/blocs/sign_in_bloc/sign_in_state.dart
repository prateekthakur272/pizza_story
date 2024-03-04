part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();
  
  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInInFailure extends SignInState {}
final class SignInInLoading extends SignInState {}
final class SignInInSuccess extends SignInState {}
