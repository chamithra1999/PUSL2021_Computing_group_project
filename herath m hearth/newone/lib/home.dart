import 'package:flutter/material.dart';
// ignore: unused_import

// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:newone/login_page.dart';

// ignore: use_key_in_widget_constructors
class MyHome extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 252, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Container(
                height: 350,
                width: 350,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    shape: BoxShape.circle, gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        // ignore: prefer_const_literals_to_create_immutables
                        colors: [Color(0xFFFFFFFF), Color.fromARGB(234, 77, 197, 253)]))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                widthFactor: 1.7,
                heightFactor: 0.8,
                child: Container(
                    height: 300,
                    width: 300,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/WelcomeMed.jpg"))

                        // ignore: prefer_const_literals_to_create_immutables

                        )),
              ),
            ],
          ),
          Column(
            children: [
              Align(
                  widthFactor: 2.0,
                  heightFactor: 5.0,

                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: const Text(
                      'Kidney Disease Prediction',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Rubik',
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 90,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Align(
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  // ignore: deprecated_member_use
                  style: ElevatedButton.styleFrom(primary: Colors.black, ),
                  
                  onPressed: () {
                    // ignore: avoid_print
                    print("RaisedButton");
                    // ignore: unused_label
                    
                    Color:
                    Colors.black;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  },

                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'arial',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Align(
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(
                width: 75,
                height: 25,
              )
            ],
          ),
        ],
      ),
    );
  }
}
