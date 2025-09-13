import 'package:e_commerce/features/Auth/views/Splash/startscrean.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
    static String id = 'SplashScreen';


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Startscrean()),
      );
    });

    return Scaffold(backgroundColor: Colors.white,
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logoipsum-255 1 (1).png",
              width: 350, 
            ),
          ],
        ),
      ),
    );
  }
}
