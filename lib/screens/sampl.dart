// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main(){
//   runApp(DevicePreview(builder: (BuildContext context)=>GetMaterialApp(home: Nutriprofile(),)));
// }
//
// class Nutrireg extends StatefulWidget{
//   @override
//   State<Nutrireg> createState() => _NutriregState();
// }
//
// class _NutriregState extends State<Nutrireg> {
//
//   final CollectionReference login=FirebaseFirestore.instance.collection('nutri');
//   String? name;
//   String? email;

//   bool showpass=true;
//   String? phone;
//   String? age;
//   String? calo;
//   String? location;
//   String? datetime=DateTime.now().toString();
//   final List<String> genderItems = [
//     'Male',
//     'Female',
//     'Prefer Not to say'
//   ];
//   String? gender;
//
//   final List<String> mealpref = [
//     'Vegetarian',
//     'Non-vegetarian',
//     'Vegan'
//   ];
//   String? choice;
//
//   final List<String> weightpref = [
//     'Weight Gain',
//     'Weight Loss',
//     'Maintenance'
//   ];
//   String? fitness;
//
//   final List<String> listmeal = [
//     'One',
//     'Two',
//     'Three',
//     'Four'
//   ];
//   String? mealnum;
//
//   final List<String> workoutpref = [
//     'Not doing any workout',
//     'Lightly active',
//     'Moderateley active',
//     'Very active',
//   ];
//   String? workout;

//   String? password;
//   TextEditingController names=TextEditingController();
//
//   void adduser(){
//     final data={'fname':names.text,'femail':email,'fphone':phone,'fage':age,'fcalo':calo,'flocation':location,
//       'fgender':gender,'fchoice':choice,'ffitness':fitness,'fmeannum':mealnum,'fworkout':workout};
//     login.add(data);
//   }
//   @override
//   GlobalKey<FormState>formkey=GlobalKey();
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Nutrichef",style: TextStyle(color: Colors.green),),
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: formkey,
//           child: Column(
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height*0.1,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: TextFormField(
//                   controller: names,
//                   decoration: InputDecoration(
//                   hintText: "Name",
//                   prefixIcon: Icon(Icons.person),
//                   filled: true,
//                   fillColor: Colors.greenAccent.withOpacity(0.3),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide.none,
//                   )
//                 ),
//                   validator: (valname) {
//                     if (valname!.isEmpty) {
//                       return "Enter Name";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (rname) {
//                     name = rname;
//                   },
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: TextFormField(decoration: InputDecoration(
//                   hintText: "Email-It will be the username",
//                   prefixIcon: Icon(Icons.email),
//                   filled: true,
//                   fillColor: Colors.greenAccent.withOpacity(0.3),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide.none,
//                   )
//                 ),
//                   validator: (valemail) {
//                     if (valemail!.isEmpty || !valemail.contains("@") || !valemail.contains(".") ) {
//                       return "Enter Email";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (mail) {
//                     email = mail;
//                   },
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.digitsOnly],
//                   maxLength: 10,
//                   decoration: InputDecoration(
//                     hintText: "Phone Number",
//                     prefixIcon: Icon(Icons.phone),
//                     filled: true,
//                     fillColor: Colors.greenAccent.withOpacity(0.3),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide.none,
//                     )
//                 ),
//                   validator: (valphone) {
//                     if (valphone!.isEmpty) {
//                       return "Enter Phone Number";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (pnum) {
//                     phone = pnum;
//                   },
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     inputFormatters: <TextInputFormatter>[
//                     FilteringTextInputFormatter.digitsOnly],
//                     maxLength: 2,
//                     decoration: InputDecoration(
//                     hintText: "Age",
//                     prefixIcon: Icon(Icons.person_search),
//                     filled: true,
//                     fillColor: Colors.greenAccent.withOpacity(0.3),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide.none,
//                     )
//                 ),
//                   validator: (valage) {
//                     if (valage!.isEmpty) {
//                       return "Enter Age";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (agee) {
//                     age = agee;
//                   },
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: TextFormField(decoration: InputDecoration(
//                     hintText: "Location",
//                     prefixIcon: Icon(Icons.location_pin),
//                     filled: true,
//                     fillColor: Colors.greenAccent.withOpacity(0.3),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide.none,
//                     )
//                 ),
//                   validator: (vallocation) {
//                     if (vallocation!.isEmpty) {
//                       return "Enter Location";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (loc) {
//                     location = loc;
//                   },
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.digitsOnly],
//                   maxLength: 4,
//                   decoration: InputDecoration(
//                     hintText: "How much calories you want",
//                     prefixIcon: Icon(Icons.sports_gymnastics),
//                     filled: true,
//                     fillColor: Colors.greenAccent.withOpacity(0.3),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide.none,
//                     )
//                 ),
//                   validator: (valcalo) {
//                     if (valcalo!.isEmpty) {
//                       return "Enter Some value";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (calor) {
//                     calo = calor;
//                   },
//                 ),
//               ),
//              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
//              /// here start next
//               const SizedBox(height: 8,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: DropdownButtonFormField2<String>(
//                   // style: TextStyle(
//                   //   color: Colors.greenAccent
//                   // ),
//                   isExpanded: true,
//                   decoration: InputDecoration(
//                     // Add Horizontal padding using menuItemStyleData.padding so it matches
//                     // the menu padding when button's width is not specified.
//                     contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     // Add more decoration..
//                   ),
//                   hint: const Text(
//                     'Select Your Gender',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   items: genderItems
//                       .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(item,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ))
//                       .toList(),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select gender.';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     //Do something when selected item is changed.
//                   },
//                   onSaved: (value) {
//                     gender = value.toString();
//                   },
//                   buttonStyleData: const ButtonStyleData(
//                     padding: EdgeInsets.only(right: 8),
//                   ),
//                   iconStyleData: const IconStyleData(
//                     icon: Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.black45,
//                     ),
//                     iconSize: 24,
//                   ),
//                   dropdownStyleData: DropdownStyleData(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   menuItemStyleData: const MenuItemStyleData(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: DropdownButtonFormField2<String>(
//                   isExpanded: true,
//                   decoration: InputDecoration(
//                     // Add Horizontal padding using menuItemStyleData.padding so it matches
//                     // the menu padding when button's width is not specified.
//                     contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     // Add more decoration..
//                   ),
//                   hint: const Text(
//                     'Meal Preferance',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   items: mealpref
//                       .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(item,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ))
//                       .toList(),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a choice';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     //Do something when selected item is changed.
//                   },
//                   onSaved: (value) {
//                     choice = value.toString();
//                   },
//                   buttonStyleData: const ButtonStyleData(
//                     padding: EdgeInsets.only(right: 8),
//                   ),
//                   iconStyleData: const IconStyleData(
//                     icon: Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.black45,
//                     ),
//                     iconSize: 24,
//                   ),
//                   dropdownStyleData: DropdownStyleData(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   menuItemStyleData: const MenuItemStyleData(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: DropdownButtonFormField2<String>(
//                   isExpanded: true,
//                   decoration: InputDecoration(
//                     // Add Horizontal padding using menuItemStyleData.padding so it matches
//                     // the menu padding when button's width is not specified.
//                     contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     // Add more decoration..
//                   ),
//                   hint: const Text(
//                     'Number of meal per day',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   items:listmeal
//                       .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(item,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ))
//                       .toList(),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a choice';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     //Do something when selected item is changed.
//                   },
//                   onSaved: (value) {
//                     mealnum = value.toString();
//                   },
//                   buttonStyleData: const ButtonStyleData(
//                     padding: EdgeInsets.only(right: 8),
//                   ),
//                   iconStyleData: const IconStyleData(
//                     icon: Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.black45,
//                     ),
//                     iconSize: 24,
//                   ),
//                   dropdownStyleData: DropdownStyleData(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   menuItemStyleData: const MenuItemStyleData(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: DropdownButtonFormField2<String>(
//                   isExpanded: true,
//                   decoration: InputDecoration(
//                     // Add Horizontal padding using menuItemStyleData.padding so it matches
//                     // the menu padding when button's width is not specified.
//                     contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     // Add more decoration..
//                   ),
//                   hint: const Text(
//                     'How often exercise per week',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   items: workoutpref
//                       .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(item,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ))
//                       .toList(),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a option.';
//                     }
//                     return null;
//                   },
//                   onChanged: (value) {
//                     //Do something when selected item is changed.
//                   },
//                   onSaved: (value) {
//                     workout = value.toString();
//                   },
//                   buttonStyleData: const ButtonStyleData(
//                     padding: EdgeInsets.only(right: 8),
//                   ),
//                   iconStyleData: const IconStyleData(
//                     icon: Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.black45,
//                     ),
//                     iconSize: 24,
//                   ),
//                   dropdownStyleData: DropdownStyleData(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   menuItemStyleData: const MenuItemStyleData(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child:TextFormField(
//                   obscureText: showpass,
//                   obscuringCharacter: "*",
//                   decoration: InputDecoration(hintText: "password",
//                     filled: true,
//                     fillColor: Colors.greenAccent.withOpacity(0.4),
//                     prefixIcon: Icon(Icons.password_sharp),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(20)
//                         ),
//                         borderSide: BorderSide.none
//                     ),
//                   ),
//                   validator: (passvalue) {
//                     if (passvalue!.isEmpty) {
//                       return "Enter Password";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (userpass) {
//                     password = userpass;
//                   },
//                 ),
//               ),
//               ElevatedButton(onPressed: () {
//                 adduser();
//                 Navigator.pop(context);
//                 // if(formkey.currentState!.validate()){
//                 //   formkey.currentState!.save();
//                 // }
//               }, child: const Text("Register")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }