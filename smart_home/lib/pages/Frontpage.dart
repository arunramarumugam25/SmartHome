
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/pages/Fan.dart';
import 'package:smart_home/pages/Waterlevel.dart';
import 'package:smart_home/pages/light.dart';


class Frontpage extends StatefulWidget {
  @override
  _FrontpageState createState() => _FrontpageState();
}



class _FrontpageState extends State<Frontpage> {
DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('Esp8266_Device');

  double temperature=0.0;
  @override
void initState(){

_databaseReference.child('temperature').onValue.listen((Event event) {
      setState(() {
        temperature = event.snapshot.value;
      });
    });

    super.initState();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 15.0,
            title: Text('SMART HOME',style: GoogleFonts.oswald()), 
            backgroundColor: Colors.blue[700]),
        body: Column(children: <Widget>[
          Text(
            'Temperature: $temperature',
            style: TextStyle(
                fontSize: 20,
                color: Colors.blue[900],
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Appliance controller',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w600),
            ),
          ),
          Flexible(
              child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
            padding: EdgeInsets.only(left: 40, top: 40, right: 40),
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Fan()));
                },
                child: Container(
                  
                  child: Center(
                    child: Text(
                      'Fan',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  color: Colors.indigo,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Light()));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Light',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  color: Colors.indigo,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Waterlevel()));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Motor',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  color: Colors.indigo,
                ),
              ),
            ],
          )),

        
        ]));
  }
}
