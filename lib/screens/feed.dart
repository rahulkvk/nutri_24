import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri/screens/home.dart';


class Nutrifeed extends StatefulWidget{
  @override
  State<Nutrifeed> createState() => _NutrifeedState();
}

class _NutrifeedState extends State<Nutrifeed> {
  FirebaseAuth auth=FirebaseAuth.instance;
  User? user;
  final feedbcontrol=TextEditingController();
  @override
  GlobalKey<FormState>formkey=GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback",style: TextStyle(color: Colors.greenAccent),),
        backgroundColor: Colors.black,
      ),
      body: Container(color: Colors.pink.withOpacity(0.02),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.3,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: feedbcontrol,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                  hintText: "Write Your Suggestions",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    //borderSide: BorderSide.none
                  )
                ),
                  validator: (valfeed){
                  if(valfeed!.isEmpty){
                    return "Don't leave me blank !";
                  }else{
                    return null;
                  }
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate()){
                  formkey.currentState!.save();
                    }
                final CollectionReference login=FirebaseFirestore.instance.collection('nutri');
                login.add({
                  'feedback':feedbcontrol.text,
                }); Get.to(()=>Nutrihome());
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}