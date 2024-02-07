import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nutri/screens/home.dart';
import 'package:nutri/screens/register.dart';

import '../helper/help.dart';
import 'adminhome.dart';


class nutrilog extends StatefulWidget{
  @override
  State<nutrilog> createState() => _nutrilogState();
}

class _nutrilogState extends State<nutrilog> {
  GlobalKey<FormState>formkey=GlobalKey();
  String? username;
  String? password;
  bool showpass=true;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(style: TextStyle(color: Colors.green),"Nutrichef"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                Text("Login",style: TextStyle(fontSize: 55,color: Colors.green,
                ),),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:50 ),
                  child: TextFormField(decoration: InputDecoration
                    (hintText: "username",
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      fillColor:Colors.greenAccent.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20),
                          ),borderSide: BorderSide.none,
                      )
                    //borderSide: BorderSide.none,
                  ),
                    validator: (namevalue) {
                      if (namevalue!.isEmpty) {
                        return "Enter Name";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (usernam) {
                      username = usernam;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
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
                  child: ElevatedButton(onPressed: (){
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();

                     if (username == 'nutri@admin.com' &&
                        password == '8606611058') {
                      Get.to(() => Nutrihom2());
                    } else {
                      FireHelper()
                          .signIn(mail: username!, pass: password!)
                          .then((value) {
                        if (value == null) {
                          Get.to(Nutrihome());
                        } else {
                          Get.snackbar("Error", "User not found $value");
                        }
                      });
                    }
                  }
                },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF000000)
                      ),
                      child: Text("Login",style: TextStyle(color: Colors.green),)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                TextButton(onPressed: (){
                  Get.to(()=>Nutrireg());
                }, child: Text("Don't have an account! Register"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                // TextButton(onPressed: (){
                //   Get.to(()=>Nutriadmin());
                // }, child: Text("Admin"))
              ],
            ),
          )
      ),
    );
  }
}