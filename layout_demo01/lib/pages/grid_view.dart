import 'package:flutter/material.dart';


class GridViewPage extends StatefulWidget {
  GridViewPage({Key key}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('可滚动布局'),
      ),
      body: _gridViewPage(), // 网格布局
      // body: _wrapViewPage(), // wrap布局
    );
  }
}


/* 网格布局自带滚动特性 */
Widget _gridViewPage(){
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, // 横轴元素个数
      mainAxisSpacing: 15.0, // 纵轴间距
      crossAxisSpacing: 15.0, // 横轴间距
      childAspectRatio: 1.0 // 子组件长宽比
    ),
    itemCount: 20,
    itemBuilder: (BuildContext context, int index){
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.blue)
        ),
        child: Column(
          children: <Widget>[
            Text('网格布局'),
            Text('GridView网格布局可以滚动')
          ],
        ),
      );
    },
  );
}

Widget _wrapViewPage(){
  List _list = [
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,111,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  ];
  return SingleChildScrollView(
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 20, // 主轴方向的距离
      runSpacing: 30, // 副轴方向的距离
      children: _list.map((item){
        return Container(
          width: 110,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            border: Border.all(width:1,color:Colors.blue)
          ),
          child: Column(
            children: <Widget>[
              Text('1.wrap 布局'),
              Text('2.使用wrap布局的时候，必须包含在一个可滚动View里面，如：SingleChildScrollView，否则溢出的内容无法滚动')
            ],
          ),
        );
      }).toList(),
    ),
  );
}