import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fl_chart/fl_chart.dart';

// import other dart fike
import '../src/user.dart';
import '../src/score.dart';

class GradeGraph extends StatelessWidget
{
    final List<Color> graphColors = [
        const Color(0xffeceff4)
    ];
    final List<Color> belowGraphColor = [
        const Color(0xffabb2bf)
    ];
    final User user;
    final String subject;
    GradeGraph(this.subject, this.user);

    @override
    Widget build(BuildContext context) {
        if(subject  == "null")
        {
            return Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    user.getName() + " don't have any score history"
                ),
            );
        }

        List<FlSpot> data = [];
        Score sc = user.getScores().firstWhere(
            (element) => element.getSubjectName() == subject
        );
        int len = sc.getScoreList().length;

        for(int i = 0;i < len;++i) {
            int x = i;
            int y = sc.getScoreList()[i];
            data.add(new FlSpot(x.toDouble(), y.toDouble()));
        }

        return Container(
            margin: EdgeInsets.only(
                left: 20,
                right: 20,
            ),
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
                color: HexColor("#2e3440")
            ),
            child: Container(
                margin: EdgeInsets.only(
                    top: 20,
                    right: 20,
                    bottom: 20,
                ),
                child: LineChart(
                    LineChartData(
                        minX: 0,
                        maxX: len.toDouble() - 1,
                        minY: 0,
                        maxY: 100,
                        lineTouchData: LineTouchData(
                            touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor: HexColor("#2e3440")
                            ),
                        ),
                        titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                                showTitles: false
                            ),
                            leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                    color: Color(0xffeceff4),
                                    fontSize: 10,
                                ),
                                getTitles: (value) {
                                    switch(value.toInt()) 
                                    {
                                        case 0:
                                            return '0';
                                        case 50:
                                            return '50';
                                        case 100:
                                            return '100';
                                        default:
                                            return '';
                                    }
                                }
                            ),
                        ),
                        gridData: FlGridData(
                            show: false
                        ),
                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                                color: HexColor("#eceff4")
                            ),
                        ),
                        lineBarsData: [
                            LineChartBarData(
                                isCurved: true,
                                colors: graphColors,
                                barWidth: 3,
                                belowBarData: BarAreaData(
                                    show: true,
                                    colors: belowGraphColor.map((color) => color.withOpacity(0.3)).toList()
                                ),
                                spots: data
                            )
                        ]
                    ),
                )
            ),
        );
    }
}
