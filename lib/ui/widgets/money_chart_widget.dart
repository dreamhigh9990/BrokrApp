import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ColumnSeriesWidget extends StatefulWidget {
  /// Initialize the instance of the [ColumnSeriesWidget] class.
  const ColumnSeriesWidget({Key? key}) : super(key: key);

  @override
  State<ColumnSeriesWidget> createState() => _ColumnSeriesWidgetState();
}

class _ColumnSeriesWidgetState extends State<ColumnSeriesWidget> {
  _ColumnSeriesWidgetState();

  @override
  Widget build(BuildContext context) {
    return SfRangeSelectorTheme(
      data: SfRangeSelectorThemeData(),
      child: SfRangeSelector(
        startThumbIcon: const Icon(Icons.circle, size: 10, color: Colors.white),
        endThumbIcon: const Icon(Icons.circle, size: 10, color: Colors.white),
        activeColor: const Color(0xFF6366F1),
        onChanged: (SfRangeValues value) {
          //  print(value);
        },
        min: 100.0,
        max: 10000.0,
        initialValues: const SfRangeValues(2500.0, 5000.0),
        showLabels: true,
        interval: 9900,
        labelFormatterCallback: (dynamic actualValue, String formattedText) {
          return actualValue == 10000
              ? '\$ $formattedText'
              : '\$ $formattedText';
        },
        child: SizedBox(
          height: Get.context!.height * 0.15,
          child: SfCartesianChart(
            margin: const EdgeInsets.all(0),
            primaryXAxis: NumericAxis(
              minimum: 2.0,
              maximum: 10.0,
              isVisible: false,
            ),
            primaryYAxis: NumericAxis(isVisible: false),
            plotAreaBorderWidth: 0,
            series: <ColumnSeries<DataChart, double>>[
              ColumnSeries<DataChart, double>(
                  color: const Color(0xFF6366F1),
                  dataSource: [
                    DataChart(x: 2.0, y: 2.2),
                    DataChart(x: 2.25, y: 4.25),
                    DataChart(x: 2.5, y: 2.75),
                    DataChart(x: 2.75, y: 3.0),
                    DataChart(x: 3.0, y: 2.5),
                    DataChart(x: 3.25, y: 2.75),
                    DataChart(x: 3.5, y: 3.2),
                    DataChart(x: 3.75, y: 3.5),
                    DataChart(x: 4.0, y: 3.75),
                    DataChart(x: 4.25, y: 4.0),
                    DataChart(x: 4.5, y: 4.2),
                    DataChart(x: 4.75, y: 4.5),
                    DataChart(x: 5.0, y: 4.75),
                    DataChart(x: 5.25, y: 5.2),
                    DataChart(x: 5.5, y: 5.5),
                    DataChart(x: 5.75, y: 5.75),
                    DataChart(x: 6.0, y: 5.0),
                    DataChart(x: 6.25, y: 5.25),
                    DataChart(x: 6.5, y: 5.5),
                    DataChart(x: 6.75, y: 5.75),
                    DataChart(x: 7.0, y: 3.5),
                    DataChart(x: 7.25, y: 5),
                    DataChart(x: 7.5, y: 4.2),
                    DataChart(x: 7.75, y: 4.2),
                    DataChart(x: 8.0, y: 4),
                    DataChart(x: 8.25, y: 3.2),
                    DataChart(x: 8.5, y: 3.0),
                    DataChart(x: 8.75, y: 2.5),
                    DataChart(x: 9.0, y: 2.25),
                    DataChart(x: 9.25, y: 2.0),
                    DataChart(x: 9.5, y: 1.0),
                    DataChart(x: 9.75, y: 5.0),
                    DataChart(x: 10.0, y: 4.5),
                  ],
                  xValueMapper: (DataChart sales, int index) => sales.x,
                  yValueMapper: (DataChart sales, int index) => sales.y)
            ],
          ),
        ),
      ),
    );
  }
}

class DataChart {
  DataChart({required this.x, required this.y});
  final double x;
  final double y;

  static List<DataChart> getLisst() {
    List<DataChart> list = [];
    for (var i = 0; i <= 10; i++) {
      var locale = i + 2.0;
      list.add(DataChart(x: locale, y: 2.2));
      list.add(DataChart(x: locale + 0.25, y: 2.2));
      list.add(DataChart(x: locale + 0.5, y: 2.2));
      list.add(DataChart(x: locale + 0.75, y: 2.2));
    }
    return [];
  }
}
