import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _selectedValue = 'Option 1'; // Initialize with the first option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropdownButton Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButton<String>(
            value: _selectedValue,
            items: <String>['Option 1', 'Option 2', 'Option 3'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue;
              });
              // Optional: Show a snackbar with the selected value
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: $newValue')),
              );
            },
            hint: const Text('Select an option'), // Shown when _selectedValue is null
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            isExpanded: false, // Set to true if you want the dropdown to expand to fill available width
          ),
        ),
      ),
    );
  }
}