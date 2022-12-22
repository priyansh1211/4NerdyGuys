import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberSeries {
  final String year;
  final int subScribers;
  final charts.Color barColor;

  SubscriberSeries({
    required this.year,
    required this.subScribers,
    required this.barColor,
  });
}
