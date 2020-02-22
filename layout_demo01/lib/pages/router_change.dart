import 'package:flutter/material.dart';
import 'package:layout_demo01/pages/custom_router.dart';

class RouterChagePage extends StatefulWidget {
  RouterChagePage({Key key}) : super(key: key);

  @override
  _RouterChagePageState createState() => _RouterChagePageState();
}

class _RouterChagePageState extends State<RouterChagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由切换效果'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('路由切换效果'),
            Text(
              '1.新建一个custome_router.dart文件，自定义CustomRoute Widget,继承PageRouterBuilder,然后重新CustomRoute构造方法'
            ),
            Text(
              '2.在需要跳转路由的页面引入custome_router.dart文件，路由跳转的时候使用CustomRoute进行跳转'
            ),
            RaisedButton(
              onPressed: (){
                Navigator.of(context).push(CustomRoute(RouterChagePage2()));
              },
              child: Text('跳转到RouterChangePage2页面'),
            )
          ],
        ),
      ),
    );
  }
}


class RouterChagePage2 extends StatefulWidget {
  RouterChagePage2({Key key}) : super(key: key);

  @override
  _RouterChagePage2State createState() => _RouterChagePage2State();
}

class _RouterChagePage2State extends State<RouterChagePage2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RouterChangePage2'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('routerChangePage2页面'),
            RaisedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('跳转到上一页'),
            )
          ],
        ),
      ),
    );
  }
}