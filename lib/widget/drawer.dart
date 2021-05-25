import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// include other dart file
import 'subject.dart';
import '../src/user.dart';
import '../src/subject.dart';
import '../src/session.dart';

class NavMenu extends StatelessWidget 
{
    final User user;
    final List<Subject> subjects;
    final String currScreen;
    NavMenu(this.user, this.subjects, this.currScreen);
    @override
    Widget build(BuildContext context) 
    {
        return Container(
            width: 250,
            child: Drawer(
                child: ListView(
                    padding: EdgeInsets.only(
                        bottom: 20,
                    ),
                    children: <Widget> [
                        ProfileButton(user, currScreen),
                        SubjectList(user, subjects),
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
            height: 200,
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
    final List<Subject> subjects;
    SubjectList(this.user, this.subjects);
    @override
    Widget build(BuildContext context)
    {
        List<Widget> subjectTile = [];

        for(Subject subject in subjects) {
            List<Widget> childs = [];
            for(Session session in subject.getSessions()){
                childs.add(SubjectButton(session));
            }

            ExpansionTile temp = new ExpansionTile(
                title: Center(
                    child: Text(
                        subject.getSubjectCode() + ' - ' + subject.getSubjectName(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: HexColor("#eceff4"),
                        ),
                    ),
                ),
                children: childs,
            );

            subjectTile.add(temp);
        }

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
                children: subjectTile
            ),
        );
    }
}

class SubjectButton extends StatelessWidget
{
    final Session session;
    SubjectButton(this.session);
    @override
    Widget build(BuildContext context)
    {
        return Container(
            height: 35,
            child: Material(
                color: HexColor("#434c5e"),
                child: InkWell(
                    child: Center(
                            child: Text(
                            session.getSessionName(),
                            style: TextStyle(
                                fontSize: 15,
                                color: HexColor("#eceff4")
                            )
                        ),
                    ),
                    onTap: (){
                        Navigator.pop(context);
                    },
                )
            ),
        );
    }
}
