import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// include other dart file
import 'profile.dart';
import 'subject.dart';

class NavMenu extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                padding: EdgeInsets.only(
                    bottom: 20,
                ),
                children: <Widget> [
                    Container(
                        height: 160,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: HexColor("#2e3440"),
                            boxShadow: [
                                BoxShadow(
                                    color: HexColor("#2e3440"),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 0),
                                ),
                            ],
                            border: Border.all(
                                color: HexColor("#2e3440"),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Material(
                            color: Colors.white.withOpacity(0),
                            child: InkWell(
                                onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) => Profile()),
                                    // );
                                },
                                child: Icon(
                                    Icons.person,
                                    color: HexColor("#eceff4"),
                                    size: 80
                                )
                            ),
                        ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: HexColor("#2e3440"),
                            boxShadow: [
                                BoxShadow(
                                    color: HexColor("#4c566a"),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 0),
                                ),
                            ],
                            border: Border.all(
                                color: HexColor("#2e3440"),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                            children: [
                                ExpansionTile(
                                    title: Text(
                                        "Subject 1",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: HexColor("#eceff4"),
                                        ),
                                    ),
                                    children: <Widget>[
                                        ListTile(
                                            title: Center(
                                                child: Text(
                                                    "Session 1",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: HexColor("#eceff4"),
                                                    ),
                                                ),
                                            ),
                                            onTap: () {
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => Sessionpage()),
                                                );
                                            },
                                        ),
                                        ListTile(
                                            title: Center(
                                                child: Text(
                                                    "Session 2",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: HexColor("#eceff4"),
                                                    ),
                                                ),
                                            ),
                                            onTap: () {
                                                Navigator.pop(context);
                                            },
                                        )
                                    ],
                                ),
                                ExpansionTile(
                                    title: Text(
                                        "Placeholder text",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: HexColor("#eceff4"),
                                        ),
                                    ),
                                    children: <Widget>[
                                        ListTile(
                                            title: Center(
                                                child: Text(
                                                    "Placeholder text",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: HexColor("#eceff4"),
                                                    ),
                                                ),
                                            ),
                                            onTap: () {
                                                Navigator.pop(context);
                                            },
                                        ),
                                        ListTile(
                                            title: Center(
                                                child: Text(
                                                    "Placeholder text",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: HexColor("#eceff4"),
                                                    ),
                                                ),
                                            ),
                                            onTap: () {
                                                Navigator.pop(context);
                                            },
                                        )
                                    ],
                                ),
                            ],
                        ),
                    ),
                ]
            ),
        );
    }
}
