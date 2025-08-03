import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_to_do_app/cubits/auth_cubit.dart';
import 'package:smart_to_do_app/widgets/my_button.dart';
import 'package:smart_to_do_app/widgets/my_text_field.dart';
import 'package:smart_to_do_app/screens/register_screen.dart';
import 'package:smart_to_do_app/widgets/mytasks_row.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MytasksRow(),
          SizedBox(height: 20),
          MyTextField(
            lableText: "Enter Your Email",
            hintText: "Email",
            isPassword: false,
            controller: emailController,
          ),
          MyTextField(
            lableText: "Enter Your Password",
            hintText: "Password",
            isPassword: true,
            controller: passwordController,
          ),
          SizedBox(height: 20),
          BlocProvider(
            create: (context) => AuthCubit(),
            child: MyButton(
              isLogin: true,
              emailController: emailController,
              passwordController: passwordController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text("Sign up"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
