import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nutri/screens/login.dart';
import '../helper/help.dart';


class Nutrireg extends StatefulWidget{
  @override
  State<Nutrireg> createState() => _NutritemState();
}

class _NutritemState extends State<Nutrireg> {

  final CollectionReference login=FirebaseFirestore.instance.collection('nutri');
  bool showpass=true;

  String? email;

  String? password;
  String? name;

  @override
  GlobalKey<FormState>formkey=GlobalKey();
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nutrichef",style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Text("Register",style: TextStyle(fontSize: 55,color: Colors.green,
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(decoration: InputDecoration(
                    hintText: "username",
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.greenAccent.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    )
                ),
                  validator: (valemail) {
                    if (valemail!.isEmpty || !valemail.contains("@") || !valemail.contains(".") ) {
                      return "Enter Email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (mail) {
                    email = mail;
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child:TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(hintText: "password",
                    filled: true,
                    fillColor: Colors.greenAccent.withOpacity(0.4),
                    prefixIcon: Icon(Icons.password_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)
                        ),
                        borderSide: BorderSide.none
                    ),
                  ),
                  validator: (passvalue) {
                    if (passvalue!.isEmpty) {
                      return "Enter Password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (userpass) {
                    password = userpass;
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              SizedBox(width: MediaQuery.of(context).size.width*0.4,
                child: ElevatedButton(onPressed: () {
                  if(formkey.currentState!.validate()){
                    formkey.currentState!.save();
                    FireHelper().signUp(mail: email!, password :password!).then((value) {
                      if(value == null){
                        Get.to(nutrilog());
                      }else{
                        Get.snackbar("Error", value);
                      }
                    });
                  }
                },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF000000)
                    ),
                    child: const Text("Register",style: TextStyle(color: Colors.green),)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              TextButton(onPressed: (){
                Get.to(nutrilog());
              }, child: Text("Login Here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}