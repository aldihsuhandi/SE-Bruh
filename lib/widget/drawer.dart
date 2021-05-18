import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// include other dart file
import 'subject.dart';
import '../src/user.dart';

class NavMenu extends StatelessWidget 
{
    final User user;
    final String currScreen;
    NavMenu(this.user, this.currScreen);
    @override
    Widget build(BuildContext context) 
    {
        return Container(
            width: 220,
            child: Drawer(
                child: ListView(
                    padding: EdgeInsets.only(
                        bottom: 20,
                    ),
                    children: <Widget> [
                        ProfileButton(user, currScreen),
                        SubjectList(user),
                    ]
                ),
            ),
        );
    }
}

class ProfileButton extends StatelessWidget
{
    final String currScreen;
    final User user;
    ProfileButton(this.user, this.currScreen);
    @override
    Widget build(BuildContext context)
    {
        return Container(
            height: 180,
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
                        if(currScreen != "profile")
                            Navigator.pop(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => Profile(user)),
                        // );
                    },
                    child: Icon(
                        Icons.person,
                        color: HexColor("#eceff4"),
                        size: 80
                    )
                ),
            ),
        );
    }
}

class SubjectList extends StatelessWidget
{
    final User user;
    SubjectList(this.user);
    @override
    Widget build(BuildContext context)
    {
        return Container(
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
                                        MaterialPageRoute(builder: (context) => Sessionpage(user)),
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
                ],
            ),
        );
    }
}
