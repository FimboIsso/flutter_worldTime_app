import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WolrdTime{
  String location;// location name for the UI
  String? time;//the time int that location
  String flag; // ur to the flag icon
  String url; //location ur for api endpoint
  bool? isDaytime;


  WolrdTime({ required this.location, required this.flag, required this.url});


  Future<void> getTime() async{
    try{
      //simulate network request for a userne
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')) ;
      Map data = jsonDecode(response.body);
      print(data);

      String data_time = data['datetime'];
      String offest = data['utc_offset'].substring(1,3);

      //create datetime object
      DateTime now = DateTime.parse(data_time);
      now.add(Duration(hours: int.parse(offest)));
      //print(now);

      //set the time propetie
      isDaytime = now.hour > 6 && now.hour < 19 ? true:false;

      time = DateFormat.jm().format(now);


    }catch(e){
      String error =  e.toString();
      time = "not found : $error";
    }

    //return time;

  }

  //WolrdTime wolrdTime = WolrdTime(location: 'CONGO RDC',flag: 'RDC.png',url: '/Africa/Kinshasa');

}