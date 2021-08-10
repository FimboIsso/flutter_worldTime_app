import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map ;
    print(data['time']);

    //set bakcoup

    String bgImage = data['isDayTime'] ? 'day.png':'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue: Colors.indigo;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');//on activity resultat
                      setState(() {
                        data = result;
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[306],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[306],
                      ),

                    )
                ),
                SizedBox(height: 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.3,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                SizedBox(height:20),
              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 28.3,
                  color: Colors.white
                )),
            ]
            ),
          ),
        ),
      ),
    );
  }
}
