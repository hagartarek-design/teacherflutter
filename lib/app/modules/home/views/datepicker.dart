import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class calendarpicker extends StatefulWidget {
  const calendarpicker({super.key});

  @override
  State<calendarpicker> createState() => _calender1State();
}
  final ValueNotifier<DateTime> selectedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
class _calender1State extends State<calendarpicker> {
  @override
  Widget build(BuildContext context) {
    HomeController controller=HomeController();
       return AlertDialog(
        backgroundColor: Colors.white,
        content:              Container(
                      width: 416,height: 400, // Fixed width
                      // height: MediaQuery.of(context).size.height *
                      //     0.9, // Responsive height (70% of screen height)
                      // margin: EdgeInsets.only(
                      //   top: 60,
                      //   left: 64,
                      //   bottom: 40,
                      //   right: 40,
                      // ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // padding: const EdgeInsets.only(
                      //   top: 16,
                      //   right: 40,
                      //   bottom: 40,
                      //   left: 40,
                      // ),
                      child: Column(
                        children: [
                          // Calendar
                        Container( 
  // width: 336.0, // Fixed width
  // height: 360.0, // Fixed height for the calendar
  child: ValueListenableBuilder<DateTime>(
    valueListenable: focusedDay,
    builder: (context, value, child) {
      return TableCalendar(
        locale: 'ar',
        firstDay: DateTime(2000),
        lastDay: DateTime(2100),
        focusedDay: value,
        // startingDayOfWeek: StartingDayOfWeek.saturday,
        calendarFormat: CalendarFormat.month,
        onDaySelected: (newSelectedDay, newFocusedDay) {
          // Update selected and focused day
          selectedDay.value = newSelectedDay;
          focusedDay.value = newFocusedDay;

      //  controller.   dailytable();
          // Format the selected date and call the API
          final selectedDateString = controller. formatDate(newSelectedDay);

       controller.   dailytable(//context,
       coursetabledate:selectedDateString);


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
                      );})),
                    
                         

                        
                               
         
     
     
                                
    
     
     
     
     ])));
   
  }
}