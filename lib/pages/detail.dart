import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool toDelete = true;
  DetailPage({this.item});

  @override
  Widget build(ctx) {
    return WillPopScope(
      onWillPop: () {
        //注意: 在WillPopScope- onWillPop 中使用, Navigator.pop() 與 return Future 會互斥
        //也就是使用了 Navigator.pop , onWillPop 的回傳值就定要是 Future(false)

        //傳值回上一頁
        Navigator.pop(ctx, false);

        //return Future(false) 設定禁止回上一頁,所有頁面上的往回鍵全部失效
        //return Future(true) 可以回上一頁
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail Page'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/" + item['imgUrl']),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(item['title']),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(ctx).accentColor,
                child: Text('Go back (Delete)'),
                onPressed: () => Navigator.pop(ctx, toDelete),
              ),
            )
          ],
        ),
      ),
    );
  }
}
