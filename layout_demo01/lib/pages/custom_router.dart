import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget widget;
  CustomRoute(this.widget)
  /* 重写父类的构造方法 */
  :super(
    /* 设置过渡时间 */
    transitionDuration:Duration(milliseconds:300),
    /* 构造器 */
    pageBuilder:(
      /* 上下文和动画 */
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2
    ){
      return widget;
    },
    transitionsBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child
    ){

      /* 一下四种模式任选一种 */
      /* 左右切换模式 */
      return SlideTransition(
        position: Tween<Offset>(
          /* 设置滑动的x、y轴 */
          begin: Offset(-1.0,0.0),
          end: Offset(0.0,0.0)
        ).animate(
          CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )
        ),
        child: child,
      );
      
      /* 淡入淡出模式 */
      // return FadeTransition(
      //   opacity: Tween(
      //     begin:0.0,
      //     end: 1.0
      //   ).animate(
      //     CurvedAnimation(
      //       parent: animation1,
      //       curve: Curves.fastOutSlowIn
      //     )
      //   ),
      //   child: child,
      // );

      /* 缩放模式 */
      // return ScaleTransition(
      //   scale: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
      //     parent: animation1,
      //     curve: Curves.fastOutSlowIn
      //   )),
      //   child: child,
      // );

      /* 旋转缩放模式 */
      // return RotationTransition(
      //   turns: Tween(begin: 0.0,end: 1.0)
      //   .animate(CurvedAnimation(
      //     parent: animation1,
      //     curve: Curves.fastOutSlowIn,
      //   )),
      //   child: ScaleTransition(
      //     scale: Tween(begin: 0.0,end: 1.0)
      //     .animate(CurvedAnimation(
      //       parent: animation1,
      //       curve: Curves.fastOutSlowIn
      //     )),
      //     child: child,
      //   ),
      // );

    }
  );
}