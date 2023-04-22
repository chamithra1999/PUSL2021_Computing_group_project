// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:computinggrp/opening.dart';
// ignore: unused_import
import 'package:computinggrp/welcome.dart';
// ignore: unused_import
import 'package:flutter/services.dart';

main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: opening(),
    );
  }
}
