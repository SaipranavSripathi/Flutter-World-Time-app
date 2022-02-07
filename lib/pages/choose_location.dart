import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url:'api/timezone/Asia/Kolkata',location:'Kolkata',flag:''),
    WorldTime(url:'api/timezone/Europe/London',location:'London',flag:''),
    WorldTime(url:'api/timezone/Asia/Dhaka',location:'Dhaka',flag:''),
    WorldTime(url:'api/timezone/Africa/Cairo',location:'Cairo',flag:''),
    WorldTime(url:'api/timezone/America/Chicago',location:'Chicago',flag:''),
    WorldTime(url:'api/timezone/Asia/Seoul',location:'Seoul',flag:''),
  ];

  void updateTime(int index) async {
    WorldTime required=locations[index];
    await required.getTime();

    //navigate to homescreen and pass data to display
    Navigator.pop(context,{
      'location':required.location,
      'falg':required.flag,
      'time':required.time,
      'isDayTime':required.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('inside build function');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose a location'),
        centerTitle:true,
        elevation:0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 4.0),
            child: Card(
              child:ListTile(
                onTap:(){
                  print(locations[index].location);
                  updateTime(index);
                },
                title: Text(locations[index].location),
               // leading: CircleAvatar(location of image);--->to get an image in front of place name=>flag property in locations
              ),
            ),
          );
        },
      ),

    );
  }
}
