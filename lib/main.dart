import 'package:flutter/material.dart';
import 'package:widgets_wigets/widgets/alertdialog/alertdialog.dart';
import 'package:widgets_wigets/widgets/calender/calender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Calendar Example')),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomCalendar(
              onDateSelected: (selectedDate) {
                print(
                    'Selected date: $selectedDate'); // Handle the selected date
              },
            ),
          ),
        ),
      ),
    );
  }
}
