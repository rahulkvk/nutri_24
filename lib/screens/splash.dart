import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nutri/screens/login.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(home: Nutrisplash(),
    debugShowCheckedModeBanner: false,
  ));

}
class Nutrisplash extends StatefulWidget{
  @override
  State<Nutrisplash> createState() => _NutrisplashState();
}

class _NutrisplashState extends State<Nutrisplash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds:5),(){
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>nutrilog()));
      Get.to(()=>nutrilog());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.blue,
                Colors.cyanAccent
              ],
              stops: [
                0.1,
                1,
                0.1
              ], //begin: Alignment.bottomCenter, //end: Alignment.topCenter
            )
        ),
        child: Center(
          child: Image(image: AssetImage(
            "assetes/nutri_logo.png"),height: 100,width: 100,),
        ),
      )
    );
  }
}