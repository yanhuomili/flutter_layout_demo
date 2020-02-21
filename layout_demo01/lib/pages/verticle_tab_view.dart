import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VerticleTabPage extends StatefulWidget {
  VerticleTabPage({Key key}) : super(key: key);

  @override
  _VerticleTabPageState createState() => _VerticleTabPageState();
}

class _VerticleTabPageState extends State<VerticleTabPage> with SingleTickerProviderStateMixin{

  int currentIndex = 0;
  int subCurrentIndex = 0;

  List<int> _tabList = [
    1,2,3,4,5,6,7,8,9,10,11,12
  ];
  List<int> _subTabList = [
    1,2,3,4,5,6,7,8,9
  ];
  List<int> _tileList = [
    1,2,3,4,5,6,7,8,9
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _subTabList.length, vsync: this);
    _tabController.addListener((){
      print('监听tab改变${_tabController.index}');
      setState(() {
        subCurrentIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Row(
        children: <Widget>[
          _leftTab(),
          _rightContent(currentIndex)
        ],
      ),
    );
  }

  /* 左边tab栏 */
  Widget _leftTab(){
    return Container(
      width: 80,
      child: ListView.builder(
        itemCount: _tabList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              print('标题$index');
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                border: Border(
                  bottom: BorderSide(width:1,color:Colors.white),
                  right: BorderSide(width:1,color:Colors.white)
                )
              ),
              child: Text(
                '标题${index+1}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _rightContent(index){
    List _pageList = _tabList.map((index){
      return _page(index);
    }).toList();
    return _pageList[index];
  }


  Widget _page(index){
    return Expanded(
      child: DefaultTabController(
        length: _subTabList.length, 
        child: Column(
          children: <Widget>[
            _subTab(),
            _subTabView(index)
          ],
        )
      ),
    );
  }

  _subTab(){
    return Container(
      child: TabBar(
        isScrollable: true,
        labelColor: Colors.blue,
        indicatorWeight: 3,
        controller: _tabController,
        tabs: _subTabList.map((f){
          return Tab(
            text: 'subTab$f',
          );
        }).toList(),
      ),
    );
  }

  _subTabView(index){
    return Expanded(
      flex: 1,
      child: TabBarView(
        controller: _tabController,
        children: _subTabList.map((f){
          return ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: _tileList.map((f){
                return ListTile(
                  leading: Icon(Icons.beach_access),
                  title: Text('标题$index--页面下的subTab${subCurrentIndex+1}--tile $f'),
                  subtitle: Text('副标题'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              }).toList()
            ).toList(),
          );

          // return ListView.builder(
          //   itemCount: 10,
          //   itemBuilder: (BuildContext context, int index) {
          //     return ListTile(
          //       title: Text('list tile $index'),
          //       leading: Icon(Icons.favorite),
          //       trailing: Icon(Icons.keyboard_arrow_right),
          //       onTap: (){
          //         print('点击列表');
          //       },
          //     );
          //   },
          // );
        }).toList(),
      ),
    );
  }


}
