import 'package:flutter/material.dart';
import 'package:west_coast_coupons/sources/home.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //auto navigate to home screen after 2 seconds
    //delay function is used to delay the screen for known time-period
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) {
            return Home();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: AssetImage("assets/splash_screen_complete.png"),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
