import 'package:flutter/material.dart';
import 'package:west_coast_coupons/sources/splash.dart';

void main() {
  runApp(
    MaterialApp(
      home: WestCoastCoupons(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class WestCoastCoupons extends StatefulWidget {

  @override
  State<WestCoastCoupons> createState() => _WestCoastCouponsState();
}

class _WestCoastCouponsState extends State<WestCoastCoupons> {
  Widget Potrait(){
    return Splash();
  }
  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}
