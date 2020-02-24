import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';

class EasyResreshPage extends StatefulWidget {
  EasyResreshPage({Key key}) : super(key: key);

  @override
  _EasyResreshPageState createState() => _EasyResreshPageState();
}

class _EasyResreshPageState extends State<EasyResreshPage> {
  EasyRefreshController _easyRefreshController;

  void getData()async{
    
  }
  
  @override
  void initState() { 
    super.initState();
    _easyRefreshController = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('easy refresh'),
      ),
      body: Container(
        child: EasyRefresh(
          controller: _easyRefreshController,
          enableControlFinishLoad: true,
          enableControlFinishRefresh: true,
          header: BallPulseHeader(), // header和footer可以自定义，或者选择插件提供的样式
          footer: BezierBounceFooter(),
          onRefresh: ()async{
            /* finishRefresh需要延迟执行，否则无效 */
            Timer(Duration(seconds: 2),(){
              _easyRefreshController.finishRefresh(success:true);
            });
            print('下拉刷线');
          },
          onLoad: () async{
            /* finishLoad需要延迟执行，否则无效 */
            Timer(Duration(seconds: 2),(){
              _easyRefreshController.finishLoad(success:true,noMore:false);
            });
            print('上拉加载');
          },
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('列表选项${index+1}'),
              leading: Icon(Icons.ac_unit),
              subtitle: Text('sub title'),
            );
           },
          ),

        )
      )
    );
  }
}