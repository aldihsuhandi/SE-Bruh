import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// import other dart fike
import '../src/user.dart';
import '../src/score.dart';

class GradeGraph extends StatelessWidget 
{
    final User user;
    final String subject;
    final List<ScoreChartModel> data = [];
    GradeGraph(this.subject, this.user);

    void init()
    {
        Score sc = user.getScores().firstWhere(
            (element) => element.getSubjectName() == subject
        );
        int len = sc.getScoreList().length;
        for(int i = 0;i < len;++i){
            data.add(
                new ScoreChartModel(
                    sc.getScoreList()[i], 
                    i + 1, 
                    HexColor("#2e3440")
                )
            );
        }
    }

    @override
    Widget build(BuildContext context) 
    {
        if(subject == "null")
        {
            return Text(
                "User don't have any score history"
            );
        }

        init();
        var series = [
            new charts.Series(
                id: "scores",
                data: data,
                domainFn: (ScoreChartModel scoreData, _) => scoreData.quiz,
                measureFn: (ScoreChartModel scoreData, _) => scoreData.score,
                colorFn: (ScoreChartModel scoreData, _) => scoreData.color,
            ),
        ];

        var chart = charts.LineChart(
            series,
            animate: true,
        );

        var chartWidget = Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
                height: 500,
                child: chart
            ),
        );

        return chartWidget;
    }
}

class ScoreChartModel
{
    final int score;
    final int quiz;
    final charts.Color color;
    ScoreChartModel(this.score, this.quiz, Color c)
    : this.color = charts.Color(
        r: c.red,
        g: c.green,
        b: c.blue,
        a: c.alpha
    );
}
