import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home(),
));

class Home extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Homapage"),
            ),
            body: Column(
                children: [
                    Expanded(
                        child: Center(
                            child: Column(
                                children: [
                                    Container(
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(width:2, color: Colors.grey)
                                        ),
                                        child: Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                            size: 100.0,
                                        ),
                                    ),
                                    Text(
                                        "NAME",
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                    ),
                                    Text(
                                        "NIS",
                                    ),
                                ]
                            ),
                        ),
                    ),
                ],
            ),
            drawer: Container(
                width: 200,
                child: NavMenu(),
            ),
        );
    }
}

class NavMenu extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget> [
                    Material(
                        color: Colors.blue,
                        child: InkWell(
                            onTap: () {
                                print("profile clicked");
                            },
                            child: Container(
                                child: Column(
                                    children: [
                                        Container(
                                            margin: EdgeInsets.all(20),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black
                                                ),
                                            ),
                                            child: Icon(
                                                Icons.person,
                                                color: Colors.black,
                                                size: 50.0,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    ),
                    ExpansionTile(
                        title: Text("Subject"),
                        children: <Widget>[
                            ListTile(
                                title: Text("Session 1"),
                                onTap: () {
                                    Navigator.pop(context);
                                },
                            ),
                            ListTile(
                                title: Text("Session 2"),
                                onTap: () {
                                    Navigator.pop(context);
                                },
                            )
                        ],
                    ),
                ]
            ),
        );
    }
}
