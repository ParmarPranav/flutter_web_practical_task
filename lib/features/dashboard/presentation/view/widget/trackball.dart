import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../responsive_layout.dart';

class LineChartWithTrackball extends StatefulWidget {
  const LineChartWithTrackball({super.key});

  @override
  _LineChartWithTrackballState createState() => _LineChartWithTrackballState();
}

class _LineChartWithTrackballState extends State<LineChartWithTrackball> {
  late List<ChartData> chartData;
  late TrackballBehavior trackballBehavior;

  @override
  void initState() {
    super.initState();
    chartData = [
      ChartData(DateTime(2023, 5, 2), 12000, 8000),
      ChartData(DateTime(2023, 5, 10), 15000, 8500),
      ChartData(DateTime(2023, 6, 1), 20000, 11000),

      ChartData(DateTime(2023, 7, 1), 17000, 9400),
      ChartData(DateTime(2023, 7, 10), 13000, 7000),

      ChartData(DateTime(2023, 8, 20), 16000, 9700),
      ChartData(DateTime(2023, 9, 1), 19000, 10500),
      ChartData(DateTime(2023, 9, 20), 25000, 14500),
      ChartData(DateTime(2023, 10, 10), 19500, 10800),
      ChartData(DateTime(2023, 10, 20), 17500, 9500),

      ChartData(DateTime(2023, 11, 10), 18000, 9800),
      ChartData(DateTime(2023, 12, 1), 18500, 10100),
      ChartData(DateTime(2023, 12, 10), 21500, 11500),
      ChartData(DateTime(2023, 12, 20), 19000, 10300),
      ChartData(DateTime(2024, 1, 1), 15000, 7000),
      ChartData(DateTime(2024, 1, 10), 19500, 10600),
      ChartData(DateTime(2024, 1, 20), 22500, 12000),
      ChartData(DateTime(2024, 2, 1), 20000, 10800),
      ChartData(DateTime(2024, 2, 10), 23000, 12300),
      ChartData(DateTime(2024, 2, 20), 20500, 11000),
      ChartData(DateTime(2024, 3, 10), 21000, 11300),

      ChartData(DateTime(2024, 5, 1), 25000, 13200),
      ChartData(DateTime(2024, 5, 10), 22500, 12000),
      ChartData(DateTime(2024, 5, 20), 25500, 13500),
      ChartData(DateTime(2024, 6, 1), 23000, 12300),
      ChartData(DateTime(2024, 6, 20), 22000, 12500),
      ChartData(DateTime(2024, 7, 1), 20000, 14000),
      ChartData(DateTime(2024, 7, 10), 23000, 15000),
      ChartData(DateTime(2024, 7, 20), 25000, 15500),
    ];

    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
      lineType: TrackballLineType.vertical,
      lineDashArray: <double>[5, 5],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLightTheme ? Colors.white : Colors.transparent,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Consolidated Budget',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  children: [
                    if (ResponsiveLayout.isDesktop(context))
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            children: [Icon(CupertinoIcons.arrow_2_circlepath)],
                          ),
                        ),
                      ),
                    if (ResponsiveLayout.isDesktop(context))
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(children: [Icon(CupertinoIcons.ellipsis)]),
                        ),
                      ),
                    if (ResponsiveLayout.isDesktop(context))
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color:
                            isLightTheme
                                ? Colors.grey.shade50
                                : Colors.grey.shade900,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 3,
                          ),
                          child: Row(
                            children: [
                              Text('D'),
                              SizedBox(width: 15),
                              Text('M'),
                              SizedBox(width: 15),
                              Text('Y'),
                              SizedBox(width: 15),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 3,
                                  ),
                                  child: Text('All'),
                                ),
                              ),
                              SizedBox(width: 15),
                              Text('Custom'),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SfCartesianChart(
                legend: Legend(isVisible: true, position: LegendPosition.top),
                primaryXAxis: DateTimeAxis(
                  intervalType: DateTimeIntervalType.months,
                  dateFormat: DateFormat.MMM(),
                ),
                primaryYAxis: NumericAxis(
                  labelFormat: '\$ {value}',
                  title: AxisTitle(text: 'Amount in USD'),
                ),
                trackballBehavior: trackballBehavior,
                series: <LineSeries<ChartData, DateTime>>[
                  LineSeries<ChartData, DateTime>(
                    name: 'Revenues',
                    enableTrackball: true,
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.date,
                    yValueMapper: (ChartData data, _) => data.revenue,
                    color: Colors.blue,
                    width: 5,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                  LineSeries<ChartData, DateTime>(
                    name: 'Expenditures',
                    enableTrackball: true,

                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.date,
                    yValueMapper: (ChartData data, _) => data.expenditure,
                    color: Colors.red,
                    width: 5,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final DateTime date;
  final double revenue;
  final double expenditure;

  ChartData(this.date, this.revenue, this.expenditure);
}
