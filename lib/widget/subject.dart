import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// import other file
import 'drawer.dart';
import '../src/user.dart';

class Sessionpage extends StatelessWidget {
    @override
    final User user;
    Sessionpage(this.user);
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: HexColor("#eceff4"),
            appBar: AppBar(
                title: Text("Subject1 - Session 1"),
                backgroundColor: HexColor("#2e3440"),
            ),
            body: ListView(
            ),
            drawer: Container(
                width: 200,
                child: NavMenu(user),
            ),
        );
    }
}
