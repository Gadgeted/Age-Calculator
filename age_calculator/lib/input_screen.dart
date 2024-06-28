import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _calculateAge() {
    if (_selectedDate == null) {
      return;
    }
    final currentDate = DateTime.now();
    int years = currentDate.year - _selectedDate!.year;
    int months = currentDate.month - _selectedDate!.month;
    int days = currentDate.day - _selectedDate!.day;

    if (days < 0) {
      months -= 1;
      days += DateTime(currentDate.year, currentDate.month, 0).day;
    }

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultScreen(years: years, months: months, days: days),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Enter your DOB',
                hintText: _selectedDate == null
                    ? 'yyyy-MM-dd'
                    : _dateFormat.format(_selectedDate!),
              ),
              onTap: _presentDatePicker,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAge,
              child: const Text('Scrible Your Age =>'),
            ),
          ],
        ),
      ),
    );
  }
}
