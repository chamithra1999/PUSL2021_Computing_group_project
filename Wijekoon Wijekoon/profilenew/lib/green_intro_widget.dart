// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profilenew/app_colors.dart';

Widget greenIntroWidget() {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        gradient: LinearGradient(
      // ignore: prefer_const_literals_to_create_immutables
      colors: [
        Color.fromARGB(255, 27, 110, 165),
        Color.fromARGB(255, 75, 159, 211),
        Color.fromARGB(255, 51, 155, 229),
        Color.fromARGB(255, 10, 138, 235),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )),
    height: Get.height * 0.3,
  );
}

Widget greenIntroWidgetWithoutLogos() {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        gradient: LinearGradient(
      // ignore: prefer_const_literals_to_create_immutables
      colors: [
        Color.fromARGB(255, 93, 198, 222),
        Color.fromARGB(255, 75, 159, 211),
        Color.fromARGB(255, 22, 190, 231),
        Color.fromARGB(234, 7, 145, 155),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
    )),
    height: Get.height * 0.18,
    child: Container(
        height: Get.height * 0.1,
        width: Get.width,
        margin: EdgeInsets.only(bottom: Get.height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        )),
  );
}
