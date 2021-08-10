import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time ='Loading';

  void setupWordTime() async{
    WolrdTime wolrdTime = WolrdTime(location: 'CONGO RDC',flag: 'RDC.png',url: '/Africa/Kinshasa');
    await wolrdTime.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'time':wolrdTime.time,
      'location':wolrdTime.location,
      'flag':wolrdTime.flag,
      'isDayTime':wolrdTime.isDaytime
    });
    // setState((){
    //   time =  wolrdTime.time!;
    // });

  }

  @override
  void initState() {
    super.initState();
    setupWordTime();

  }


  void getData() async{
    //simulate network request for a userne
   Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Kinshasa')) ;
   Map data = jsonDecode(response.body);
   // print(data);
   // print(data['completed']);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
            child: SpinKitDualRing(
              color: Colors.white,
              size: 80.0,
            ),
        ),
      ),
    );
  }
}
