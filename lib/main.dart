import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';
import 'package:flutter_windows_11/pages/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Windows',
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
        primarySwatch: Colors.blue,
        backgroundColor: backgroundColor
      ),
      home: const Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
