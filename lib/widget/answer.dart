import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:myapp/src/user.dart';
import 'package:myapp/src/subject.dart';
import 'package:myapp/src/session.dart';
import 'package:myapp/src/question.dart';
import 'package:myapp/widget/drawer.dart';
import 'package:myapp/widget/animation.dart';

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
            margin: EdgeInsets.only(
                bottom: 20
            ),
            decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            (idx + 1).toString() + ". " + questions[idx].getQuestion(),
                            style: TextStyle(
                                color: HexColor("#2e3440"),
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            )
                        ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: HexColor("#D8DEE9"),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                            )
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                Text(
                                    "Correct answer: " + questions[idx].getAnswer()
                                ),
                                SizedBox(
                                    height: 10
                                ),
                                Text(
                                    "Your answer: " + answer[idx].opt
                                ),
                            ],
                        ),
                    )
                ],
            ),
        );
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

        print(score);
        print(total);

        score = score / total * 100;

        List<Widget> child = [];

        child.add(
            new Container(
                // alignment: Alignment.center,
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

        child.add(
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

        child.add(
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

        for(int i = 0;i < answer.length;++i){
            String correctAns = questions[i].getAnswer();
            child.add(correctAnswer(correctAns == answer[i].opt, i, questions));
        }

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
