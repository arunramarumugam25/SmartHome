import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_home/pages/Frontpage.dart';

void main() {
  debugPaintSizeEnabled=true;
runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: Frontpage(),
    );
  }
}