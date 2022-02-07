import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /*void getTime() async {
//    //simulate networkk req for username
//    String name=await Future.delayed(Duration(seconds:3),(){
//      return 'Sai pranav';
//    });
//    //simulate network req for users info
//    String info=await Future.delayed(Duration(seconds:2),(){
//      return 'CSE engineer';
//    });
//
//    print('$name-$info');
  /*************Using a dummy api**************/
//      String url='https://jsonplaceholder.typicode.com/todos/1';
//      Response response = await get(Uri.https('jsonplaceholder.typicode.com','albums/1'));
//      //print(response.body);
//      Map data=jsonDecode(response.body);
      print(data['id']);   }*/

  void setWorldTime() async {
    WorldTime obj=new WorldTime(location:'Kolkata',flag:'India.jpg',url:'api/timezone/Asia/Kolkata');
    await obj.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments:{
      //set of key:value pairs
      'location':obj.location,
      'falg':obj.flag,
      'time':obj.time,
      'isDayTime':obj.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    //print('inside initstate function');
    //getTime();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
