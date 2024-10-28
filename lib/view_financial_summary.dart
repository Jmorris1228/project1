import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FinancialSummaryScreen extends StatefulWidget {
  @override
  _FinancialSummaryScreenState createState() => _FinancialSummaryScreenState();
}

class_FinancialSummaryScreenState extends State<FinancialSummaryScreen> {
  double score = 85; // Example score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Financial Summary")),
      body: Column(
        children: [
          // Gamified Score
          Text(
            'Your Score: $score%',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Graph (Example)
          SizedBox(height: 20),
          Expanded(child: FinancialGraph()),

          // Tip based on score
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: scoreTip(),
          ),
        ],
      ),
    );
  }

  Widget scoreTip() {
    if (score > 90) {
      return Text(
        'Great job! Keep saving!',
        style: TextStyle(fontSize: 18, color: Colors.green),
      );
    } else if (score > 70) {
      return Text(
        'You’re doing well! Save \$50 more for a 90% score!',
        style: TextStyle(fontSize: 18, color: Colors.orange),
      );
    } else {
      return Text(
        'You can improve! Cut down on expenses to boost your score.',
        style: TextStyle(fontSize: 18, color: Colors.red),
      );
    }
  }
}

// Example Graph Widget
class FinancialGraph extends StatelessWidget {
  final List<charts.Series> seriesList = [
    charts.Series<FinancialData, String>(
      id: 'Savings',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (FinancialData data, _) => data.month,
      measureFn: (FinancialData data, _) => data.amount,
      data: [
        FinancialData('October', 100),
        FinancialData('November', 150),
        FinancialData('December', 200),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(seriesList, animate: true);
  }
}

class FinancialData {
  final String month;
  final int amount;

  FinancialData(this.month, this.amount);
}
