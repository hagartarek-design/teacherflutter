import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class calender1 extends StatefulWidget {
  const calender1({super.key});

  @override
  State<calender1> createState() => _calender1State();
}
  final ValueNotifier<DateTime> selectedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
class _calender1State extends State<calender1> {
  @override
  Widget build(BuildContext context) {
    HomeController controller=HomeController();
    return             Container(
                      width: 416, // Fixed width
                      height: MediaQuery.of(context).size.height *
                          0.9, // Responsive height (70% of screen height)
                      margin: EdgeInsets.only(
                        top: 60,
                        left: 64,
                        bottom: 40,
                        right: 40,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.only(
                        top: 16,
                        right: 40,
                        bottom: 40,
                        left: 40,
                      ),
                      child: Column(
                        children: [
                          // Calendar
                        Container( 
  width: 336.0, // Fixed width
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

          // Format the selected date and call the API
          final selectedDateString = controller. formatDate(newSelectedDay)??'';

       controller.   eventDate(selectedDateString);
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
                          SizedBox(height: 24),

                          // Rotated Line
                          Center(
                            child: Transform.rotate(
                              angle: 3.14159, // -180 degrees in radians
                              child: Container(
                                width: double
                                    .infinity, // Makes the line responsive
                                height: 1,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          SizedBox(height: 24),

                          // Upcoming lectures text
                          Container(
                            width:
                                336.0, // Fixed width (you can adjust as needed)
                            height: 25,
                            child: Text(
                              'محاضرات قادمة',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.right,
                            ),
                          ),

                          // Upcoming lectures container
                          Container(
                            width: 336.0, // Fixed width (adjustable as needed)
                            height: MediaQuery.of(context).size.height *
                                0.19, // Responsive height (15% of screen height)
                            margin: const EdgeInsets.only(
                              top: 16,
                              right: 40,
                              bottom: 16,
                              left: 24,
                            ),
                            // decoration: BoxDecoration(
                            //   color: Color.fromARGB(197, 236, 238, 241),
                            //   borderRadius: BorderRadius.circular(16),
                            // ),
                            padding: const EdgeInsets.only(
                              top: 16,
                              right: 40,
                              bottom: 16,
                              left: 24,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 256.0,
                                  height: 32.0,
                                  alignment: Alignment.topRight,
                                  child: Text(
                                   "${controller. eventData.title??"there is no event"}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color.fromARGB(235, 6, 69, 152),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  width: 256.0,
                                  height: 20.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('${controller.eventData.description??""}'),
                                      Image.asset('icons/Frame1.png',
                                          width: 18, height: 18),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width: 145.0,
                                  height: 18.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('+126 مشترك'),
                                      Image.asset(
                                        'icons/Group5.png',
                                        width: 42.0,
                                        height: 18.0,
                                      ),
                                
      // if (!isMobile)
      //           Container(
      //             width: 280,
      //             height: double.infinity,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(24),
      //                 bottomLeft: Radius.circular(24),
      //               ),
      //               color: Color.fromARGB(240, 6, 69, 152),
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.black.withOpacity(0.2),
      //                   blurRadius: 10,
      //                   spreadRadius: 2,
      //                 ),
      //               ],
      //             ),
      //             child: rightbar(),
      //           ),

     
    //  ]))
    
     ])
     
     
                                
     )
     
     
     ]))
     ]));
   
  }
}