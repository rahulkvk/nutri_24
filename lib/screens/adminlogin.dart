// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../helper/help.dart';
// import 'adminhome.dart';
//
//
//
// class Nutriadmin extends StatelessWidget{
//   String? usercontrol;
//   String? passcontrol;
//   @override
//   GlobalKey<FormState>formkey=GlobalKey();
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Admin",style: TextStyle(color: Colors.green),),
//         backgroundColor: Colors.black,
//       ),
//       body: Form(
//         key: formkey,
//         child: Column(
//           children: [
//             SizedBox(height: MediaQuery.of(context).size.height*0.2,),
//             Text("Login",style: TextStyle(fontSize: 20),),
//             SizedBox(height: MediaQuery.of(context).size.height*0.03,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//               child: TextFormField(
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                 hintText: "Username",
//                 filled: true,
//                 fillColor: Colors.greenAccent.withOpacity(0.3),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 )
//               ),
//                 validator: (valuser){
//                 if(valuser!.isEmpty){
//                   return "Enter username";
//                 }else{
//                   return null;
//                 }
//                 },
//                 onSaved: (userval){
//                   usercontrol=userval;
//                 },
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50),
//               child: TextFormField(
//                 obscuringCharacter: '*',
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                 hintText: "Password",
//                 filled: true,
//                 fillColor: Colors.greenAccent.withOpacity(0.3),
//
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20)
//                 )
//               ),
//                 validator: (valpass){
//                 if(valpass!.isEmpty){
//                   return "Enter password";
//                 }else return null;
//                 },
//                 onSaved: (passval){
//                   passcontrol=passval;
//                 },
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//             TextButton(onPressed: (){
//               if(formkey.currentState!.validate()){
//                 formkey.currentState!.save();
//                 FireHelper().signIn(mail: usercontrol!, pass: passcontrol!).then((value){
//                   if(value == null){
//                     Get.to(()=>Nutrihom2());
//                   }else{
//                     Get.snackbar("Error", "User not found $value");
//                   }
//                 });
//               }
//             }, child: Text("Login"))
//           ],
//         ),
//       )
//     );
//   }
//
// }