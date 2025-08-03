abstract class MyAuthState {}

class AuthInitial extends MyAuthState {}

class AuthLoading extends MyAuthState {}

class AuthSuccess extends MyAuthState {}

class AuthFailure extends MyAuthState {
  final String message;
  AuthFailure(this.message);
}
