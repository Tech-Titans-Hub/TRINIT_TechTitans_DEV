// sos_page.dart
import 'package:flutter/material.dart';

class SOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSOSDialog(context),
          child: Text('Trigger SOS'),
        ),
      ),
    );
  }

  void _showSOSDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emergency Alert'),
          content: Text('SOS signal sent! Help is on the way.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
