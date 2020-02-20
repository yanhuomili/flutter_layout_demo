import 'package:flutter/material.dart';

class BottomNavigationBarPage extends StatefulWidget {
  BottomNavigationBarPage({Key key}) : super(key: key);

  @override
  _BottomNavigationBarPageState createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {

  int currentIndex = 0;
  List<Widget> _pageList = List()
  ..add(_HomePage())
  ..add(_NotePage());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'bottom_navigation_bar 演示',
          style: TextStyle(
            fontSize: 16.0
          ),
        ),
        // leading: Icon(Icons.arrow_back_ios),
        // leading: Icon(Icons.navigate_before),
        actions: <Widget>[
          /* 可以放Icon IconButton 以及 */
          Icon(Icons.monetization_on),
          IconButton(
            icon: Icon(Icons.new_releases),
            tooltip: 'circle',
            onPressed: (){
              print('IconButton');
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem( // 不带文字
                child: Icon(Icons.notification_important,color: Colors.blue,),
              ),
              PopupMenuItem( // 带文字
                child: Row(
                  children: <Widget>[
                    Icon(Icons.notifications_none,color: Colors.blue,),
                    Text('闹钟')
                  ],
                ),
              )
            ]
          )

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          print('底部tab切换$index');
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            title: Text('note')
          )
        ],
        
      ),
      body: _pageList[currentIndex],
    );
  }
}


class _HomePage extends StatelessWidget {
  const _HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('_home页面'),
      ),
    );
  }
}

class _NotePage extends StatelessWidget {
  const _NotePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('_note页面'),
      ),
    );
  }
}