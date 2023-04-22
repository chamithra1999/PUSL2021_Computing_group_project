// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:computinggrp/welcome.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

import 'main.dart';

// ignore: camel_case_types
class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  State<welcome> createState() => _welcomeState();
}

// ignore: camel_case_types
class _welcomeState extends State<welcome> {
  // ignore: prefer_typing_uninitialized_variables, annotate_overrides
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(milliseconds: 2000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        // ignore: prefer_const_constructors
        context,
        // ignore: prefer_const_constructors
        MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
              // ignore: prefer_const_constructors
              Color.fromARGB(255, 35, 97, 233),
              // ignore: prefer_const_constructors
              Color(0xFFe8e9eb)
            ])),

        // ignore: avoid_unnecessary_containers
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                // ignore: prefer_const_constructors
                image: DecorationImage(
                    // ignore: prefer_const_constructors
                    image: AssetImage(
                  "Images/Kidney_Care-removebg-preview.png",
                ))

                // ignore: prefer_const_literals_to_create_immutables
                ),
          ),
        ),
      ),
    );

    // ignore: unused_label, dead_code
  }
}
