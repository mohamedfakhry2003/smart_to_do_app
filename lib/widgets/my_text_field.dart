import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.lableText,
    required this.hintText,
    required this.isPassword,
    required this.controller,
  });
  final String lableText;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      height: 60,
      child: Card(
        elevation: 2,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              borderSide: BorderSide.none,
            ),
            labelText: lableText,
            hintText: hintText,
          ),
          style: TextStyle(fontSize: 18, color: Colors.black),
          cursorColor: Colors.blue,
          keyboardType: isPassword
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
        ),
      ),
    );
  }
}
