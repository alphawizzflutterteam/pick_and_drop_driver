import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pick_and_drop_driver/Screen/auth/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/nointernetcreen.dart';
import '../dashboard/dashboardScreen.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({Key? key}) : super(key: key);

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    internetConnection();
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/splashbackground.png'))),
child: Center(
  child:   Container(height: 180,width: 180,

    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/splash.png'))),

  ),
),
    );
  }



  var userId;


  void sessionmanage(){

    Future.delayed(Duration(seconds: 3),() async {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      userId=prefs.getString('userId');
      print(userId);
      print(userId.runtimeType);

      if(userId==null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

      }
      else{

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));


      }

    },);



  }

  void internetConnection() async {


    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {


        sessionmanage();

      }
    } on SocketException catch (_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Internetcheck(),));
    }
  }

}
