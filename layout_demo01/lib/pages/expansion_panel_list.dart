import 'package:flutter/material.dart';

class ExpansionPanelPage extends StatefulWidget {
  ExpansionPanelPage({Key key}) : super(key: key);

  @override
  _ExpansionPanelPageState createState() => _ExpansionPanelPageState();
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {

  List<int> _mList;
  List<ExpandStateBean> _expandStateList;

  /* 构造方法，当调用这个类的时候回执行 */
  _ExpansionPanelPageState(){
    _mList = new List();
    _expandStateList = new List();
    for(int i=0;i<20;i++){
      _mList.add(i);
      _expandStateList.add(ExpandStateBean(false, i));
    }
  }

  _setCurrentIndex(int index,isExpand){
    setState(() {
      _expandStateList.forEach((item){
        if(item.index == index){
          print('$index');
          print('$isExpand');
          item.isOpen = !isExpand;
        }else{
          item.isOpen = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion panel list'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index,bol){
            print('$index');
            _setCurrentIndex(index,bol);
          },
          children: _mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title: Text('this is NO $index'),
                  leading: Icon(Icons.ac_unit),
                );
              },
              body: ListTile(
                title: Text('expansion no.$index'),
                leading: Icon(Icons.account_circle),
                trailing: Icon(Icons.keyboard_arrow_right),
                subtitle: Text('sub Tile'),
              ),
              isExpanded: _expandStateList[index].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }
}


class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.isOpen,this.index);
}