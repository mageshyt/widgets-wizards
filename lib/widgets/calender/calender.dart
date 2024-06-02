import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CustomCalendar({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _controller.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
        widget.onDateSelected(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Pick a date',
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onChanged: (text) {
            try {
              final DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(text);
              _selectedDate = parsedDate;
              widget.onDateSelected(parsedDate);
            } catch (e) {
              print('Invalid date format: $e');
            }
          },
        ),
      ],
    );
  }
}
