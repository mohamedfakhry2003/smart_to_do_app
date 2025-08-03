import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_to_do_app/classes/auth_states.dart';
import 'package:smart_to_do_app/cubits/auth_cubit.dart';
import 'package:smart_to_do_app/screens/home_screen.dart';
import 'package:smart_to_do_app/screens/login_screen.dart'; // Replace with your actual home screen

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.isLogin,
    required this.emailController,
    required this.passwordController,
  });

  final bool isLogin;
  String get buttonText => isLogin ? "Log in" : "Sign up";
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, MyAuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthSuccess) {
          isLogin
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                )
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
        }
      },
      builder: (context, state) {
        return Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue,
          ),
          child: state is AuthLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : TextButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email and password required'),
                        ),
                      );
                      return;
                    }

                    if (isLogin) {
                      context.read<AuthCubit>().signIn(email, password);
                    } else {
                      context.read<AuthCubit>().signUp(email, password);
                    }
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
        );
      },
    );
  }
}
