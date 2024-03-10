// crowdfunding_page.dart
import 'package:flutter/material.dart';

class CrowdfundingPage extends StatefulWidget {
  @override
  _CrowdfundingPageState createState() => _CrowdfundingPageState();
}

class _CrowdfundingPageState extends State<CrowdfundingPage> {
  TextEditingController _amountController = TextEditingController();
  double _totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crowdfunding Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Amount Raised: \$$_totalAmount'),
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount (USD)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _contributeToCrowdfunding(),
              child: Text('Contribute'),
            ),
          ],
        ),
      ),
    );
  }

  void _contributeToCrowdfunding() {
    double contribution = double.tryParse(_amountController.text) ?? 0;
    setState(() {
      _totalAmount += contribution;
      _amountController.clear();
    });

    
  }
}
