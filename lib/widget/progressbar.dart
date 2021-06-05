import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuizProgressBar extends StatelessWidget
{
    final int total;
    final int progress;
    QuizProgressBar(this.progress, this.total);
    
    @override
    Widget build(BuildContext context) 
    {
        double percent = progress.toDouble() / total.toDouble();
        Widget progressbar = new Container(
            margin: EdgeInsets.only(
                left: 60,
                right: 60,
            ),
            alignment: Alignment.center,
            child: LinearPercentIndicator(
                lineHeight: 5.0,
                percent: percent,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.blue[400],
                backgroundColor: Colors.grey[300],
            ),
        );

        return progressbar;
    }
}
