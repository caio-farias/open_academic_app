import 'package:flutter/cupertino.dart';

class TransitionPageRoute extends PageRouteBuilder {
  final Widget widget;
  TransitionPageRoute({required this.widget})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, animation, secondaryAnimation) => widget,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}