import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;//location name for UI
  String time;//time in that location
  String flag;//url of an asset flag-icon
  String url='api/timezone/Asia/Kolkata';//location url for api end point
  bool isDayTime=true;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try{
      //make the req
      Response res=await get(Uri.https('worldtimeapi.org',url));
      Map data=jsonDecode(res.body);
      //print(data);

      //get properties
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);

      //create datetime obj
      DateTime now=DateTime.parse(datetime);
      //print(now);
      now=now.add(Duration(hours:int.parse(offset),minutes: 30));
      //print(now);

      //set time property
      isDayTime=(now.hour>=6 && now.hour<=18)?true:false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error:  $e');
      time='couldnot find the time data';
    }

  }
}