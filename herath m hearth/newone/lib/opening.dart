// ignore: file_names
import 'dart:async';

import 'package:flutter/material.dart';
// ignore: unused_import

// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:newone/signup.page.dart';

class open extends StatefulWidget {
  const open({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _openState createState() => _openState();
}

class _openState extends State<open> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to a new screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login_activity()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 239, 255),
      body: Column(
        children: [
          Column(
            children: [
              Align(
                heightFactor: 3.0,
                widthFactor: 2.0,
                child: Container(
                    height: 260,
                    width: 213,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: const DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                                "Images/1.png"))

                        // ignore: prefer_const_literals_to_create_immutables

                        )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
