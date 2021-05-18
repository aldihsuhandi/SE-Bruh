import 'package:flutter/material.dart';

// import other file
import 'widget/profile.dart';
import 'src/user.dart';

void main()
{
    User user = new User("Aldih suhandi", "2301862632");
    user.addScore("Math", 80);
    user.addScore("Math", 81);
    user.addScore("Math", 97);
    user.addScore("Math", 79);
    user.addScore("Physics", 50);
    user.addScore("Physics", 70);
    user.addScore("Physics", 65);
    user.addScore("Physics", 90);
    user.addScore("Physics", 0);
    runApp(MaterialApp(home: Profile(user)));
}
