import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Fan extends StatefulWidget {
  @override
  _FanState createState() => _FanState();
}

class _FanState extends State<Fan> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance
      .reference()
      .child('Esp8266_Device')
      .child('fan');
  bool hallfan;
  bool bedroomfan;


  void initState(){

    _databaseReference.child('hall fan').once().then((DataSnapshot data) {
      hallfan=data.value;
      print(hallfan);

    });

    _databaseReference.child('bedroom fan').once().then((DataSnapshot data) {
      bedroomfan=data.value;

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fan controller'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'Hall Fan',
                  style: TextStyle(fontSize: 20),
                )),

                
            Padding(
              padding: EdgeInsets.only(left: 47),
              child: Switch(
                  value: hallfan,
                  onChanged: (value) {
                    setState(() {
                      hallfan = value;
                      if (hallfan) {
                        _databaseReference.child('hall fan').set(true);
                        
                      } else {
                        _databaseReference.child('hall fan').set(false);
                        
                      }
                    });
                  }),
            )
          ]),
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'Bedroom Fan',
                  style: TextStyle(fontSize: 20),
                )),
            Switch(
                value: bedroomfan,
                onChanged: (value) {
                  setState(() {
                    bedroomfan = value;
                    if (bedroomfan) {
                      _databaseReference.child('bedroom fan').set(true);
                    } else {
                      _databaseReference.child('bedroom fan').set(false);
                    }
                  });
                })
          ]),
        ],
      ),
    );
  }
}
