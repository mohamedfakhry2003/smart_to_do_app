// import 'package:supabase_flutter/supabase_flutter.dart';

// class SupabaseAuth {
//   Future<String> signUp(String email, String password) async {
//     final response = await Supabase.instance.client.auth.signUp(
//       email: email,
//       password: password,
//     );
//     return response.user != null
//         ? "Registration successful"
//         : "Registration failed";
//   }

//   Future<String> signIn(String email, String password) async {
//     final response = await Supabase.instance.client.auth.signInWithPassword(
//       email: 'example@email.com',
//       password: 'example-password',
//     );
//     return response.user != null
//         ? "Registration successful"
//         : "Registration failed";
//   }
// }
