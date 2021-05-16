import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fl_chart/fl_chart.dart';

// import other file
import 'src/drawer.dart';

void main() => runApp(MaterialApp(
    home: Profile(),
));

class Profile extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: HexColor("#eceff4"),
            appBar: AppBar(
                title: Text("Profile page"),
                backgroundColor: HexColor("#2e3440"),
            ),
            body: Column(
                children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 10
                                    ),
                                    child: Row(
                                        children: [
                                            Container(
                                                padding: EdgeInsets.all(5),
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
                                                    size: 65,
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
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 30
                                    ),
                                    child: Text(
                                        "School name",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 20,
                                        ),
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
