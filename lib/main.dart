import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// import other file
import 'package:myapp/widget/profile.dart';
import 'package:myapp/src/user.dart';
import 'package:myapp/src/subject.dart';

// temporary import
import 'package:myapp/src/session.dart';

void main()
{
    // user temporary file
    User user = new User("Aldih suhandi", "2301862632");
    user.addScore("Math", 80);
    user.addScore("Math", 81);
    user.addScore("Math", 97);
    user.addScore("Math", 79);
    user.addScore("Math", 59);
    user.addScore("Math", 100);
    user.addScore("Physics", 50);
    user.addScore("Physics", 70);
    user.addScore("Physics", 65);
    user.addScore("Physics", 90);
    user.addScore("Physics", 100);

    // subject temporary file
    List<Subject> subjects = [];
    subjects.add(new Subject("SU001", "Subject 1"));
    subjects[0].addLearning("Session 1", "Test path", "Lorem ipsum");

    Quiz quiz = new Quiz("Subject - Quiz");
    quiz.addQuestions(
        "Question 1",
        "Right answer",
        ["Wrong answer", "Wrong answer", "Wrong answer", "Right answer"]);
    quiz.addQuestions(
        "Question 2",
        "Right answer",
        ["Wrong answer", "Wrong answer", "Wrong answer", "Right answer"]);
    quiz.addQuestions(
        "Question 3",
        "Right answer",
        ["Wrong answer", "Wrong answer", "Wrong answer", "Right answer"]);
    quiz.addQuestions(
        "Question 4",
        "Right answer",
        ["Wrong answer", "Wrong answer", "Wrong answer", "Right answer"]);
    quiz.addQuestions(
        "Question 5",
        "Right answer",
        ["Wrong answer", "Wrong answer", "Wrong answer", "Right answer"]);
    quiz.addQuestions(
        "Question 6",
        "Right answer",
        ["Wrong answer", "Right answer"]);
    subjects[0].addQuiz(quiz);

    subjects.add(new Subject("Placeholder", "Placeholder"));
    subjects.add(new Subject("Placeholder", "Placeholder"));
    subjects.add(new Subject("Placeholder", "Placeholder"));

    runApp(
        MaterialApp(
            theme: ThemeData(
                fontFamily: "Roboto",
                canvasColor: HexColor("#eceff4"),
            ),
            home: Profile(user, subjects)
        )
    );
}
