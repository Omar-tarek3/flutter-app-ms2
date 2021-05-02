
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Location.dart';
import 'package:url_launcher/url_launcher.dart';



import 'cards.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('my app'),
    ) ,
    body: Column(
    children: [
    TextFormField(
    decoration: const InputDecoration(
    hintText: 'user name',
    ),
    ),
    TextFormField(
    decoration: const InputDecoration(
    hintText: 'password',
    ),
    ),
    ElevatedButton(
    child: Text('press me'),
    onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cards()),
      );
    },
    )
    ],
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
        title: Text("Details"),
        ),
      body: Column(
        children: [
          Text(data.name,
            style: TextStyle(
                fontSize: 35.0,
              fontWeight: FontWeight.bold
            ),
      ),
          SizedBox(height: 20.0),
          Image.network(data.imageUrl),
          SizedBox(height: 20.0),
          Text(data.description,
            style: TextStyle(
              fontSize: 15.0,
            )

          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(  onPressed: () => {
        launch(data.locationUrl)
      },
        child: const Icon(Icons.location_on_sharp),
      ),
    );


  }

}


