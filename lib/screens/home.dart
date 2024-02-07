import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri/screens/about.dart';
import 'package:nutri/screens/contact.dart';
import 'package:nutri/screens/feed.dart';
import 'package:nutri/screens/form.dart';
import 'package:nutri/screens/login.dart';

import '../helper/help.dart';


class Nutrihome extends StatefulWidget{
  @override
  State<Nutrihome> createState() => _NutrihomeState();
}

class _NutrihomeState extends State<Nutrihome> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        "Can't go back",),backgroundColor: Colors.red,
      )
      );return false;
        },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nutri Home",style: TextStyle(color: Colors.greenAccent),),
          backgroundColor: Colors.black,),
        body: Stack(
          children: [
            Positioned(child: Container(color: Colors.blue.withOpacity(0.3),height:MediaQuery.of(context).size.height,width:MediaQuery.of(context).size.width,)),
           // Positioned(child: Image(image: AssetImage("assetes/solaare.jpg",),fit: BoxFit.fill,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,)),
            Positioned(child:ElevatedButton(
              onPressed: () {},
              child: Text("Nutrichef",style: TextStyle(color: Colors.black,fontSize: 23),),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(65),
              ),
            ),top: MediaQuery.of(context).size.height*0.30,right: MediaQuery.of(context).size.width*.60 ),
            Positioned(child:ElevatedButton(
              onPressed: () {
                Get.to(()=>Nutriform());
              },
              child: Text("Start here",style: TextStyle(color: Colors.black,fontSize: 18),),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(35),
              ),
            ),top: MediaQuery.of(context).size.height*0.1,left: MediaQuery.of(context).size.width*0.1 ),
            Positioned(child:ElevatedButton(
              onPressed: () {
                Get.to(()=>Nutrifeed());
              },
              child: Text("Feedback",style: TextStyle(color: Colors.black,fontSize: 18),),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(35),
              ),
            ),top: MediaQuery.of(context).size.height*0.23,left: MediaQuery.of(context).size.width*0.4 ),
            Positioned(child:ElevatedButton(
              onPressed: () {
                Get.to(()=>Nutriabt1());
              },
              child: Text("About",style: TextStyle(color: Colors.black,fontSize: 18),),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(35),
              ),
            ),top: MediaQuery.of(context).size.height*0.35,left: MediaQuery.of(context).size.width*0.5),
            Positioned(child:ElevatedButton(
              onPressed: () {
                Get.to(()=>Nutricont());
              },
              child: Text("Contact",style: TextStyle(color: Colors.black,fontSize: 18),),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(35),
              ),
            ),top: MediaQuery.of(context).size.height*0.46,left: MediaQuery.of(context).size.width*0.40 ),
            Positioned(child:ElevatedButton(
              onPressed: () {
                   FireHelper().signOut().then((v) {
                    Get.to(nutrilog());
                   });
                     },
              child: Text("Logout",style: TextStyle(color: Colors.black,fontSize: 18),),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(35),
              ),
            ),top: MediaQuery.of(context).size.height*0.56,left: MediaQuery.of(context).size.width*0.1 ),
            // ElevatedButton(onPressed: (){
            //   FireHelper().signOut().then((v) {
            //     Get.to(nutrilog());
            //   });
            // }, child: Text("Logout")
            // ),
          ],
        ),
      ),
    );
  }
}