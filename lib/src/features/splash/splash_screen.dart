
import 'package:eticket/src/core/utils/context.dart';
import 'package:eticket/src/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.fadePushRemoveUntil(  const HomeScreen());
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Splash Screen ",
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
