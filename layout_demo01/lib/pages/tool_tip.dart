import 'package:flutter/material.dart';

class ToolTipPage extends StatelessWidget {
  const ToolTipPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('长按提示'),
      ),
      body: Center(
        child: Tooltip(
          message: '长按后提示的信息',
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width:1,color:Colors.blue),
              color: Colors.purple,
              borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(30),
            child: Text('长按我',style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}