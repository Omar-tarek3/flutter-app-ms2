
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/locationsAll.dart';
import 'package:flutter_app/models/Location.dart';
import 'package:url_launcher/url_launcher.dart';



import 'cards.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    locationsAll NewList ;
    NewList=locationsAll();

    return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
    title: Text('my app'),
    ) ,
    body:Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purpleAccent,
            Colors.purple,
          ],
          stops: [
            0.3,
            0.7,
            1,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )
      ),
        child :Padding(padding: const EdgeInsets.all(20.0),
            child:Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    hintText: 'user name',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    hintText: 'password',
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('press me'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cards(NewList: NewList)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54

                  ),
                )

              ],

    )
    )
    )
    );
  }
}

class ThirdRoute extends StatelessWidget {
  final Location data;

  ThirdRoute({Key Key, this.data}) : super(key : Key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
        title: Text("Details"),
        ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.purpleAccent,
                Colors.purple,
              ],
              stops: [
                0.3,
                0.7,
                1,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

      child : ListView(
        children: [
          Text(data.name,
            textAlign:TextAlign.center,
            style: TextStyle(
                fontSize: 35.0,
              fontWeight: FontWeight.bold,

            ),
      ),
          SizedBox(height: 20.0),
          Padding(padding: const EdgeInsets.all(17.0),
            child :Image.network(data.imageUrl),),
          SizedBox(height: 20.0),

        Padding(padding: const EdgeInsets.all(10.0),
          child:Text(data.description,
            style: TextStyle(
              fontSize: 19.0,)),),

        ],
      ),
      ),

      floatingActionButton: FloatingActionButton(  onPressed: () => {
        launch(data.locationUrl)
      },
        child: const Icon(Icons.location_on_sharp),
        backgroundColor: Colors.black54,
      ),
    );


  }

}


