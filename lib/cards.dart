


import 'package:flutter/material.dart';
import 'package:flutter_app/data/locationsAll.dart';
import 'package:flutter_app/models/Location.dart';
import 'main.dart';



class cards extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Text("fav Locations"),
        ),


        body: ListView.builder(
            itemCount: locationsAll().listobj.length,
            itemBuilder: (BuildContext context,int index){


          return GestureDetector(

            onTap: (){ Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdRoute (data:locationsAll().listobj[index])),
            );

            },
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: <Widget> [
                    Image.network(locationsAll().listobj[index].imageUrl),
                    SizedBox(height: 20.0),
                    Text(locationsAll().listobj[index].name,
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                    ),
                    SizedBox(height: 13.0),
                Text(locationsAll().listobj[index].theme,
                  style: TextStyle(
                      fontSize: 16.0,
                    color:Colors.grey[600] ,
                  )
                )
                  ],
                ),
              ),
            ),
          );


            }
        )

    );
  }
}