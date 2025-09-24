import 'package:eticket/src/core/utils/context.dart';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.fadePushRemoveUntil( LogInScreen());
      //context.fadePushRemoveUntil(  const HomeScreen());
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
    });
    
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
