

import 'package:flutter/material.dart';
import 'package:smart_home/pages/Fan.dart';
import 'package:smart_home/pages/Waterlevel.dart';
import 'package:smart_home/pages/light.dart';

class Frontpage extends StatefulWidget {
  @override
  _FrontpageState createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Smart Home'),
          backgroundColor:Colors.deepPurple
        ),

        body:  Column(
          children:<Widget>[

              Text('Temperature:',style: TextStyle(fontSize:30,color:Colors.deepPurple,fontWeight:FontWeight.w600),),
            
            Padding(
              padding: EdgeInsets.only(top:20),
              child: Text('Appliance controller',style: TextStyle(fontSize:30,color:Colors.deepPurple,fontWeight:FontWeight.w600),),
              ),
            
            Flexible(
              child: 
            GridView.count(
          crossAxisCount: 2,
          
          crossAxisSpacing: 50,
          mainAxisSpacing: 50,
          padding: EdgeInsets.only(left: 40,top: 50,right: 40),
          children: <Widget>[
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Fan()));
              },
              child:Container(
                
              child:Center(
                child: Text('Fan',style: TextStyle(fontSize:40,color:Colors.white,fontWeight:FontWeight.w600),),
              ),
              color: Colors.deepPurple,
            ),
            ),

            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Light()));
              },
              child:Container(
              child:Center(
                child: Text('Light',style: TextStyle(fontSize:40,color:Colors.white,fontWeight:FontWeight.w600),),
              ),
              color: Colors.deepPurple,
            ),
            ),

            InkWell(
              onTap:(){

                
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Waterlevel()));
              },
              child:Container(
              child:Center(
                child: Text('Motor',style: TextStyle(fontSize:40,color:Colors.white,fontWeight:FontWeight.w600),),
              ),
              color: Colors.deepPurple,
            ),
            ),

            
            


          ],
          
          ))
          ]
        )



        
        
         

      
    );
  }
}