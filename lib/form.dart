import 'package:flutter/material.dart';
import 'package:flutter_app/models/Location.dart';
import 'cards.dart';
import 'data/locationsAll.dart';

class form extends StatefulWidget {
  locationsAll NewList;
  form({Key key,@required  this.NewList}) : super( key : key);
  @override

  _formState createState() => _formState(NewList);
}

class _formState extends State<form> {
  _formState( this.NewList) ;
  locationsAll NewList ;
  String name;
  String theme;
  String description;
  String locUrl;
  String imgUrl;
  Location x = Location();
  var _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      validator: ( value){
        if(value.isEmpty){
          return'pls enter the name';
        }
      },
      onChanged: (value){
        setState(()=> name=value);
        x.name=name;

        x.id=locationsAll().listobj.length ;
      },

      decoration: const InputDecoration(
          labelText: 'location name',
          border: OutlineInputBorder()
      ),
    ) ;
  }
  Widget _buildDescription(){
    return TextFormField(
      validator: ( value){
        if(value.isEmpty){
          return'pls enter the description';
        }
      },
      onChanged: (value){
        setState(()=> description=value);
        x.description=description;
      },
      decoration: const InputDecoration(
          labelText: 'description',
          border: OutlineInputBorder(
          )
      ),
    );
  }
  Widget _buildTheme(){
    return TextFormField(
      validator: ( value){
        if(value.isEmpty){
          return'pls enter the theme';
        }
      },
      onChanged: (value){
        setState(()=> theme=value);
        x.theme=theme;
      },
      decoration: const InputDecoration(
          labelText: 'location theme',
          border: OutlineInputBorder(
          )
      ),
    );
  }
  Widget _buildLocUurl(){
    return TextFormField(
      validator: ( value){
        if(value.isEmpty){
          return'pls enter the loc Url';
        }
      },
      onChanged: (value){
        setState(()=> locUrl=value);
        x.locationUrl=locUrl;
      },
      decoration: const InputDecoration(
          labelText: ' loc url',
          border: OutlineInputBorder(
          )
      ),
    );
  }
  Widget _buildImgUrl(){
    return TextFormField(
      validator: ( value){
        if(value.isEmpty){
          return'pls enter the img url';
        }
      },
      onChanged: (value){
        setState(()=> imgUrl=value);
        x.imageUrl=imgUrl;
      },
      decoration: const InputDecoration(
          labelText: ' img url',
          border: OutlineInputBorder(
          )
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text("form"),
      ),
      body:Padding(
      padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      child:Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildName(),
            SizedBox(height: 20.0),
            _buildTheme(),
            SizedBox(height: 20.0),
            _buildDescription(),
            SizedBox(height: 20.0),
            _buildImgUrl(),
            SizedBox(height: 20.0),
            _buildLocUurl(),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('add'),

              onPressed: (){

                if(_formKey.currentState.validate()){
                  setState(() {
                    NewList.listobj.add(x);
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>cards(NewList: NewList)));
                }

              },

              style: ElevatedButton.styleFrom(
                  primary: Colors.black54
              ),
            )

          ],
        ),
      ),
      )
    )


      ;
  }
}


