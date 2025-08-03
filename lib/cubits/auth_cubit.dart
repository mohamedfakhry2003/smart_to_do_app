import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_to_do_app/classes/auth_states.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthCubit extends Cubit<MyAuthState> {
  AuthCubit() : super(AuthInitial());

  final _supabase = Supabase.instance.client;

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure('Invalid credentials'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure('Signup failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
    emit(AuthInitial());
  }
}
