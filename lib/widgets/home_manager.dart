import 'package:flutter/material.dart';

class HomeManager extends StatefulWidget {
  final List<Map<String, String>> imgs = [
    {"imgUrl": "assets/DSCN4069.jpg", "title": "Sweets"}
  ];

  

  HomeManager();

  State createState() => HomeManagerState();
}

class HomeManagerState extends State<HomeManager> {
  Widget build(ctx) {
    return Column(
      children: [
        Container( 
          margin: EdgeInsets.all(4.0),
          child: RaisedButton( 
            child: Text('Add Image'),
            onPressed: _addImage,
          )
        ),

        Column( 
          children: widget.imgs.map((Map<String,String> img)=>
            Card( 
              elevation: 10,
              child: Column( 
                children: <Widget>[
                  Image.asset(img['imgUrl']),
                  Text(img['title'])
                ],
              )
            )
          ).toList(),
        )
      ],
    );
  }

  void _addImage(){
    setState(() {
          widget.imgs.add({"imgUrl":'assets/DSCN4064.jpg',"title":"Sweets"});
        });
  }
}
