import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class calenderPick extends StatefulWidget {
  final ValueChanged<String> onDateSelected;
  final String initialDate;
  final bool isStartDate; // To distinguish between startdate and seedate
  
  const calenderPick({
    super.key,
    required this.onDateSelected,
    required this.initialDate,
    required this.isStartDate,
  });

  @override
  State<calenderPick> createState() => _CalenderPickState();
}

class _CalenderPickState extends State<calenderPick> {
  late ValueNotifier<DateTime> selectedDay;
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  final HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    // Parse the initial date if it exists, otherwise use default from backend
    selectedDay = ValueNotifier(
      widget.initialDate.isNotEmpty 
        ? DateTime.parse(widget.initialDate) 
        : widget.isStartDate 
          ? DateTime.parse('2025-01-05') 
          : DateTime.parse('2025-01-06')
    );
    focusedDay.value = selectedDay.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 453,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(255, 195, 202, 210),
          width: 1,
        ),
      ),
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                content: Container(
                  width: 416,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      ValueListenableBuilder<DateTime>(
                        valueListenable: focusedDay,
                        builder: (context, value, child) {
                          return TableCalendar(
                            locale: 'ar',
                            firstDay: DateTime(2000),
                            lastDay: DateTime(2100),
                            focusedDay: value,
                            calendarFormat: CalendarFormat.month,
                            onDaySelected: (newSelectedDay, newFocusedDay) {
                              selectedDay.value = newSelectedDay;
                              focusedDay.value = newFocusedDay;
                              final selectedDateString = "${newSelectedDay.year}-${newSelectedDay.month.toString().padLeft(2, '0')}-${newSelectedDay.day.toString().padLeft(2, '0')}";
                              widget.onDateSelected(selectedDateString);
                              Navigator.of(context).pop();
                            },
                            selectedDayPredicate: (day) => isSameDay(day, selectedDay.value),
                            headerStyle: const HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                              leftChevronIcon: Icon(Icons.chevron_left),
                              rightChevronIcon: Icon(Icons.chevron_right),
                            ),
                            calendarStyle: CalendarStyle(
                              selectedDecoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Text(
          widget.initialDate.isNotEmpty 
            ? widget.initialDate 
            : widget.isStartDate ? '2025-01-05' : '2025-01-06',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}