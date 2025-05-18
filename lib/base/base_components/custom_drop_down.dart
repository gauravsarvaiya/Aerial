import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  List<String> exam;
  String selectExam;
  final ValueChanged<String>? onChanged;
  CustomDropdown({super.key,
    required this.exam,
    required this.selectExam,
    this.onChanged,
  });
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Target Exam',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.selectExam,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              items: widget.exam.map((exam) {
                return DropdownMenuItem(
                  value: exam,
                  child: Text(
                    exam,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    widget.selectExam = value;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
