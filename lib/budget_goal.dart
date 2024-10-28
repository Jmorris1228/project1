//use case4
import 'package:flutter/material.dart';

class BudgetGoalsScreen extends StatefulWidget {
  @override
  _BudgetGoalsScreenState createState() => _BudgetGoalsScreenState();
}

class _BudgetGoalsScreenState extends State<BudgetGoalsScreen> {
  double savingsGoal = 500;
  double currentSavings = 200;
  String rewardMessage = "";

  void checkMilestone() {
    if (currentSavings >= savingsGoal) {
      setState(() {
        rewardMessage = "Congratulations! You've hit your savings goal!";
      });
    } else if (currentSavings >= savingsGoal * 0.5) {
      setState(() {
        rewardMessage = "Halfway there! Keep saving!";
      });
    } else {
      setState(() {
        rewardMessage = "Keep going! Every bit counts!";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkMilestone(); // Check milestones on load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Set Budget Goals")),
      body: Column(
        children: [
          // Budget goal status
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Savings Goal: \$${savingsGoal.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Current Savings: \$${currentSavings.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),

          // Reward/Tip message
          Text(
            rewardMessage,
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          SizedBox(height: 20),

          // Animation for milestone reward (example)
          currentSavings >= savingsGoal
              ? Icon(Icons.star, color: Colors.amber, size: 50)
              : SizedBox(),

          // Update savings button
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentSavings += 50; // Simulate adding savings
                checkMilestone(); // Check for milestone
              });
            },
            child: Text('Add Savings'),
          ),
        ],
      ),
    );
  }
}
