
import 'package:flutter/material.dart';
import 'package:flutter_app/data/locationsAll.dart';
import 'package:flutter_app/models/Location.dart';

import 'form.dart';
import 'main.dart';

class cards extends StatefulWidget {
  locationsAll NewList;

  cards({Key key,@required  this.NewList}) : super( key : key);


  @override
  _cardsState createState() => _cardsState(NewList);
}

class _cardsState extends State<cards> {

  _cardsState( this.NewList) ;
  locationsAll NewList ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("fav Locations"),
      ),


      body:Padding(
        padding: const EdgeInsets.all(5),
        child : ListView.builder(
            itemCount: NewList.listobj.length,
            itemBuilder: (BuildContext context,int index){

              return GestureDetector(

                onTap: (){
                  print(NewList.listobj[index].imageUrl);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdRoute (data:NewList.listobj[index])),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black54, width: 5),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  color: Colors.transparent,
                  elevation:0,
                  child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 20),
                          child: Column(
                            children: <Widget> [
                              //Image.network(NewList.listobj[index].imageUrl),
                              SizedBox(height: 20.0),
                              Text(NewList.listobj[index].name,

                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color:Colors.white
                                ),
                              ),
                              SizedBox(height: 7.0),
                              Text(NewList.listobj[index].theme,
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold,
                                    color:Colors.white ,
                                  )
                              )
                            ],
                          ),
                        ),
                        Ink.image(image:
                        NetworkImage(NewList.listobj[index].imageUrl),
                          height: 210,
                          fit: BoxFit.cover,
                        ),

                      ]
                  ),
                ),
              );


            }
        ),

      ),

      floatingActionButton: FloatingActionButton(  onPressed: ()  {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => form(NewList:NewList)),
        );
      },

        child: const Icon(Icons.add),
        backgroundColor: Colors.black54,
      ),

    );
  }
}
