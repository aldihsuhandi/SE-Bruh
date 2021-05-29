import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//import other dart file
import '../src/question.dart';
import '../src/session.dart';
import '../src/user.dart';
import '../src/subject.dart';
import 'drawer.dart';

class QuizBeginPage extends StatelessWidget
{
    final Quiz quiz;
    final User user;
    final List<Subject> subjects;
    QuizBeginPage(this.user, this.subjects, this.quiz);

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            backgroundColor: HexColor("#eceff4"),
            appBar: AppBar(
                title: Text("Quiz Page"),
                backgroundColor: HexColor("#2e3440"),
            ),
            body: Text(
                quiz.getSessionName()
            ),
            drawer: NavMenu(user, subjects, "begin quiz page"),
        );
    }
}
