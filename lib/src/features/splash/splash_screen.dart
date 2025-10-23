import 'dart:async';

import 'package:eticket/session_manager.dart';
import 'package:eticket/src/core/utils/context.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';
import 'package:is_first_run/is_first_run.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final SessionManager prefs = SessionManager();

  /// Checks if the app is being run for the first time and navigates accordingly.
  void loginCheck() async {
    // Check if this is the first time the user runs the app
    bool isFirstRun = await IsFirstRun.isFirstRun();

    // Introduce a delay of 1 seconds before navigating
    Timer(const Duration(seconds: 1), () async {
      if (!isFirstRun) {
        // Navigate based on login status
        if (await prefs.getLogin()) {
          // Fetch user information and navigate to the Dashboard
          String? authToken = await prefs.getAuthToken();
          if(authToken.isNotEmpty){
            context.fadePushRemoveUntil(  const HomeScreen());
          }else{
            context.fadePushRemoveUntil( LogInScreen());
          }
        } else {
          // Navigate to SignInPage if not logged in
          context.fadePushRemoveUntil( LogInScreen());
        }
      } else {
        // Set login status to false for the first run and navigate to SignInPage
        await prefs.setLogin(false);
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginCheck();

    // Future.delayed(const Duration(seconds: 3), () {
    //   context.fadePushRemoveUntil( LogInScreen());
    //   //context.fadePushRemoveUntil(  const HomeScreen());
    //   // Navigator.of(context).pushReplacement(
    //   //   MaterialPageRoute(builder: (context) => const HomeScreen()),
    //   // );
    // });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0000FF),
                  //Color(0xFFFFFFFF),
                  //Color(0xFF4467C4),
                  Color(0xFFFFFFFF),
                ]
            )
        ),
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/paymentSuccess.png',
                  height: 200,
                ),
               // SvgPicture.asset(AllImage.eye, height: 200, width: 200,),
              ],
            )
        ),
      ),
    );
  }
}
