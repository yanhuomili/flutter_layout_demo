import 'package:flutter/material.dart';
import 'asset.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('点击搜索');
              showSearch(context: context, delegate: _SearchBarDelegate());
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(
            '列表展示',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('数据列表展示--$index'),
                leading: Icon(Icons.cloud_queue),
              );
             },
            ),
          )
        ],
      ),
    );
  }
}



class _SearchBarDelegate extends SearchDelegate<String>{
  /* 重写 */
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          print('清空输入框');
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        print('点击手机软件盘的搜索按钮');
        return close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('大家都在搜',textAlign: TextAlign.left),
          Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              spacing: 15, // 水平方向的间距
              runSpacing: 15, // 垂直方向的间距
              // children: <Widget>[ 
              //   Container(
              //     padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
              //     decoration: BoxDecoration(
              //       border: Border.all(width: 1,color:Colors.blue),
              //       borderRadius: BorderRadius.circular(5)
              //     ),
              //     child: Text(
              //       query,
              //       style: TextStyle(
              //         color: Colors.blue
              //       ),
              //     ),
              //   )
              // ],
              children: recordsTextList.map((f){
                return Container(
                  padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color:Colors.blue),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    f,
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
              color: Colors.pink,
              child: Text('搜索结果列表--$index',style: TextStyle(color: Colors.white),),
            );
           },
          ),
          )
          
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context){
    final suggestionList = query.isEmpty
      ? recentSuggest
      : searchList.where((input)=>input.startsWith(query)).toList();
    
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index) => ListTile(
        onTap: (){
          print('点击--${suggestionList[index]}');
          query = suggestionList[index];
        },
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )
            ],
          ),
        ),
      )
    );

  }

}