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
        child: Column(
          children: <Widget>[
												Tooltip(
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
											Tooltip(
													message: '唯美图片',					
													child: Container(
														padding: EdgeInsets.all(15),
														width: 300,
														child: Image.network('https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3424924252,193066876&fm=26&gp=0.jpg'),
													),

											),
											Tooltip(
												message: 'hehehe',
												child: Container(
													decoration: BoxDecoration(
														borderRadius: BorderRadius.circular(8),
														border: Border.all(width:1,color:Colors.blue)
													),
													margin: EdgeInsets.all(15),
													padding: EdgeInsets.all(20),
													child: Text('文字'),
												),
											)
          ],
        )
      ),
    );
  }
}