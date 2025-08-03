import 'package:flutter/material.dart';
import 'package:smart_to_do_app/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://nyfgdqswosjbveeftqvu.supabase.co';
const supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im55ZmdkcXN3b3NqYnZlZWZ0cXZ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM5NDkyNzksImV4cCI6MjA2OTUyNTI3OX0.WOW3wTvv5ALRwI7crHuT7uGoYR7qBf9tpW_694QKgd0";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Smart To-Do App',
    );
  }
}
