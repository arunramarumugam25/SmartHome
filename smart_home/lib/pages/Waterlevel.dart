import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Waterlevel extends StatefulWidget {
  @override
  _WaterlevelState createState() => _WaterlevelState();
}

class _WaterlevelState extends State<Waterlevel> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  var val;

  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('Esp8266_Device');

  bool motor;

  var level;

  void initState() {
    _databaseReference.child('motor').onValue.listen((Event event) {
      setState(() {
        motor = event.snapshot.value;
      });
    });

    _animationController= AnimationController(vsync: this,duration: Duration(seconds:10));

   // _animationController.addListener(() { });

    super.initState();
  }
@override
void dispose(){
_animationController.dispose();
super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Motor controller'),
          backgroundColor: Colors.deepPurple,
        ),
        body:motor==null?Center(child: CircularProgressIndicator(),): Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Water level of tank',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue)),
            ),

            StreamBuilder(
                stream: _databaseReference.child('distance').onValue,
                builder: (BuildContext context, snap) {
                  if (snap.hasData) {
                    DataSnapshot snapshot = snap.data.snapshot;
                 
                    val = snapshot.value*0.01;  

                    
                  }

                  return val==null?CircularProgressIndicator() : SizedBox(
                      width: 170,
                      height: 190,
                      child: LiquidCustomProgressIndicator(
                        value: val,
                        backgroundColor: Colors.grey[300],
                        center: Text('${val*100} %',style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w600),),
                        direction: Axis.vertical,
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        
                        shapePath: _buildtank(),
                                              ));
                                        })
                                  ],
                                ));
                          }

                          Path _buildtank(){
                            return Path()
                              ..moveTo(0, 0)
                              ..lineTo(0, 190)
                              ..lineTo(170, 190)
                              ..lineTo(170, 0)
                              
                              ..close();
                              
                          } 
                        }
                        
 
