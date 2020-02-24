import 'package:flutter/material.dart';



class DartBasicGrammarPage extends StatefulWidget {
  DartBasicGrammarPage({Key key}) : super(key: key);

  @override
  _DartBasicGrammarPageState createState() => _DartBasicGrammarPageState();
}

class _DartBasicGrammarPageState extends State<DartBasicGrammarPage> {
  
  @override
  void initState() {
    super.initState();

    var p = new Person('lili', 20);
    var w = new Work('小明', 30, 200000);
    var m = new My('lihaohua', 30,  '广州');
    var a = new Abs('宇宙第一',30);
    print(p.name);
    print(p.age);
    // p.sayHello();
    p.eat();
    w.sayHello();
    w.working();
    m.sleep();
    m.sayAddress();
    m.eat();
    m.teaching();
    m.lefting();
    a.lefting();
    a.sayMyName();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dart 基础语法'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child:Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 100, 30, 300),
                      child: Text('dart 基础语法'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 100, 30, 300),
                      child: Text('dart 基础语法'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 100, 30, 300),
                      child: Text('dart 基础语法'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* 使用class声明一个类 */
class Person {
      String name;
      int age;
      Person(String name,int age){ //当前类的构造函数
        /* 初始化当前类的属性 */
        this.name = name; 
        this.age = age;
      }
      /* 类的公有方法 */
      void eat(){
        print('${this.name} 今年${this.age}岁，正在吃饭');
      }
      void sayHello(){
        print('hello ${this.name}');
      }
}

/* 类继承 */
class Work extends Person{
  int salary;
  Work(String name,int age,int salary)
  :super(name,age){ //调用父类构造器
    /* 初始化自己的属性salary */
    this.salary = salary;
  } 
  
  /* 重写父类的方法，一般会用@override来标记 */
  @override
  void sayHello(){
    super.sayHello();
    print('hello${this.name},nice to meat you;');
  }

  void working(){
    print('${this.name} working in Utopa');
  }
  
}


class Student {
  void sleep(){
    print('lihaohua is sleeping');
  }
}
class Teacher{
  void teaching(){
    print('teaching some thing');
  }
  void sleep(){
    print('lihaohua is sleeping');
  }
}

/* 抽象类：
1.抽象类只定义方法，不去实现
2.抽象类不能被实例化
 */
abstract class Left{
  void lefting(); // 抽象方法：只有方法的定义，不去实现，继承他的类去实现，而且是必须实现抽象类中定义的所有方法
}

/* 继承抽象类的类，必须实现抽象类里面的所有方法 */
class Abs extends Left{
  String name;
  int age;
  
  /* 构造函数写法一 */
  // Abs(this.name,this.age):super();// 构造函数

  /* 构造函数写法二 */
  // 父类的构造函数没有参数的情况下可以不调用父类的构造函数
  // Abs(this.name,this.age);

  /* 构造函数写法三 */
  Abs(String name,int age){
    this.name = name;
    this.age = age;
  }

  @override
  void lefting(){
    print('Abs lift all the times');
  }

  void sayMyName(){
    print('my name is ${this.name},我今年${this.age}岁');
  }
}


/* 继承加混合模式 */
class My extends Person with Student, Teacher,Left{
  /* 当混合的时候又想同的方法，优先使用当前类的方法，然后是最后面混合近来的类里面的方法 */
  /* 继承抽象类的类，必须实现抽象类里面的方法 */
  String city;
  My(String name,int age,String city):super(name,age){
    this.city = city;
  }

  void sayAddress(){
    print('${this.name} is leave in ${this.city}');
  }

  @override
  void lefting(){ // 实现抽象类里面的方法
    print('lefting all the time');
  }

}