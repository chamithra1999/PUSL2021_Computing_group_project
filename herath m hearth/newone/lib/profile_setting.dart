// ignore: unnecessary_import
// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, unnecessary_import, implementation_imports, depend_on_referenced_packages, unused_import

import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:newone/green_intro_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import'package:newone/app_colors.dart';


import 'Prediction.dart';
import 'form.dart';

// ignore: camel_case_types
class profilesetting extends StatefulWidget {
  const profilesetting({super.key});

  @override
  State<profilesetting> createState() => _profilesettingState();
}

// ignore: camel_case_types
class _profilesettingState extends State<profilesetting> {
  var currentIndex = 0;

  TextEditingController nameController = TextEditingController(); //name controller for get name
  TextEditingController emailController = TextEditingController();// email controller for get email address
  TextEditingController phonenumberController = TextEditingController();// phone number gor get phone number
  TextEditingController passwordController = TextEditingController(); // pas
  late DatabaseReference dbef;
  @override
  void initState(){
    super.initState();
    dbef = FirebaseDatabase.instance.ref().child('users');
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  getImage(ImageSource source) async {
    XFile? image = await _picker.pickImage(source: source);
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color(0xFFD6FDFF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.25,
              child: Stack(
                children: [
                  greenIntroWidgetWithoutLogos(),

                  // ignore: prefer_const_constructors
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 110,
                      height: 110,
                      // ignore: prefer_const_constructors
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 193, 193, 195),
                        image: DecorationImage(
                            image: AssetImage('assets/images/proimage.jpg'),
                            fit: BoxFit.cover),
                      ),

                      // ignore: prefer_const_constructors
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 210,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 144, 192, 230),
                        radius: 15,
                        // ignore: sort_child_properties_last
                        child: Icon(Icons.edit),
                        foregroundColor: Colors.black,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFieldWidget('User Name', Icons.person, nameController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Name is required!';
                      }
                      if (input.length < 5) {
                        return 'Please enter a valid name!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        'Email ID', Icons.email_rounded, emailController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Email is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Phone Number', Icons.phone, phonenumberController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Phone number is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget('Password', Icons.lock, passwordController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Password is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 50,
                    ),
                     MaterialButton(
                      onPressed: (){
                        Map<String, String> users = {
                          'name':nameController.text,
                          'email':emailController.text,
                          'phonenumber':phonenumberController.text,
                          'password':passwordController.text,
                        };
                        dbef.push().set(users);
                      },
                     )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 74, 200, 234),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .17),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
             if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: '',),
                    ),
                  );
                }
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profilesetting(),
                    ),
                  );
                }
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                // AnimatedContainer(
                //   duration: Duration(seconds: 1),
                //   curve: Curves.fastLinearToSlowEaseIn,
                //   width: index == currentIndex
                //       ? displayWidth * .32
                //       : displayWidth * .40,
                //   alignment: Alignment.center,
                //   child: AnimatedContainer(
                //     duration: Duration(seconds: 1),
                //     curve: Curves.fastLinearToSlowEaseIn,
                //     height: index == currentIndex ? displayWidth * .12 : 0,
                //     width: index == currentIndex ? displayWidth * .32 : 0,
                //     decoration: BoxDecoration(
                //         color: index == currentIndex
                //             ? Color.fromARGB(255, 232, 245, 245).withOpacity(.2)
                //             : Colors.transparent,
                //         borderRadius: BorderRadius.circular(50)),
                //   ),
                // ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .35,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                         
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.black
                                : Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.person_pin,
  ];

  List<String> listOfStrings = [
    'Home',
    'Profile',
  ];
}

// ignore: non_constant_identifier_names
TextFieldWidget(String title, IconData iconData,
    TextEditingController controller, Function validator) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFFD6FDFF),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          validator: (input) => validator(input),
          controller: controller,
          style: GoogleFonts.poppins(
              fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                iconData,
                color: Color.fromARGB(255, 3, 3, 3),
              ),
            ),
            border: OutlineInputBorder(),
          ),
        ),
      )
    ],
  );
}

Widget blackButton(String title, Function onPressed) {
  return MaterialButton(
    minWidth: Get.width,
    height: 50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Color.fromARGB(255, 0, 0, 0),
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
