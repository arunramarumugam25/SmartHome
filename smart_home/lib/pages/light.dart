
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Light extends StatefulWidget {
  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {

  DatabaseReference _databaseReference=FirebaseDatabase.instance.reference().child('Esp8266_Device').child('light');

  bool halllight;
  bool bedroomlight;
  bool outdoorlight;

  void initState(){

    _databaseReference.child('hall light').once().then((DataSnapshot data) {

      setState(() {
        halllight=data.value;
      });
    

    });

    _databaseReference.child('bedroom light').once().then((DataSnapshot data) {
      setState(() {
        bedroomlight=data.value;
      });

    });

    _databaseReference.child('outdoor light').once().then((DataSnapshot data) {
      setState(() {
        outdoorlight=data.value;
      });

    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Light controller'),
        backgroundColor: Colors.deepPurple,
      ),

      body: outdoorlight==null?Center(child: CircularProgressIndicator(),):Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'hall light',
                  style: TextStyle(fontSize: 20),
                )),
            Padding(
              padding: EdgeInsets.only(left: 47),
              child: Switch(
                  value: halllight,
                  onChanged: (value) {
                    setState(() {
                      halllight = value;
                      if (halllight) {
                        _databaseReference.child('hall light').set(true);
                      } else {
                        _databaseReference.child('hall light').set(false);
                      }
                    });
                  }),
            )
          ]),
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'Bedroom light',
                  style: TextStyle(fontSize: 20),
                )),
                
            Switch(
                value: bedroomlight,
                onChanged: (value) {
                  setState(() {
                    bedroomlight = value;
                    if (bedroomlight) {
                      _databaseReference.child('bedroom light').set(true);
                    } else {
                      _databaseReference.child('bedroom light').set(false);
                    }
                  });
                })
          ]),

          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'outdoor light',
                  style: TextStyle(fontSize: 20),
                )),

                Padding(
                  padding: EdgeInsets.only(left:10),
                  child: Switch(
                value: outdoorlight,
                onChanged: (value) {
                  setState(() {
                    outdoorlight = value;
                    if (outdoorlight) {
                      _databaseReference.child('outdoor light').set(true);
                    } else {
                      _databaseReference.child('outdoor light').set(false);
                    }
                  });
                }),
                  )
            
          ]),
        ],
      ),


      
    );
  }
}