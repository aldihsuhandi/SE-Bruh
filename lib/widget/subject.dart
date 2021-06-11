import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';

import 'package:myapp/widget/drawer.dart';
import 'package:myapp/src/user.dart';
import 'package:myapp/src/subject.dart';
import 'package:myapp/src/session.dart';

class Sessionpage extends StatelessWidget {
    final User user;
    final List<Subject> subjects;
    final Learning learning;
    Sessionpage(this.user, this.subjects, this.learning);

    late String data;

    Future<String> _getPath() async
    {
        final dir = await getApplicationDocumentsDirectory();
        return dir.path;
    }

    Future<void> _readData() async
    {
        String _p = learning.getTextPath();
        final _path = await _getPath();
        final _file = File('$_path/$_p');
        final _data = await _file.readAsString(encoding: utf8);
        data = _data;
    }

    @override
    Widget build(BuildContext context) {
        String sessionName = learning.getSessionName();
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
