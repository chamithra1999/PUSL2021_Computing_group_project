// ignore: file_names
// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:computinggrp/opening.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

// ignore: camel_case_types
class opening extends StatefulWidget {
  const opening({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<opening> createState() => _openingState();
}

// ignore: camel_case_types
class _openingState extends State<opening> {
  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore, duplicate_ignore
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 189, 252, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            widthFactor: 0.5,
            heightFactor: 0.5,
            // ignore: duplicate_ignore
            child: Container(
                height: 350,
                width: 350,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft, end: Alignment.bottomRight,
                        // ignore: prefer_const_literals_to_create_immutables
                        colors: [Color(0xFFFFFFFF), Color(0xFF4DC6FD)]))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                widthFactor: 1.7,
                heightFactor: 0.8,
                // ignore: duplicate_ignore
                child: Container(
                    height: 300,
                    width: 300,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
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
                    child: Text(
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
            height: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Align(
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  // ignore: deprecated_member_use
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    // ignore: avoid_print
                    print("RaisedButton");
                    // ignore: unused_label
                    Color:
                    Colors.black;
                  },
                  child: Text(
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
              Align(
                alignment: Alignment.bottomCenter,
              ),
              SizedBox(
                width: 75,
                height: 25,
                child: ElevatedButton(
                  // ignore: deprecated_member_use
                  style: ElevatedButton.styleFrom(primary: Colors.white),

                  onPressed: () {
                    // ignore: avoid_print
                    print("ElevatedButton");
                  },

                  child: Text(
                    "skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
