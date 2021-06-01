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
            body: ListView(
                children: [
                    Container(
                        child: Text(
                            quiz.getSessionName(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Roboto'
                            ),
                        ),
                        padding: EdgeInsets.only(
                            top: 50,
                            bottom: 100,
                        ),
                    ),
                    QuizQuestion(quiz.getQuestions()),
                ],
            ),
            drawer: NavMenu(user, subjects),
        );
    }
}

class QuizQuestion extends StatefulWidget 
{
    final List<Question> questions;
    QuizQuestion(this.questions);

    @override
    State<QuizQuestion> createState() => _QuizQuestion(questions);
}

class _QuizQuestion extends State<QuizQuestion>
{
    final List<Question> questions;
    _QuizQuestion(this.questions);

    late int idx;
    late int len;

    @override
    void initState() 
    {
        super.initState();
        len = questions.length;
        idx = 0;
    }

    @override
    Widget build(BuildContext context) 
    {
        List<Widget> child = [];

        child.add(
            Text(
                (idx + 1).toString()
            )
        );

        Widget temp = new Row(
            children: [
                Expanded(
                    child: Container(
                        child: TextButton(
                            child: Text("Prev"),
                            onPressed: () {
                                setState(() {
                                    if(this.idx != 0)
                                        this.idx--;
                                });
                            },
                        ),
                    ),
                ),
            ],
        );

        child.add(temp);

        return Column(
            children: child,
        );
    }
}
