import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fl_chart/fl_chart.dart';

// import other file
import '../src/drawer.dart';

class Profile extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: HexColor("#eceff4"),
            appBar: AppBar(
                title: Text("Profile page"),
                backgroundColor: HexColor("#2e3440"),
            ),
            body: ListView(
                children: [
                    Center(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: HexColor("#2e3440"),
                                borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                                Icons.person,
                                size: 150,
                                color: HexColor("#eceff4")
                            ),
                        ),
                    ),
                    Center(
                        child: Column(
                            children: [
                                Text(
                                    "NAME",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
                                        color: HexColor("#2e3440")
                                    ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                    "NIS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Roboto',
                                        fontSize: 15,
                                        color: HexColor("#2e3440")
                                    ),
                                ),
                            ],
                        )
                    ),
                    SizedBox(height: 20),
                    Container(
                        margin: EdgeInsets.only(
                            left: 20,
                            right: 20
                        ),
                        child: Text(
                            "Grade",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, 
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                color: HexColor("#2e3440"),
                            ),
                            textAlign: TextAlign.left,
                        ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 20,
                            right: 20
                        ),
                        child: GradeComboBox()
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

class GradeComboBox extends StatefulWidget {
    const GradeComboBox({Key? key}) : super(key: key);
    @override
    State<GradeComboBox> createState() => _GradeComboBox();
}

class _GradeComboBox extends State<GradeComboBox> {
    String val = "Subject 1";
    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                DropdownButton<String>(
                    value: val,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: HexColor("#2e3440"),
                    ),
                    underline: Container(
                        height: 2,
                        color: HexColor("#2e3440"),
                    ),
                    onChanged: (String? newVal) {
                        setState((){
                            val = newVal!;
                        });
                    },
                    items: <String>["Subject 1", "Subject 2", "Subject 3"].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                        );
                    }).toList(),
                ),
                GradeGraph(val),
            ],
        );
    }
}

class GradeGraph extends StatelessWidget {
    final String subject;
    GradeGraph(this.subject);

    @override
      Widget build(BuildContext context) {
          return Text(subject);
      }
}
