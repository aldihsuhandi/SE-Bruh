import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// import other file
import 'drawer.dart';
import 'scorecharts.dart';
import '../src/user.dart';
import '../src/subject.dart';

class Profile extends StatelessWidget 
{
    final User user;
    final List<Subject> subjects;
    Profile(this.user, this.subjects);
    @override
    Widget build(BuildContext context) 
    {
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
                                    user.getName(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
                                        color: HexColor("#2e3440")
                                    ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                    user.getNis(),
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
                        child: GradeComboBox(user)
                    ),
                ],
            ),
            drawer: NavMenu(user, subjects, "profile"),
        );
    }
}

class GradeComboBox extends StatefulWidget 
{
    final User user;
    GradeComboBox(this.user);

    // const GradeComboBox({Key? key}) : super(key: key);
    @override
    State<GradeComboBox> createState() => _GradeComboBox(user);
}

class _GradeComboBox extends State<GradeComboBox> 
{
    final User user;
    _GradeComboBox(this.user);
    String val = "";
    List<String> subjectList = [];

    @override
    void initState() 
    {
        super.initState();
        subjectList = user.getAllSubjectName();
        if(subjectList.isEmpty == true)
        {
            val = "null";
        }
        else
        {
            val = subjectList[0];
        }
    }

    @override
    Widget build(BuildContext context) 
    {
        return SingleChildScrollView(
            child: Column(
                children: [
                    DropdownButton<String>(
                        value: val,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: HexColor("#2e3440"),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
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
                        items: subjectList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                            );
                        }).toList(),
                    ),
                    SizedBox(
                        height: 30,
                    ),
                    GradeGraph(val, user),
                ],
            ),
        );
    }
}
