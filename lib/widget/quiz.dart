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

    Color nextButtonColor = HexColor("#d8dee9");
    Color nextTextColor = HexColor("#2e3440");
    Color prevButtonColor = HexColor("#d8dee9");
    Color prevTextColor = HexColor("#2e3440");

    @override
    void initState() 
    {
        super.initState();
        len = questions.length;
        idx = 0;
        this.changeButtonColor();
    }

    void changeButtonColor()
    {
        if(idx == 0)
        {
            this.prevTextColor = HexColor("#6e7c99");
            this.nextTextColor = HexColor("#2e3440");
        }
        else if(idx == len - 1)
        {
            this.prevTextColor = HexColor("#2e3440");
            this.nextTextColor = HexColor("#6e7c99");
        }
        else
        {
            this.prevTextColor = HexColor("#2e3440");
            this.nextTextColor = HexColor("#2e3440");
        }
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

        child.add(new SizedBox(height: 50));

        Widget row = new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(prevButtonColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: prevTextColor),
                            )
                        )
                    ),
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                            "Previous",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                color: prevTextColor,
                            ),
                        ),
                    ),
                    onPressed:() {
                        setState(() {
                            if(this.idx != 0)
                                this.idx--;
                            this.changeButtonColor();
                        });
                    },
                ),
                SizedBox(
                    width: 25,
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(HexColor("#d8dee9")),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: HexColor("#2e3440")),
                            )
                        )
                    ),
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                color: HexColor("#2e3440")
                            ),
                        ),
                    ),
                    onPressed: (){},
                ),
                SizedBox(
                    width: 25,
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(nextButtonColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: nextTextColor),
                            )
                        )
                    ),
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                color: nextTextColor,
                            ),
                        ),
                    ),
                    onPressed:() {
                        setState(() {
                            if(this.idx != len - 1)
                                this.idx++;
                            this.changeButtonColor();
                        });
                    },
                ),
            ],
        );

        child.add(
            new Container(
                child: row,
                margin: EdgeInsets.only(
                    right: 40
                ),
            ),
        );

        return Column(
            children: child,
        );
    }
}

class QuestionDisplay extends StatelessWidget
{
    final Question question;
    QuestionDisplay(this.question);

    @override
    Widget build(BuildContext context) 
    {
        List<Widget> child = [];
        return Container(
            child: Column(
                children: child,
            )
        );
    }
}
