import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class Nutricont extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nutrichef",style: TextStyle(color: Colors.greenAccent),),
        backgroundColor: Colors.black,
      ),
      body: Container(color: Colors.pink.withOpacity(0.2),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Nutrichef help you in your fitness journey by delivering healthy cum tasty – calorie counted meals, customised based on your body’s nutrition requirment."),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                TextButton(onPressed: (){
                  launch('tel:-+91 8714733145');
                }, child: Icon(Icons.call)),
                SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                InkWell(
                  child: FaIcon(FontAwesomeIcons.linkedin),
                  onTap: ()=>launchUrlString('https://in.linkedin.com/in/nutri-chef-938b01247'),
                ),
                SizedBox(width:MediaQuery.of(context).size.width*0.1,),
                InkWell(
                  child: FaIcon(FontAwesomeIcons.instagram),
                  onTap: ()=>launchUrlString("https://www.instagram.com/nutrichefindia/"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}