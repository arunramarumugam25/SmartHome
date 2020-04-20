import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';


class Waterlevel extends StatefulWidget {
  @override
  _WaterlevelState createState() => _WaterlevelState();
}

class _WaterlevelState extends State<Waterlevel> {
  var val;

  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('Esp8266_Device');

  bool motor;

  


  void initState()
  {
    _databaseReference.child('motor').onValue.listen((Event event){
      setState(() {
        motor=event.snapshot.value;

        

      });
    });

    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motor controller'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget>[
              Text(
                'Motor state',
                style: TextStyle(fontSize: 18),
              ),
              Switch(
                value: motor,
                onChanged: (value) {
                  setState(() {
                    motor = value;
                    print(motor);
                    if (motor) {
                      _databaseReference.child('motor').set(true);
                    } else {
                      _databaseReference.child('motor').set(false);
                    }
                  });
                },
                activeColor: Colors.green,
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Text('Water level of tank',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink)),
            ),
            StreamBuilder(
                stream: _databaseReference.child('distance').onValue,
                builder: (BuildContext context, snap) {

                  if (snap.hasData) {
                    DataSnapshot snapshot = snap.data.snapshot;

                    val = snapshot.value;
                  }

                  

                  
                  return SizedBox(

                    
                    height: 200,
                    width: 250,
                    
                    child: FAProgressBar(
                      currentValue: val,
                      size: 300,
                      maxValue: 100,
                      changeColorValue: 70,
                      changeProgressColor: Colors.pink,
                      backgroundColor: Colors.white,
                      progressColor: Colors.lightBlue,
                      animatedDuration: const Duration(milliseconds: 500),
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      displayText: '%',
                    ),
                  );
                })
          ],
        );
      
    );
  }

