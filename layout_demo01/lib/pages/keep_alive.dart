import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  KeepAlivePage({Key key}) : super(key: key);

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>{
  int currentIndex = 0;
  List<Widget> _pageList = [
    Page(),
    Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保持页面状态'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          print('$index');
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            title: Text('全球化')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop_mac),
            title: Text('信息化')
          ),
        ],
      ),
      /* 使用IndexedStack组件来实现 */
      body: IndexedStack(
        index: currentIndex,
        children: _pageList,
      ),
      
    );
  }
}


class Page extends StatefulWidget {
  Page({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.all(30),
            child: Column(children: <Widget>[
              Text('方法一：使用IndexedStack组件来实现页面数据的保存'),
              Text('方法二：使用PageView、TarBarView的情况下继承AutomaticKeepAliveClientMixin，并重写wantKeepAlive为tru来实现'),
            ],),
          );
        }
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  Page2({Key key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 18,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.all(30),
            child: Text('2页面数据缓存测试$index'),
          );
        }
      ),
    );
  }
}