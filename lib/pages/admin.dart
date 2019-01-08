import 'package:flutter/material.dart';

import './home.dart';
import '../widgets/admin_create_tab.dart';
import '../widgets/admin_list_tab.dart';

class AdminPage extends StatelessWidget {
/* 
  Tab 有關 
    DefaultTabController Widget : It wraps the entire page because it will need to swap out the body of that page
    TabBar Widget :
    TabBarView Widget
 */

  @override
  Widget build(ctx) {
    return DefaultTabController(
      length: 2 /** 共有兩個 Tab */,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                  /*  false 移除 Drawer Panel 右上的漢堡*/
                  automaticallyImplyLeading: false,
                  title: Text('Choose')),
              ListTile(
                title: Text('模擬找不到頁面'),
                onTap: () {
                  /*
                  Navigator.pushReplacement(ctx,
                      MaterialPageRoute(builder: (ctx) {
                    return HomePage();
                  }));
                  */

                  //因為在 MaterialApp 註冊了 name route
                  //Navigator.pushReplacementNamed(ctx, '/');

                  Navigator.pushNamed(ctx, '/notfound');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Administrator'),
          bottom: TabBar(tabs: [
            Tab(text: "Create", icon: Icon(Icons.create)),
            Tab(
              text: "List",
              icon: Icon(Icons.list),
            ),
          ]),
        ),
        body: TabBarView(
          /* Tab 會被 embeded 到 Page的body,而非取代, tab 可以看做subpage */
          children: <Widget>[CreateTab(), ListTab()],
        ),
      ),
    );
  }
}
