import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nutri/screens/home.dart';

class Nutriform extends StatefulWidget{
  @override
  State<Nutriform> createState() => _NutriprofileState();
}

class _NutriprofileState extends State<Nutriform> {
  FirebaseAuth auth=FirebaseAuth.instance;
  User? user;
  final namecontrol=TextEditingController();
  final phonecontrol=TextEditingController();

  bool showpass=true;

  final agecontrol=TextEditingController();
  final caloricontrol=TextEditingController();
  final locationcontrol=TextEditingController();
  final datetime=DateTime.now().toString();

  final List<String> genderItems = [
    'Male',
    'Female',
    'Prefer Not to say'
  ];
   String? gender;

  final List<String> mealpref = [
    'Vegetarian',
    'Non-vegetarian',
    'Vegan'
  ];
  String? choice;

  final List<String> weightpref = [
    'Weight Gain',
    'Weight Loss',
    'Maintenance'
  ];
  String? fitness;

  final List<String> listmeal = [
    'One',
    'Two',
    'Three',
    'Four'
  ];
  String? mealnum;

  final List<String> workoutpref = [
    'Not doing any workout',
    'Lightly active',
    'Moderateley active',
    'Very active',
  ];
  String? workout;
  @override
  void initState(){
    super.initState();
    if(auth.currentUser!=null)
      {
        user=auth.currentUser;
      }
  }
  @override
  GlobalKey<FormState>formkey=GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form",style: TextStyle(color: Colors.greenAccent),),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              //Text('Main : ${user?.email}'),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: namecontrol,
                  decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person_outlined),
                    filled: true,
                    fillColor: Colors.greenAccent.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    )
                  ),
                  validator: (valname){
                    if(valname!.isEmpty){
                      return "Enter Name";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: phonecontrol,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly],
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      prefixIcon: Icon(Icons.perm_contact_calendar),
                      filled: true,
                      fillColor: Colors.greenAccent.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      )
                  ),
                  validator: (valage) {
                    if (valage!.isEmpty) {
                      return "Enter Phone number";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: agecontrol,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly],
                    maxLength: 2,
                    decoration: InputDecoration(
                    hintText: "Age",
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    filled: true,
                    fillColor: Colors.greenAccent.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    )
                ),
                  validator: (valage) {
                    if (valage!.isEmpty) {
                      return "Enter Age";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: locationcontrol,
                  decoration: InputDecoration(
                    hintText: "Location",
                    prefixIcon: Icon(Icons.location_pin),
                    filled: true,
                    fillColor: Colors.greenAccent.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    )
                ),
                  validator: (vallocation) {
                    if (vallocation!.isEmpty) {
                      return "Enter Location";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: caloricontrol,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly],
                  maxLength: 4,
                  decoration: InputDecoration(
                    hintText: "How much calories you want",
                    prefixIcon: Icon(Icons.sports_gymnastics),
                    filled: true,
                    fillColor: Colors.greenAccent.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    )
                ),
                  validator: (valcalo) {
                    if (valcalo!.isEmpty) {
                      return "Enter a value";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
             SizedBox(height: MediaQuery.of(context).size.height*0.01,),
             /// here start next
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonFormField2<String>(
                  // style: TextStyle(
                  //   color: Colors.greenAccent
                  // ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  hint: const Text(
                    'Select Your Gender',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    gender = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  hint: const Text(
                    'Fitness goal',
                    style: TextStyle(fontSize: 14),
                  ),
                  items:weightpref
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a choice';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    fitness = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  hint: const Text(
                    'Meal Preferance',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: mealpref
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a choice';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    choice = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  hint: const Text(
                    'Number of meal per day',
                    style: TextStyle(fontSize: 14),
                  ),
                  items:listmeal
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a choice';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    mealnum = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  hint: const Text(
                    'How often exercise per week',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: workoutpref
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a option.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    workout = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                if(formkey.currentState!.validate()) {
                   formkey.currentState!.save();
                 }
                final CollectionReference login=FirebaseFirestore.instance.collection('nutri');
                login.add({
                  'name':namecontrol.text,
                  'phonenum':phonecontrol.text,
                  'age':agecontrol.text,
                  'calorie':caloricontrol.text,
                  'location':locationcontrol.text,
                  'gender':gender,
                  'choice':choice,
                  'fitness':fitness,
                  'mealnum':mealnum,
                  'workout':workout,
                  'date':datetime,
                }
                );Get.to(()=>Nutrihome());
                //     .then((value) {
                //   if(value == null){
                //     Get.to(()=>Nutrihome());
                //   }else{
                //     Get.snackbar("Error", value as String);
                //   }
                // });
              }, child: Text("Done")),
            ],
          ),
        ),
      ),
    );
  }
}