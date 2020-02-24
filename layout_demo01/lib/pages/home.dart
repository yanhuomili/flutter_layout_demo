import 'package:flutter/material.dart';
import 'package:layout_demo01/pages/bottom_navigation_bar.dart';
import 'package:layout_demo01/pages/bottom_navigation_bar2.dart';
import 'package:layout_demo01/pages/easy_refresh.dart';
import 'package:layout_demo01/pages/expansion_list.dart';
import 'package:layout_demo01/pages/expansion_panel_list.dart';
import 'package:layout_demo01/pages/grid_view.dart';
import 'package:layout_demo01/pages/router_change.dart';
import 'package:layout_demo01/pages/search.dart';
import 'package:layout_demo01/pages/tab_bar_view.dart';
import 'package:layout_demo01/pages/tool_tip.dart';
import 'package:layout_demo01/pages/verticle_tab_view.dart';
import 'package:layout_demo01/pages/keep_alive.dart';
import 'package:layout_demo01/pages/keep_alive2.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> _list = [
    {'title':'bottomNavigationBar','route':BottomNavigationBarPage()},
    {'title':'bottomNavigationBar2','route':BottomNavigationBarPage2()},
    {'title':'tabBarView','route':TabBarViewPage()},
    {'title':'verticleTab','route':VerticleTabPage()},
    {'title':'keepAlive','route':KeepAlivePage()},
    {'title':'keepAlive2','route':KeepAlivePage2()},
    {'title':'RouterChange','route':RouterChagePage()},
    {'title':'search','route':SearchPage()},
    {'title':'expansionTile','route':ExpansionTilePage()},
    {'title':'expansionPanel','route':ExpansionPanelPage()},
    {'title':'scroll_view','route':GridViewPage()},
    {'title':'toolTip','route':ToolTipPage()},    
    {'title':'easyRefresh','route':EasyResreshPage()}
  ];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 布局演示'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text('${_list[index]['title']}'),
              leading: Icon(Icons.ac_unit),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => _list[index]['route']));
                print('路由跳转');
              },
            );
         },
        ), 
      ),
    );
  }
}
