import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../db/model/trasaction_model.dart';
import '../../statistics%20screen/stastistics_screen.dart';

class ChartWidget extends StatefulWidget {
  ChartWidget({Key? key, required this.entireData, required this.height})
      : super(key: key);
  final List<TransactionModel> entireData;
  final double height;
  final List<FlSpot> dataSet = [];
  final List<FlSpot> dataSetIncome = [];
  final List<FlSpot> yearDataSetExpense = [];
  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColorsOne = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a)
    ];

    final List<Color> gradientColorsTwo = [
      const Color.fromARGB(255, 230, 35, 35),
      const Color.fromARGB(255, 211, 2, 2),
    ];
    if (widget.entireData.length < 2) {
      return const Center(
        child: Text('Not enough data to plot the graph'),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        height: widget.height,
        width: double.infinity,
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                  color: const Color.fromARGB(142, 55, 67, 77), width: 1),
            ),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color.fromARGB(79, 55, 67, 77),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color.fromARGB(79, 55, 67, 77),
                  strokeWidth: 1,
                );
              },
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                preventCurveOverShooting: true,
                belowBarData: BarAreaData(
                  show: true,
                  color: statisticsDropDownValue == 'Expense'
                      ? const Color.fromARGB(97, 244, 67, 54)
                      : const Color.fromARGB(91, 76, 175, 79),
                ),
                gradient: statisticsDropDownValue == 'Expense'
                    ? LinearGradient(colors: gradientColorsTwo)
                    : LinearGradient(colors: gradientColorsOne),
                spots: statisticsDropDownValue == 'Expense' &&
                        statisticsIndex == 1
                    ? getPlotPointsExpense(widget.entireData)
                    : statisticsDropDownValue == 'Income' &&
                            statisticsIndex == 1
                        ? getPlotPoints(widget.entireData)
                        : statisticsDropDownValue == 'Income' &&
                                statisticsIndex == 2
                            ? getYearPlotPointsIncome(widget.entireData)
                            : statisticsDropDownValue == 'Expense' &&
                                    statisticsIndex == 2
                                ? getYearPlotPointsExpense(widget.entireData)
                                : getPlotPoints(widget.entireData),
                barWidth: 3,
              ),
            ],
          ),
        ),
      );
    }
  }

//////////////////////////////////////////////////////////////////
  List<FlSpot> getPlotPoints(List<TransactionModel> entireData) {
    ChartWidget chart = ChartWidget(entireData: widget.entireData, height: 300);
    List tempDataSetIncome = [];
    final today = DateTime.now();

    for (TransactionModel data in entireData) {
      if (data.date.month == today.month && data.type == 'Income') {
        tempDataSetIncome.add(data);
      }
    }

    tempDataSetIncome.sort((a, b) => a.date.day.compareTo(b.date.day));
    for (var i = 0; i < tempDataSetIncome.length; i++) {
      int xAxis = tempDataSetIncome[i].date.day;
      int yAxis = tempDataSetIncome[i].amount;
      chart.dataSetIncome.add(FlSpot(xAxis.toDouble(), yAxis.toDouble()));
    }
    return chart.dataSetIncome;
  }

  List<FlSpot> getPlotPointsExpense(List<TransactionModel> entireData) {
    final today = DateTime.now();
    ChartWidget chart = ChartWidget(entireData: widget.entireData, height: 300);
    List tempDataSet = [];

    for (TransactionModel data in entireData) {
      if (data.date.month == today.month && data.type == 'Expense') {
        tempDataSet.add(data);
      }
    }

    tempDataSet.sort((a, b) => a.date.day.compareTo(b.date.day));
    for (var i = 0; i < tempDataSet.length; i++) {
      int xAxis = tempDataSet[i].date.day;
      int yAxis = tempDataSet[i].amount;
      chart.dataSet.add(FlSpot(xAxis.toDouble(), yAxis.toDouble()));
    }
    return chart.dataSet;
  }

  int getSumMonth(
      List<TransactionModel> entireData, int month, String transactionType) {
    int sum = 0;
    for (TransactionModel transaction in entireData) {
      if (transaction.date.month == month &&
          transaction.type == transactionType) {
        sum += transaction.amount;
      }
    }
    return sum;
  }

  //year expense
  List<FlSpot> getYearPlotPointsExpense(List<TransactionModel> entireData) {
    ChartWidget chart = ChartWidget(entireData: widget.entireData, height: 300);
    List yearTempDataSetExpense = [];
    for (var i = 1; i <= 12; i++) {
      yearTempDataSetExpense.add(getSumMonth(widget.entireData, i, 'Expense'));
    }

    for (var i = 0; i < yearTempDataSetExpense.length; i++) {
      chart.yearDataSetExpense
          .add(FlSpot(i + 1.toDouble(), yearTempDataSetExpense[i].toDouble()));
    }
    return chart.yearDataSetExpense;
  }

  //year Income
  List<FlSpot> getYearPlotPointsIncome(List<TransactionModel> entireData) {
    ChartWidget chart = ChartWidget(entireData: widget.entireData, height: 300);
    List yearTempDataSetIncome = [];

    for (var i = 1; i <= 12; i++) {
      yearTempDataSetIncome.add(getSumMonth(widget.entireData, i, 'Income'));
    }

    for (var i = 0; i < yearTempDataSetIncome.length; i++) {
      chart.yearDataSetExpense
          .add(FlSpot(i + 1.toDouble(), yearTempDataSetIncome[i].toDouble()));
    }
    return chart.yearDataSetExpense;
  }
}
