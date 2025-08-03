import 'package:flutter/material.dart';

class MytasksRow extends StatelessWidget {
  const MytasksRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(Icons.done_outlined, size: 40, color: Colors.white),
        ),
        SizedBox(width: 10),
        Text("My Tasks+", style: TextStyle(fontSize: 30)),
      ],
    );
  }
}
