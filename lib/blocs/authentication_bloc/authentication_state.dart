part of 'authentication_bloc.dart';

// sealed class AuthenticationState extends Equatable {
//   const AuthenticationState();
  
//   @override
//   List<Object> get props => [];
// }

// final class AuthenticationInitial extends AuthenticationState {}

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  unknown
}

class AuthenticationState extends Equatable{
  final AuthenticationStatus status;
  final MyUser? user;

  const AuthenticationState._({this.status = AuthenticationStatus.unknown, this.user});
  const AuthenticationState.unknown(): this._();
  const AuthenticationState.authenticated(MyUser user):this._(user: user, status: AuthenticationStatus.authenticated);
  const AuthenticationState.unauthenticated(): this._(status: AuthenticationStatus.unauthenticated);
  @override
  List<Object?> get props => [status, user];
}