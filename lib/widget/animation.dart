import 'package:flutter/material.dart';

class FadePageroute<T> extends PageRoute<T> 
{
    final Widget child;
    FadePageroute(this.child);
    
    @override
    Color get barrierColor => Colors.black;

    @override
    String get barrierLabel => "";

    @override
    Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return FadeTransition(
            opacity: animation,
            child: child
        );
    }

    @override
    bool get maintainState => true;

    @override
    Duration get transitionDuration => Duration(milliseconds: 500);
}
