import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget page;

  RouteTransition({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              slideTransition(
                  child, animation), //scaleTransition(child, animation),
        );

  static Widget scaleTransition(Widget child, Animation animation) {
   //Animatedwidget
    return ScaleTransition(
      scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
      child: child,
    );
  }

  static Widget slideTransition(Widget child, Animation animation) {
    return SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: const Offset(-1.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

  static Widget fadeTransition(
      Widget child, Animation animation) {
    //SingleChildRenderObjectWidget
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
static Widget scaleRotationTransition(Widget child, Animation animation){
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: RotationTransition(
        turns: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
        ),
        child: child,
      ),
    );
}

}
