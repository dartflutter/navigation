import 'package:flutter/material.dart';
import 'dart:convert';

import '../pages/index.dart' as pages;

class HomeManager extends StatefulWidget {
  final List<Map<String, String>> imgs = [];

  State createState() => HomeManagerState();
}

class HomeManagerState extends State<HomeManager> {
  @override
  void initState() {
    super.initState();
    /**這裡不使用 assets/DSCN4069.jpg , 原因是在 onGenerateRoute 要split url segment會出問題 */
    widget.imgs.add({"imgUrl": "DSCN4069.jpg", "title": "Sweets 0"});
  }

  @override
  void didUpdateWidget(HomeManager old) {
    super.didUpdateWidget(old);
  }

  Widget build(ctx) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Text('Add Image'),
              onPressed: _addImage,
            )),
        Expanded(
            child: ListView.builder(
          itemCount: widget.imgs.length,
          itemBuilder: _buildImgTiles,
        ))
      ],
    );
  }

  void _addImage({img: const {"imgUrl": 'DSCN4064.jpg', "title": "Sweets"}}) {
    setState(() {
      widget.imgs.add({
        "title": img['title'] + " ${widget.imgs.length}",
        "imgUrl": img['imgUrl']
      });
    });
  }

  void _deleteImage(int index) {
    setState(() {
      widget.imgs.removeAt(index);
    });
  }

  Widget _buildImgTiles(BuildContext ctx, int index) {
    Map<String, String> img = widget.imgs[index];
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/" + img["imgUrl"]),
          Text(img["title"]),
          _buildButtonBar(ctx, img, index)
        ],
      ),
    );
  }

  Widget _buildButtonBar(ctx, img, index) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          textColor: Colors.blue,
          child: Text('Details'),
          /* onPressed: () => Navigator.push<bool>(
                ctx,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      pages.DetailPage(item: img),
                ),
              ).then((bool isDelete) {
                if (isDelete) _deleteImage(index);
              }),  */

          onPressed: () =>
          /**因為 detail 會回傳一個bool */
              Navigator.pushNamed<bool>(ctx, '/detail/${jsonEncode(img)}')
                  .then((bool isDelete) {
                if (isDelete) {
                  _deleteImage(index);
                }
              }),
        ),
      ],
    );
  }
}
