import 'package:flutter/material.dart';

class TabBarViewPage extends StatefulWidget {
  TabBarViewPage({Key key}) : super(key: key);

  @override
  _TabBarViewPageState createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() { 
    super.initState();
    _tabController = new TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabBarView 演示'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: 'Tab1',
              // icon: Icon(Icons.alarm_off),
            ),
            Tab(
              text: 'Tab2',
              icon: Icon(Icons.airplanemode_active),
            ),
            Tab(
              text: 'Tab3',
              icon: Icon(Icons.add_to_home_screen),
            ),
            Tab(
              text: 'Tab4',
              icon: Icon(Icons.add_comment),
            ),
            Tab(
              text: 'Tab5',
              icon: Icon(Icons.add_comment),
            ),
            Tab(
              text: 'Tab6',
              icon: Icon(Icons.add_comment),
            ),
            Tab(
              text: 'Tab7',
              // icon: Icon(Icons.alarm_off),
            ),
            Tab(
              text: 'Tab8',
              icon: Icon(Icons.airplanemode_active),
            ),
            Tab(
              text: 'Tab9',
              icon: Icon(Icons.add_to_home_screen),
            ),
            Tab(
              text: 'Tab10',
              icon: Icon(Icons.add_comment),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center( 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Tab 与 TabBarView 使用注意事项',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.redAccent
                  ),
                ),
                Text('1.页面必须继承StatefulWidget'),
                Text('2.页面必须实现SingleTickerProviderStateMixin'),
                Text('3.页面初始化时，实例化TabController'),
                Text('4.在TabBar组件中指定controller为我们实例化的TabController'),
                Text('5.在TabBarView组件中指定controller为我们实例化的TabController'),
              ]
            ),
          ),
          Center(child: Text('ttttt'),),
          Center(child: Text('ttttt'),),
          Center(child: Text('ttttt'),),
          Center(child: Text('ttttt'),),
          Center(child: Text('ttttt'),),
          Center(child: Text('ttttt'),),
          Center(child: Text('ttttt'),),
          Center(child: Text('ttttt'),),
          Center(child: Text('ttttt'),),
        ],
      ),
    );
  }
}