import 'package:flutter/material.dart';

class BottomNavigationBarPage2 extends StatefulWidget {
  BottomNavigationBarPage2({Key key}) : super(key: key);

  @override
  _BottomNavigationBarPage2State createState() => _BottomNavigationBarPage2State();
}

class _BottomNavigationBarPage2State extends State<BottomNavigationBarPage2> {

  int currentIndex = 0;
  List<Widget> _pageList = List()
  ..add(_HomePage())
  ..add(_NotePage());

  PageController _pageController = new PageController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'bottom_navigation_bar2 演示',
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
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds:300), // 过渡时间
              curve: Curves.easeIn // 过渡曲线
            );
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
      /* 直接使用 */
      // body: PageView(
      //   children: _pageList,
      //   onPageChanged: (index){
      //     print('$index');
      //   },
      //   controller: _pageController,
      // ),

      /* 使用build方法*/
      body: PageView.builder(
        itemCount: _pageList.length,
        onPageChanged: (index){
          print('页面切换$index');
          setState(() {
            currentIndex = index;
          });
        },
        controller: _pageController,
        itemBuilder: (BuildContext context, int index){
          return _pageList[index];
        },
      ),
    );
  }
}


class _HomePage extends StatelessWidget {
  const _HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: <Widget>[
          Text('_home页面'),
          Text('使用pageView 与 bottomNavigationBar结合实现底部切换'),
        ],
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