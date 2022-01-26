import 'package:open_academic_app/screens/home/model.dart';
import 'package:flutter/material.dart';

class FinancePanel extends StatelessWidget {
  final FinanceData financeData;
  const FinancePanel({Key? key, required this.financeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Center(
            child: Text(financeData.by,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
