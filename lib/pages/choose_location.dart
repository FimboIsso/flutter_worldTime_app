import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int count = 0;


  @override
  Widget build(BuildContext context) {

    final List<WolrdTime> locations = [
      WolrdTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
      WolrdTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
      WolrdTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WolrdTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
      WolrdTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
      WolrdTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
      WolrdTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
      WolrdTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    ];

    void updateTime(index) async {
      WolrdTime wolrdTime = locations[index];
      await wolrdTime.getTime();
      //navigate to home screen
      Navigator.pop(context, {
            'time':wolrdTime.time,
            'location':wolrdTime.location,
            'flag':wolrdTime.flag,
            'isDayTime':wolrdTime.isDaytime
          }
      );

    }


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){

            String flag = locations[index].flag;
            return Card(
              child: ListTile(
                onTap: (){

                  updateTime(index);
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content: Text(locations[index].location     ),
                  // ));
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/$flag',

                  ),

                ),
              ),
            );
          },
      )
    );
  }






  // void getData() async{
  //   //simulate network request for a userne
  //    String username = await Future.delayed(Duration(seconds: 3),(){
  //     return 'JUSTIN FIMBO';
  //   });
  //
  //    String bio = await Future.delayed(Duration(seconds: 3),(){
  //     return ('Vega, msicaon developer $username');
  //   });
  //
  //   print('$username - $bio');
  // }
}
