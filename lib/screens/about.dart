import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class Nutriabt1 extends StatelessWidget{
  Nutriabt1({super.key});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Nutrichef",style: TextStyle(color: Colors.greenAccent),),
       backgroundColor: Colors.black,
     ),
     body: SingleChildScrollView(
       child: Container(color: Colors.pinkAccent.withOpacity(0.2),height: MediaQuery.of(context).size.height,
         child: Column(
           children: [
             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
             Text("About Us",style: TextStyle(fontSize:20),),
             SizedBox(height: MediaQuery.of(context).size.height*0.01,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Nutrichef is a Kochi-based healthy meal delivery kitchen that delivers calorie-controlled meals which take care of your body’s daily nutritional needs without compromising on taste and helps you get closer to your fitness goals.",
               style: TextStyle(color: Colors.black),),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
             Text("Why We Started",style: TextStyle(fontSize: 20),),
             SizedBox(height: MediaQuery.of(context).size.height*0.01,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Food and drinks a person consumes on regular basis is known as DIET. There are many who try shortcuts and follow crash diet plans for body transformation, which may show fast result, but when we stop following those plans, things will get worse. Many retained their previous body version when they went back to their normal eating habits. there is no shortcuts for success. So our vision is to build the healthy habit of  ‘EAT RIGHT EVERYDAY’ among people.",
               style: TextStyle(color: Colors.black),),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(" There is a myth that healthy want be tasty, Thus we focus on delivering healthy meals on -time without compromising taste and quality at reasonable price.",
               style: TextStyle(color: Colors.black),),
             ),
             TextButton(onPressed: (){
               Get.to(()=>Nutriabt2());
             }, child: Text("More"))
           ],
         ),
       ),
     )
   );
  }

}
class Nutriabt2 extends StatelessWidget{
  Nutriabt2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nutrichef",style: TextStyle(color: Colors.greenAccent),),
      backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(color: Colors.pinkAccent.withOpacity(0.2),height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.08,),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                  FaIcon(FontAwesomeIcons.list),
                  SizedBox(width: 20,),
                  Text("Nutrition Labelling",style: TextStyle(
                    fontSize: 18
                  ),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Nutritional information like fat, carbs, protein and calories will be mentioned in every meal to keep track of food to achieve your fitness goal."),
              ),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.2,height: MediaQuery.of(context).size.height*0.1,),
                  FaIcon(FontAwesomeIcons.jar),
                  SizedBox(width: 20,),
                  Text("Variety In Recipes",style: TextStyle(
                    fontSize:18
                  ),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("We focus on product improvement by creating new healthy recipes with fresh ingredients. Healthy and tasty enough to satisfy your cravings!"),
              ),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.2,height: MediaQuery.of(context).size.height*0.1,),
                  FaIcon(FontAwesomeIcons.truck),
                  SizedBox(width: 20,),
                  Text("Customer Service",style: TextStyle(
                    fontSize: 18
                  ),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("We ensure on-time meal delivery and dedicated customer support team engagement for feedback and support. Customer satisfaction is our priority!"),
              ),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.2,height: MediaQuery.of(context).size.height*0.1,),
                  FaIcon(FontAwesomeIcons.lock),
                  SizedBox(width: 20,),
                  Text("Eco-Friendly Packaging"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Here at Nutrichef, we are committed to minimise the usage of plastics from cooking to food delivery for a reason that you know!"),
              ),
              TextButton(onPressed: (){
                Get.to(()=>Nutriabt1());
              }, child: Text("Back"))
            ],
          ),
        ),
      ),
    );
  }

}