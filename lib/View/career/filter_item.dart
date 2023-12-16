import 'package:flutter/material.dart';

import '../../Models/career_model/filter_career.dart';

class FilterItem extends StatefulWidget {
  final FilterJobType jobType;
  final Function(String jobName) onChange;

  const FilterItem({
    super.key,
    required this.jobType,
    required this.onChange,
  });

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            // Perform actions when the button is pressed
            // Misalnya, toggle filter pada view model
            // filterJobTypesViewModel.toggleFilter(filter.name);
            // isButtonPressed = !isButtonPressed;
            // print(filter.name);
            setState(() {
              _isSelected = !_isSelected;
            });
            widget.onChange(widget.jobType.name);
          });
        },
        child: Text(
          widget.jobType.name,
          style: TextStyle(
            color: _isSelected ? Colors.white : Color(0xFFF4518D),
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: _isSelected ? Color(0xFFF4518D) : null,
          onPrimary: Colors.white, // Warna teks ketika tombol ditekan
        ),
      ),
    );
  }
}
