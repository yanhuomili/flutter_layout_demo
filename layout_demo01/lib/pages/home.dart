import 'package:flutter/material.dart';
import 'package:layout_demo01/pages/bottom_navigation_bar.dart';
import 'package:layout_demo01/pages/bottom_navigation_bar2.dart';
import 'package:layout_demo01/pages/tab_bar_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 布局演示'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('bottomNavigationBar'),
              leading: Icon(Icons.ac_unit),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarPage()));
                print('路由跳转');
              },
            ),
            ListTile(
              title: Text('bottomNavigationBar2'),
              leading: Icon(Icons.ac_unit),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarPage2()));
                print('路由跳转');
              },
            ),
            ListTile(
              title: Text('tabBarView'),
              leading: Icon(Icons.ac_unit),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarViewPage()));
                print('路由跳转');
              },
            ),

          ],
        ),  
      ),
    );
  }
}