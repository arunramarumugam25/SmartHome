import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/pages/Frontpage.dart';

void main() {

runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: Frontpage(),
    );
  }
}