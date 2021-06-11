import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:myapp/src/user.dart';
import 'package:myapp/src/subject.dart';
import 'package:myapp/src/session.dart';
import 'package:myapp/src/question.dart';
import 'package:myapp/widget/drawer.dart';
import 'package:myapp/widget/animation.dart';
import 'package:myapp/widget/profile.dart';

class AnswerDialog extends StatelessWidget
{
    final User user;
    final Quiz quiz;
    final List<Subject> subjects;
    final List<Option> answer;
    AnswerDialog(this.user, this.subjects, this.answer, this.quiz);

    @override
    Widget build(BuildContext context)
    {
        return AlertDialog(
            title: const Text(
                'Submit test?',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                ),
            ),
            actions: <Widget>[
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(HexColor("#bf616a")),
                    ),
                    onPressed: () {
                        Navigator.pop(context, 'Cancel');
                    },
                    child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: HexColor("#2e3440")
                        ),
                    ),
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(HexColor("#a3be8c")),
                    ),
                    onPressed: () {
                        Navigator.pop(context, 'Sumbit');
                        Navigator.of(context).push(FadePageroute(AnswerPage(user, subjects, answer, quiz)));
                    },
                    child: Text(
                        'Submit',
                        style: TextStyle(
                            color: HexColor("#2e3440")
                        ),
                    ),
                ),
            ],
        );
    }
}

class AnswerPage extends StatelessWidget
{
    final User user;
    final Quiz quiz;
    final List<Subject> subjects;
    final List<Option> answer;
    AnswerPage(this.user, this.subjects, this.answer, this.quiz);

    Widget correctAnswer(bool correct, int idx, List<Question> questions)
    {
        Color bg = correct == true ? HexColor("#a3be8c") : HexColor("#BF616A");

        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: bg,
            ),
            margin: EdgeInsets.only(
                top: 5,
                bottom: 5,
            ),
            child: ExpansionTile(
                title: Center(
                    child: Text(
                        questions[idx].getQuestion(),
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                        )
                    )
                ),
                children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 20,
                            right: 20,
                        ),
                        decoration: BoxDecoration(
                            color: HexColor("#e5e9f0"),
                        ),
                        child: Text(
                            "Your answer: " + answer[idx].opt,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: HexColor("#2e3440"),
                                fontFamily: 'Roboto',
                                fontSize: 15,
                            )
                        )
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 20,
                            right: 20,
                        ),
                        decoration: BoxDecoration(
                            color: HexColor("#e5e9f0"),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)
                            ),
                        ),
                        child: Text(
                            "Correct answer: " + questions[idx].getAnswer(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: HexColor("#2e3440"),
                                fontFamily: 'Roboto',
                                fontSize: 15,
                            )
                        )
                    ),
                ]
            ),
        );
    }

    void addScore(List<String> session, double score)
    {
        quiz.setIsDone(true);
        user.addScore(session[0], score);
    }

    @override
    Widget build(BuildContext context)
    {
        List<Question> questions = quiz.getQuestions();
        List<String> session = quiz.getSessionName().split(" - ");
        double total = answer.length.toDouble();
        double score = 0.0;

        for(int i = 0;i < answer.length;++i){
            String correctAns = questions[i].getAnswer();
            if(correctAns == answer[i].opt)
            {
                score += 1;
            }
            else if(answer[i].opt == "")
            {
                answer[i].opt = "You didn't Give An Answer";
            }
        }

        score = score / total * 100;

        addScore(session, score);

        List<Widget> child = [];

        List<Widget> container = [];

        container.add(
            new Container(
                child: Text(
                    session[0],
                    style: TextStyle(
                        color: HexColor("#2e3440"),
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                    ),
                ),
            ),
        );

        container.add(
            new Container(
                padding: EdgeInsets.only(
                    bottom: 30,
                ),
                child: Text(
                    session[1],
                    style: TextStyle(
                        color: HexColor("#2e3440"),
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    )
                )
            )
        );

        container.add(
            new Container(
                padding: EdgeInsets.only(
                    bottom: 20,
                ),
                child: Text(
                    "Score: " + score.toStringAsFixed(2),
                    style: TextStyle(
                        color: HexColor("#2e3440"),
                        fontFamily: 'Roboto',
                        fontSize: 20,
                    ),
                )
            )
        );

        child.add(new Container(
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: container,
                        ),
                    ),
                ],
            )
        ));

        for(int i = 0;i < answer.length;++i){
            String correctAns = questions[i].getAnswer();
            child.add(correctAnswer(correctAns == answer[i].opt, i, questions));
        }

        child.add(
            new SizedBox(
                height: 25,
            )
        );

        child.add(
            new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                            right: 20,
                            bottom: 25,
                        ),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(HexColor("#4c566a")),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                )
                            ),
                            child: Container(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                    "Back" + '\n' + "to Profile",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: HexColor("#eceff4"),
                                    ),
                                ),
                            ),
                            onPressed: (){
                                Navigator.of(context).push(FadePageroute(Profile(user, subjects)));
                            },
                        ),
                    ),
                ]
            ),
        );

        // child.add(
        //     new Container(
        //         child: Center(
        //             child: TextButton(
        //                 child: Text("Back To Profile"),
        //                 onPressed: (){
        //                     // Navigator.of(context).push(FadePageroute(Profile(user, subjects)));
        //                 },
        //             ),
        //         )
        //     )
        // );

        Widget answerpage = Scaffold(
            backgroundColor: HexColor("#eceff4"),
            appBar: AppBar(
                title: Text("Quiz Summary"),
                backgroundColor: HexColor("#2e3440"),
            ),
            body: Container(
                padding: EdgeInsets.only(
                    top: 50,
                    left: 40,
                    right: 40
                ),
                child: ListView(
                    children: child,
                ),
            ),
            drawer: NavMenu(user, subjects),
        );

        return answerpage;
    }
}
