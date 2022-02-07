import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map dataFromLoadingScreen={};

  @override
  Widget build(BuildContext context) {

    dataFromLoadingScreen = (dataFromLoadingScreen.isNotEmpty)?dataFromLoadingScreen: ModalRoute.of(context).settings.arguments;
    print(dataFromLoadingScreen);
    
    String bgImage=dataFromLoadingScreen['isDayTime']?'day.jpg':'night.jpg';
    Color bgColor=dataFromLoadingScreen['isDayTime']?Colors.blue:Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/$bgImage'),
                fit:BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
              child: Column(
              children:[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result= await Navigator.pushNamed(context, '/location');
                    setState(() {
                      dataFromLoadingScreen={
                        'location':result['location'],
                        'falg':result['flag'],
                        'time':result['time'],
                        'isDayTime':result['isDayTime'],
                      };
                    });
                  },
                    icon: Icon(
                        Icons.edit_location_rounded,
                        color:Colors.grey[300],
                    ),
                    label: Text(
                        'Edit Location',
                        style:TextStyle(
                            color:Colors.grey[300],
                        ),
                    ),
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dataFromLoadingScreen['location'],
                      style:TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color:Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  dataFromLoadingScreen['time'],
                  style:TextStyle(
                    fontSize: 66.0,
                    color:(dataFromLoadingScreen['isDayTime']?Colors.black:Colors.white),
                  )
                ),
              ],
        ),
            ),
          ),
        ),
      );
  }
}
