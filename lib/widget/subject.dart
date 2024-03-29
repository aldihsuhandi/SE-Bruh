import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// import other file
import 'package:myapp/widget/drawer.dart';
import 'package:myapp/src/user.dart';
import 'package:myapp/src/subject.dart';

class Sessionpage extends StatelessWidget {
    @override
    final User user;
    final List<Subject> subjects;
    Sessionpage(this.user, this.subjects);
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: HexColor("#eceff4"),
            appBar: AppBar(
                title: Text("Subject1 - Session 1"),
                backgroundColor: HexColor("#2e3440"),
            ),
            body: ListView(
            ),
            drawer: NavMenu(user, subjects),
        );
    }
}
