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
    late List<Option> ans;

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

        ans = List<Option>.filled(len, new Option(0, ""));
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
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                ),
                child: Text(
                    "Question no." + (idx + 1).toString(),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14
                    ),
                ),
            )
        );
        child.add(questionDisplay(idx));

        child.add(new SizedBox(height: 50));

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

    Widget questionDisplay(int idx)
    {
        List<Widget> child = [];

        Widget questionText = new Text(
            questions[idx].getQuestion(),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w500,
            ),
        );

        child.add(
            new Container(
                padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: HexColor("#d8dee9"),
                    borderRadius: BorderRadius.circular(5),
                ),
                child: questionText
            )
        );

        child.add(new SizedBox(height: 25));

        child.add(
            new Container(
                padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: HexColor("#d8dee9"),
                    borderRadius: BorderRadius.circular(5),
                ),
                child: questionRadioButton(idx)
            )
        );

        return Column(
            children: child
        );
    }

    Widget questionRadioButton(int idx)
    {
        List<Widget> child = [];
        List<String> t = questions[idx].getOptions();
        List<Option> options = [];

        int len = t.length;

        for(int i = 0;i < len;++i){
            options.add(new Option(i + 1, t[i]));
        }

        child = options.map(
            (e) => RadioListTile(
                title: Text(e.opt),
                groupValue: ans[idx].indx,
                value: e.indx,
                onChanged: (val) {
                    setState(() {
                        ans[idx] = e;
                    });
                },
            )
        ).toList();

        return Column(
            children: child,
        );
    }
}

class Option
{
    int indx;
    String opt;
    Option(this.indx, this.opt);
}
