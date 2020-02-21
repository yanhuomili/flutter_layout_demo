import 'package:flutter/material.dart';

class KeepAlivePage2 extends StatefulWidget {
  KeepAlivePage2({Key key}) : super(key: key);

  @override
  _KeepAlivePage2State createState() => _KeepAlivePage2State();
}

class _KeepAlivePage2State extends State<KeepAlivePage2> with SingleTickerProviderStateMixin{
  TabController _tabController;

  List<int> _tabList = [
    1,2,3,4,5,6,7,8,9
  ];

  List<Widget> _tabViewList;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);

    _tabViewList =  _tabList.map((item){
      return Page1(pageIndex:item);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保持页面状态'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabList.map((item){
            return Tab(
              text: 'tab$item',
            );
          }).toList()
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabViewList,
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  Page1({Key key, this.pageIndex}) : super(key: key);
  final pageIndex;

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text('${widget.pageIndex}保持页面数据$index'),
        leading: Icon(Icons.laptop_windows),
        trailing: Icon(Icons.keyboard_arrow_right),
      );
     },
    );
  }
}