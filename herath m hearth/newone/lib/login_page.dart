import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newone/profile_setting.dart';

import 'package:newone/signup.page.dart';

import 'package:get/get.dart';

import 'Prediction.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? Key}) : super(key: Key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(214, 253, 255, 1),
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/mp.jpg"), fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 30, right: 20),
                    width: w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ])),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: " Enter Your Email Address",
                        prefixIcon: Icon(Icons.email,
                            color: Color.fromARGB(255, 18, 8, 4)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 20),
                  width: w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    onChanged: (value) {
                      // Validation logic
                      if (value.length > 6) {
                        // Perform validation for maximum character limit
                        passwordController.text = value.substring(0, 6);
                        // Move cursor to the end of the text
                        passwordController.selection =
                            TextSelection.fromPosition(TextPosition(offset: 6));
                      }
                    },
                    decoration: InputDecoration(
                        hintText: " Enter Your Password",
                        prefixIcon: Icon(Icons.password,
                            color: Color.fromARGB(255, 36, 22, 17)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),

          //login button container
          Container(
            width: w * 0.9,
            height: h * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("assets/images/b.png"), fit: BoxFit.cover),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: '',
                            //   title: '',
                            // )),
                        )
                    )
                  );
                },
                child: Text(
                  "Signin",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Container(),
          SizedBox(height: w * 0.08),
          RichText(
            text: TextSpan(
              text: "Create an Account?",
              style: TextStyle(
                color: Color.fromARGB(255, 60, 142, 229),
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: '   Register',
                  style: TextStyle(
                    color: Color.fromRGBO(242, 44, 57, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to LoginPage and pass the title as a parameter
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login_activity(),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
