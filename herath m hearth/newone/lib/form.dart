import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:convert';
import 'package:newone/form.dart';
import 'package:flutter/services.dart';
import 'package:newone/login_page.dart';
import 'package:newone/profile_setting.dart';
import 'package:newone/result.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class formpage extends StatefulWidget {
  const formpage({super.key});

  @override
  State<formpage> createState() => _formpageState();
}

// ignore: camel_case_types
class _formpageState extends State<formpage> {
  var currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 253, 255, 1),
      appBar: AppBar(
        title: const Text('Details Form'),
         backgroundColor: Color.fromARGB(255, 74, 200, 234),
        
      ),
      body: Center(
        child: Container(
          width: displayWidth * 0.87,
          height: displayHeight * 0.75,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(60, 90, 153, 1),
              borderRadius: BorderRadius.circular(23)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildAge(),
                buildBP(),
                buildSpecificGravity(),
                buildAlbumin(),
                buildRBC(),
                buildPusCell(),
                buildPusCellClumps(),
                buildBacteria(),
                buildBloodGlucose(),
                buildBloodUrea(),
                buildSodium(),
                buildPotassium(),
                buildHemoglobin(),
                buildPackedCell(),
                buildWBC(),
                buildRBCCount(),
                buildHyperTension(),
                buildDiabetesMell(),
                buildCoronaryArteryDisease(),
                buildAppetite(),
                buildPedalEdema(),
                buildAnemia(),
                buildClass(),
                buildSugar(),
                blackButton('CHECK', () {
                  // Navigate to a new screen or activity
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => result()));
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(displayHeight * 0.04, displayWidth * 0.05,
            displayHeight * 0.05, displayWidth * 0.04),
        height: displayHeight * 0.06,
        width: displayWidth * 0.8,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 74, 200, 234),
            borderRadius: BorderRadius.circular(50)),
        child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth * 0.1),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => formpage(),
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
                    //   duration: const Duration(seconds: 1),
                    //   curve: Curves.fastLinearToSlowEaseIn,
                    //   width: index == currentIndex
                    //       ? displayWidth * 0.31
                    //       : displayWidth * 0.3,
                    //   alignment: Alignment.center,
                    //   child: AnimatedContainer(
                    //     duration: const Duration(seconds: 1),
                    //     curve: Curves.fastLinearToSlowEaseIn,
                    //     height: index == currentIndex ? displayWidth * 0.12 : 0,
                    //     width: index == currentIndex ? displayWidth * 0.32 : 0,
                    //     decoration: BoxDecoration(
                    //       color: index == currentIndex
                    //           ? const Color.fromRGBO(248, 248, 248, 0.5)
                    //           : const Color.fromARGB(255, 255, 255, 255),
                    //       borderRadius: BorderRadius.circular(50),
                    //     ),
                    //   ),
                    // ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * 0.45
                          : displayWidth * 0.18,
                      alignment: Alignment.center,
                      child: Stack(children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * 0.15
                                  : 0,
                            ),
                           
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * 0.05
                                  : 20,
                            ),
                            Icon(listOfIcons[index],
                                size: 30,
                                color: index == currentIndex
                                    ? Colors.black87
                                    : Colors.black45)
                          ],
                        )
                      ]),
                    )
                  ],
                )
                )
                ),
                
      ),

    );
  }
}

List<String> listOfStrings = [
  'Home',
  'Profile',
];

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.account_circle_rounded,
];



Widget buildAge() {
  
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Age',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildBP() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Blood Pressure',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildSpecificGravity() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Specific Gravity',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildAlbumin() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Albumin',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            
          ),
         
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildRBC() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Red Blood Cells',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildPusCell() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Pus Cell',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildPusCellClumps() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Pus Cell Clumps',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildBacteria() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Bacteria',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildBloodGlucose() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Blood Glucose',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildBloodUrea() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Blood Urea',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildSodium() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Sodium',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildPotassium() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Potassium',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildHemoglobin() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Hemoglobin',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildPackedCell() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Packed Cell Volume',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildWBC() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'White Blood Cell Count',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildRBCCount() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Red Blood Cell Count',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildHyperTension() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Hyper Tension',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildDiabetesMell() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Diabetes Mellitus',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildCoronaryArteryDisease() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Coronary Artery Disease',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildAppetite() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Appetite',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildPedalEdema() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Pedal Edema',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildAnemia() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Anemia',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildClass() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Class',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget buildSugar() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        height: 40,
        width: 280,
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Sugar',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget blackButton(String title, Function onPressed) {
  final _resultState = MaterialPageRoute(builder: (context) => const result());
  return MaterialButton(
    minWidth: 600,
    
    height: 55,
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Colors.black,
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}


