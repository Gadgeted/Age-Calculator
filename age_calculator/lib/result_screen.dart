import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int years;
  final int months;
  final int days;

  const ResultScreen({super.key, required this.years, required this.months, required this.days});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Age'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are $years years, $months months, and $days days old.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
