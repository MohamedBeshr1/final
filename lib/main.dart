import 'package:e_commerce/features/Auth/views/signin_view.dart';
import 'package:e_commerce/features/Auth/views/signup.dart';
import 'package:e_commerce/features/onboarding/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
