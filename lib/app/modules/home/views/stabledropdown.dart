import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;
  final ValueNotifier<DateTime> selectedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  HomeController homeController=HomeController();
  final List<String> items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  Widget build(BuildContext context) {
    HomeController controller=HomeController();
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
child: TextButton(onPressed: (){
       showDialog(context: context, builder: (context){return AlertDialog(
        backgroundColor: Colors.white,
        content:              Container(
                      width: 416,height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    
                      child: Column(
                        children: [
                          // 
                        Container( 
  child: ValueListenableBuilder<DateTime>(
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
   
 

                                                   });
                                      
}, child: Text('')),

   );
  }
}