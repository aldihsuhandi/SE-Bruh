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
                    HexColor("#eceff4")
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
                user.getName() + " don't have any score history"
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
            domainAxis: new charts.NumericAxisSpec(
                tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                    zeroBound: false,
                ),
                renderSpec: new charts.SmallTickRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                        fontSize: 14,
                        color: new charts.Color(
                            r: HexColor("#eceff4").red,
                            g: HexColor("#eceff4").green,
                            b: HexColor("#eceff4").blue,
                            a: HexColor("#eceff4").alpha,
                        ),
                    ),
                ),
            ),
            primaryMeasureAxis: charts.NumericAxisSpec(
                tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                    zeroBound: true,
                ),
                renderSpec: new charts.SmallTickRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                        fontSize: 14,
                        color: new charts.Color(
                            r: HexColor("#eceff4").red,
                            g: HexColor("#eceff4").green,
                            b: HexColor("#eceff4").blue,
                            a: HexColor("#eceff4").alpha,
                        ),
                    ),
                ),
            ),
        );

        var chartWidget = Container(
            color: HexColor("#2e3440"),
            padding: EdgeInsets.all(20),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
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
