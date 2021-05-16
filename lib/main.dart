import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MaterialApp(
    home: Home(),
));

class Home extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: HexColor("#eceff4"),
            appBar: AppBar(
                title: Text("Homepage"),
                backgroundColor: HexColor("#2e3440"),
            ),
            body: Column(
                children: [
                    Expanded(
                        child: Column(
                            children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 30
                                    ),
                                    child: Row(
                                        children: [
                                            Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(100),
                                                    border: Border.all(
                                                        width: 2,
                                                        color: HexColor("#2e3440"),
                                                    ),
                                                ),
                                                child: Icon(
                                                    Icons.person,
                                                    color: HexColor("#2e3440"),
                                                    size: 100,
                                                )
                                            ),
                                            Container(
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                        Text(
                                                            "Name",
                                                            style: TextStyle(
                                                                fontFamily: 'Roboto',
                                                                fontSize: 20,
                                                            ),
                                                        ),
                                                        SizedBox(
                                                            height: 5,
                                                        ),
                                                        Text(
                                                            "NIS",
                                                            style: TextStyle(
                                                                fontFamily: 'Roboto',
                                                                fontSize: 15,
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
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
                        color: HexColor("#2e3440"),
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
                                                color: HexColor("#eceff4"),
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(
                                                    width: 2,
                                                    color: HexColor("#eceff4"),
                                                ),
                                            ),
                                            child: Icon(
                                                Icons.person,
                                                color: HexColor("#2e3440"),
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
