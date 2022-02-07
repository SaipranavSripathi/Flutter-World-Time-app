import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';
import 'package:worldtimeapp/pages/choose_location.dart';


void main() {
  //creating maps for routes
  //Map student={'name':'Sai pranav','age':20,'clg':'CVR College Of Engineering'};
  //print(student['name']);

  runApp(MaterialApp(
    //home: Home(),
    initialRoute:'/',
    routes: {
      //key-->actual toute
      //value-->functions of context obj to know where we are in widget tree
      '/' : (context)=>Loading(),//the base route is loading screen
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
  ));
}

