// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutterwallet/app/modules/home/views/borderright.dart';
// import 'package:flutterwallet/app/modules/home/views/sections.dart';
// import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
// import 'package:http/http.dart' as http;
// import 'dart:ui' as ui;

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:flutterwallet/app/modules/home/views/img.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:table_calendar/table_calendar.dart';
// import '../../../../Applinks.dart';
// import '../controllers/home_controller.dart';
// import '../modules/file.dart';
// import '../modules/students.dart';
// class Mainscreen extends StatelessWidget {
//    Mainscreen({super.key});


// int value=0; 
//   String selectedValue = "السنة الدراسية"; // Default text
//   String selectedValue3 = "اسم الكورس"; // Default text
// HomeController homeController =HomeController();
//   final List<String> dropdownItems = [
//     "السنة الدراسية",
//     "السنة الأولى",
//     "السنة الثانية",
//     "السنة الثالثة",
//   ];
//   final List<String> dropdownItems3 = [
//     "اسم الكورس",
//     "السنة الأولى",
//     "السنة الثانية",
//     "السنة الثالثة",
//   ];
//   final ValueNotifier<DateTime> selectedDay = ValueNotifier(DateTime.now());
//   final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
//   String? selectedValue2;
//   final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

//   @override
//   Widget build(BuildContext context) {
    
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     double containerWidth = screenWidth * 0.25; // Adjust to 25% of screen width
//     double containerHeight =
//         screenHeight * 0.15; // Adjust to 15% of screen height
//     double gap = screenWidth * 0.03;
//     // Responsive dimensions
    
//     double responsiveWidth = screenWidth * 0.7; // 70% of the screen width
//     double responsiveHeight = screenHeight * 0.15; // 15% of the screen height
//     double responsiveGap = screenHeight * 0.03;
//     return Scaffold(
//         body:GetBuilder( init:HomeController(), builder:(controller){ return  SingleChildScrollView(
//       child: Stack(
//         children: [
//           // Main Content
//           // Padding(
//           //   padding: const EdgeInsets.only(right: 280), // Reserve space for the sidebar
//           //   child:
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               // Custom AppBar
//               Container(
//                 color: Colors.white,
//                 width: 14440,
//                 height: 96,
//                 padding: const EdgeInsets.fromLTRB(64, 24, 344, 24),
//               child:App_bar() ,
//               ),
//               // Main Content Area
//               // Expanded(
//               // Enable horizontal scrolling
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: 416, // Fixed width
//                       height: MediaQuery.of(context).size.height *
//                           0.9, // Responsive height (70% of screen height)
//                       margin: EdgeInsets.only(
//                         top: 60,
//                         left: 64,
//                         bottom: 40,
//                         right: 40,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       padding: const EdgeInsets.only(
//                         top: 16,
//                         right: 40,
//                         bottom: 40,
//                         left: 40,
//                       ),
//                       child: Column(
//                         children: [
//                           // Calendar
//                         Container( 
//   width: 336.0, // Fixed width
//   // height: 380.0, // Fixed height for the calendar
//   child: ValueListenableBuilder<DateTime>(
//     valueListenable: focusedDay,
//     builder: (context, value, child) {
//       return TableCalendar(
//         locale: 'ar',
//         firstDay: DateTime(2000),
//         lastDay: DateTime(2100),
//         focusedDay: value,
//         // startingDayOfWeek: StartingDayOfWeek.saturday,
//         calendarFormat: CalendarFormat.month,
//         onDaySelected: (newSelectedDay, newFocusedDay) {
//           // Update selected and focused day
//           selectedDay.value = newSelectedDay;
//           focusedDay.value = newFocusedDay;

//           // Format the selected date and call the API
//           final selectedDateString = controller. formatDate(newSelectedDay)??'';

//        controller.   eventDate(selectedDateString);
//         },
//         selectedDayPredicate: (day) => isSameDay(day, selectedDay.value),
//         headerStyle: const HeaderStyle(
//           formatButtonVisible: false,
//           titleCentered: true,
//           leftChevronIcon: Icon(Icons.chevron_left),
//           rightChevronIcon: Icon(Icons.chevron_right),
//         ),
//         calendarStyle: CalendarStyle(
//           selectedDecoration: BoxDecoration(
//             color: Colors.blue,
//             shape: BoxShape.circle,
//           ),
//         ),
//                       );})),
//                           SizedBox(height: 24),

//                           // Rotated Line
//                           Center(
//                             child: Transform.rotate(
//                               angle: 3.14159, // -180 degrees in radians
//                               child: Container(
//                                 width: double
//                                     .infinity, // Makes the line responsive
//                                 height: 1,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),

//                           SizedBox(height: 24),

//                           // Upcoming lectures text
//                           Container(
//                             width:
//                                 336.0, // Fixed width (you can adjust as needed)
//                             height: 25,
//                             child: Text(
//                               'محاضرات قادمة',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                               textAlign: TextAlign.right,
//                             ),
//                           ),

//                           // Upcoming lectures container
//                           Container(
//                             width: 336.0, // Fixed width (adjustable as needed)
//                             height: MediaQuery.of(context).size.height *
//                                 0.19, // Responsive height (15% of screen height)
//                             margin: const EdgeInsets.only(
//                               top: 16,
//                               right: 40,
//                               bottom: 16,
//                               left: 24,
//                             ),
//                             // decoration: BoxDecoration(
//                             //   color: Color.fromARGB(197, 236, 238, 241),
//                             //   borderRadius: BorderRadius.circular(16),
//                             // ),
//                             padding: const EdgeInsets.only(
//                               top: 16,
//                               right: 40,
//                               bottom: 16,
//                               left: 24,
//                             ),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: 256.0,
//                                   height: 32.0,
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                    "${controller. eventData.title??"there is no event"}",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: Color.fromARGB(235, 6, 69, 152),
//                                     ),
//                                     textAlign: TextAlign.right,
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 256.0,
//                                   height: 20.0,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Text('${controller.eventData.description??""}'),
//                                       Image.asset('icons/Frame1.png',
//                                           width: 18, height: 18),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 8),
//                                 Container(
//                                   width: 145.0,
//                                   height: 18.0,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Text('+126 مشترك'),
//                                       Image.asset(
//                                         'icons/Group5.png',
//                                         width: 42.0,
//                                         height: 18.0,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     //    Container(
//                     // width: MediaQuery.of(context).size.width * 0.5, // Responsive width (50% of screen width)
//                     // height: MediaQuery.of(context).size.height * 0.8, // Responsive height (80% of screen height)
//                     // margin: EdgeInsets.only(
//                     //   top: 120, // Same top margin as the first container
//                     //   left: 40,
//                     //   bottom: 40,
//                     //   right: 64,
//                     // ),// Responsive height (80% of screen height)
//                     // width: 592,height: 110,

//                     // decoration: BoxDecoration(
//                     //   color: Colors.grey[200],
//                     //   borderRadius: BorderRadius.circular(16),
//                     // ),
//                     // padding: const EdgeInsets.all(16),
//                     // child:
//                     Center(
//                       // child: Text(
//                       //   'New Responsive Container',
//                       //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       //   textAlign: TextAlign.center,
//                       // ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                               width:
//                                   592, // Responsive width (50% of screen width)
//                               height:
//                                   1166, // Responsive height (80% of screen height)
//                               margin: EdgeInsets.only(
//                                 top:
//                                     60, // Same top margin as the first container
//                                 left: 180,
//                                 bottom: 40,
//                                 right: 40,
//                               ),
//                               color: Colors.transparent,
//                               child: Column(children: [
//                                 Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       // Container(
//                                       //     width: 181.33,
//                                       //     height: 110,
//                                       //     alignment: Alignment.topRight,
//                                       //     decoration: BoxDecoration(
//                                       //       borderRadius: BorderRadius.all(
//                                       //         Radius.circular(16),
//                                       //       ),
//                                       //       color: Colors
//                                       //           .white, // Sidebar background color
//                                       //     ) // decoration: BoxDecoration(
//                                       //     //   borderRadius: BorderRadius.all( Radius.circular(16) ))
//                                       //     ,
//                                       //     padding: EdgeInsets.all(16)),
//                                       // SizedBox(
//                                       //   width: 24,
//                                       // ),
//                                       // Container(
//                                       //   width: 181.33,
//                                       //   height: 110,
//                                       //   decoration: BoxDecoration(
//                                       //     borderRadius: BorderRadius.all(
//                                       //       Radius.circular(16),
//                                       //     ),
//                                       //     color: Colors
//                                       //         .white, // Sidebar background color
//                                       //   ),
//                                       //   padding: EdgeInsets.all(16),
//                                       // ),
//                                       // SizedBox(
//                                       //   width: 24,
//                                       // ),
//                                       Container(
//                                           child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 Text(
//                                                   'شراء الملازم',
//                                                   textAlign: TextAlign.right,
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 18,
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                     width: 149.33,
//                                                     height: 30,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Container(
//                                                           width: 77,
//                                                           height: 17,
//                                                           child: Row(
//                                                             children: [
//                                                                Text(
//                                                                 '+6  جديد',
//                                                                 style: TextStyle(color: Colors.red,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w400,
//                                                                     fontSize:
//                                                                         14),
//                                                               ),Image.asset('icons/IconSet1.png',color: Colors.red,)
                                                            
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           '${ controller.courseDatas.students?.where((data)=>data['sheets_paym'].toString()=='true').length.toString()??''}',
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontSize: 24,
//                                                               color: Color
//                                                                   .fromARGB(
//                                                                       186,
//                                                                       6,
//                                                                       69,
//                                                                       152)),
//                                                         )
//                                                       ],
//                                                     ))
//                                               ]),
//                                           width: 181.33,
//                                           height: 110,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(16),
//                                             ),
//                                             color: Colors
//                                                 .white, // Sidebar background color
//                                           ),
//                                           padding: EdgeInsets.all(16)),
//                                       SizedBox(
//                                         width: 24,
//                                       ),
//                                       Container(
//                                           child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 Text(
//                                                   ' حضور المحاضرات',
//                                                   textAlign: TextAlign.right,
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 18,
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                     width: 149.33,
//                                                     height: 30,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Container(
//                                                           width: 77,
//                                                           height: 17,
//                                                           child: Row(
//                                                             children: [
//                                                               Text(
//                                                                 '+6  جديد',
//                                                                 style: TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w400,
//                                                                     fontSize:
//                                                                         14),
//                                                               ),Image.asset('icons/IconSet1.png')
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         Text(
                                                      
//                                                           '${ controller.courseDatas.students?.where((data)=>data['attendance'].toString()=='true').length.toString()??''}',
//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontSize: 24,
//                                                               color: Color
//                                                                   .fromARGB(
//                                                                       186,
//                                                                       6,
//                                                                       69,
//                                                                       152)),
//                                                         )
//                                                       ],
//                                                     ))
//                                               ]),
//                                           width: 181.33,
//                                           height: 110,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(16),
//                                             ),
//                                             color: Colors
//                                                 .white, // Sidebar background color
//                                           ),
//                                           padding: EdgeInsets.all(16)),
//                                       SizedBox(
//                                         width: 24,
//                                       ),
//                                       Container(
//                                           child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 Text(
//                                                   'عدد الطلاب',
//                                                   textAlign: TextAlign.right,
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 18,
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                     width: 149.33,
//                                                     height: 30,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Container(
//                                                           width: 77,
//                                                           height: 17,
//                                                           child: Row(
//                                                             children: [
//                                                               Text(
//                                                                 '+6  جديد',
//                                                                 style: TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w400,
//                                                                     fontSize:
//                                                                         14),
//                                                               ),Image.asset('icons/IconSet1.png')
//                                                             ],
//                                                           ),
//                                                         ),

                                                        
//                                                         Text(
//                                                           '${controller.students!.length +1}',
//                                                         // '${  controller.courseDatas.students?.map((data)=>data['id'].toString()).length.toString()??''}',

//                                                           style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontSize: 24,
//                                                               color: Color
//                                                                   .fromARGB(
//                                                                       186,
//                                                                       6,
//                                                                       69,
//                                                                       152)),
//                                                         )
//                                                       ],
//                                                     ))
//                                               ]),
//                                           width: 181.33,
//                                           height: 110,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(16),
//                                             ),
//                                             color: Colors
//                                                 .white, // Sidebar background color
//                                           ),
//                                           padding: EdgeInsets.all(16)),
//                                     ]),
//                                 SizedBox(
//                                   height: 22,
//                                 ),
//                                 Container(
//                                     width: 592.0,
//                                     height: 383.0,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(16),
//                                       ),
//                                       color: Colors
//                                           .white, // Sidebar background color
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           width: 544,
//                                           height: 62,
//                                           child: Row(
//                                             children: [
//                                               Column(
//                                                 children: [
//                                                   SizedBox(
//                                                     height: 5,
//                                                   ),
//                                                   Container(
//                                                     width:
//                                                         169, // Fixed width (169px)
//                                                     height:
//                                                         24, // Fixed height (24px)
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                       top:
//                                                           2, // Top padding (2px)
//                                                       right:
//                                                           16, // Right padding (16px)
//                                                       bottom:
//                                                           2, // Bottom padding (2px)
//                                                       left:
//                                                           16, // Left padding (16px)
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8.0), // Border radius (8px)
//                                                       border: Border.all(
//                                                         color: Colors
//                                                             .black, // Border color (1px blue)
//                                                         width: 1,
//                                                       ),
//                                                       // boxShadow: const [
//                                                       //   BoxShadow(
//                                                       //     color: Colors.grey,
//                                                       //     offset: Offset(0, 4),
//                                                       //     blurRadius: 6.0,
//                                                       //   ),
//                                                       // ],
//                                                     ),
//                                                     child:
//                                                         DropdownButtonFormField<
//                                                             String>(
//                                                       icon: SizedBox(),
//                                                       decoration:
//                                                           InputDecoration(
//                                                         icon: Icon(
//                                                             Icons
//                                                                 .arrow_drop_down,
//                                                             size: 18,
//                                                             color:
//                                                                 Colors.black),
//                                                         // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                                                         labelText:
//                                                             'المحاضره الاوله',
//                                                         labelStyle:
//                                                             const TextStyle(
//                                                                 color: Colors
//                                                                     .black),
//                                                         border: InputBorder
//                                                             .none, // Remove inner borders for better fit
//                                                       ),
//                                                       // value: controller.selectedtype,
//                                                       items: controller.type
//                                                           .map((String value) {
//                                                         return DropdownMenuItem<
//                                                                 String>(
//                                                             value: value,
//                                                             child: Text(value,
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontSize:
//                                                                       16, // Text size
//                                                                   color: Colors
//                                                                       .black, // Text color
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold, // Bold text
//                                                                 )));
//                                                       }).toList(),
//                                                       onChanged:
//                                                           (String? newValue) {
                                                            
//                                                         controller.selectedtype =
//                                                             newValue;
//                                                      controller.fetchcoursedata2(controller.selectedtype );
//                                         controller.update();
//                                                       },
//                                                       onTap: ()=>{
//                                                         controller.fetchcoursedata2(controller.selectedtype)
//                                                         ,controller.update()
//                                                       },
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     height: 8,
//                                                   ),
//                                                   Container(
//                                                     width:
//                                                         169, // Fixed width (169px)
//                                                     height:
//                                                         24, // Fixed height (24px)
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                       top:
//                                                           2, // Top padding (2px)
//                                                       right:
//                                                           16, // Right padding (16px)
//                                                       bottom:
//                                                           2, // Bottom padding (2px)
//                                                       left:
//                                                           16, // Left padding (16px)
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8.0), // Border radius (8px)
//                                                       border: Border.all(
//                                                         color: Colors
//                                                             .black, // Border color (1px blue)
//                                                         width: 1,
//                                                       ),
//                                                       // boxShadow: const [
//                                                       //   BoxShadow(
//                                                       //     color: Colors.grey,
//                                                       //     offset: Offset(0, 4),
//                                                       //     blurRadius: 6.0,
//                                                       //   ),
//                                                       // ],
//                                                     ),
//                                                     child:
//                                                         DropdownButtonFormField<
//                                                             String>(
//                                                       icon: SizedBox(),
//                                                       decoration:
//                                                           InputDecoration(
//                                                         icon: Icon(
//                                                             Icons
//                                                                 .arrow_drop_down,
//                                                             size: 20,
//                                                             color:
//                                                                 Colors.black),
//                                                         // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                                                         labelText:
//                                                             '15يناير 2024',
//                                                         labelStyle:
//                                                             const TextStyle(
//                                                                 color: Colors
//                                                                     .black),
//                                                         border: InputBorder
//                                                             .none, // Remove inner borders for better fit
//                                                       ),
//                                                       value: controller.selectedmonth_by_year,
//                                                       items: controller.month_by_year
//                                                           .map((String value) {
//                                                         return DropdownMenuItem<
//                                                                 String>(
//                                                             value: value,
//                                                             child: Text(value,
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontSize:
//                                                                       16, // Text size
//                                                                   color: Colors
//                                                                       .black, // Text color
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold, // Bold text
//                                                                 )));
//                                                       }).toList(),
//                                                       onChanged:
//                                                           (String? newValue) {
//                                                     controller.selectedmonth_by_year =
//                                                             newValue;
// controller.update();

//                                                             controller.fetchcoursedata3(controller.selectedmonth_by_year);
//                                                       },
//                                                         onTap: ()=>{
//                                                         controller.fetchcoursedata3(controller.selectedtype)
//                                                         ,controller.update()
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Column(
//                                                 children: [
//                                                   Container(
//                                                       width: 368,
//                                                       height: 48,
//                                                       child:

// // Container(child:
//                                                           Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .end,
//                                                               children: [
//                                                             Text(
//                                                               'حضور الكورسات',
//                                                               textAlign:
//                                                                   TextAlign
//                                                                       .right,
//                                                               style: TextStyle(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold,
//                                                                   fontSize: 20,
//                                                                   height: 1.5),
//                                                             ),
//                                                             Text(
//                                                               'تابع عدد حضور الطلاب للكورسات ',
//                                                               textAlign:
//                                                                   TextAlign
//                                                                       .right,
//                                                               style: TextStyle(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w400,
//                                                                   fontSize: 12,
//                                                                   height: 1.2),
//                                                             ),
//                                                             // width: 130 ,height: 25,
//                                                             // )
//                                                           ]))
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 22,
//                                         ),
//                                     Container (
//   width: 544,
//   height: 200,
//   child: BarChart(
//     BarChartData(
//       borderData: FlBorderData(show: false),
//       titlesData: FlTitlesData(
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: true, reservedSize: 48),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: (value, meta) {
//               const months = [
//                 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
//                 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
//               ];
//               return Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   months[value.toInt() % months.length],
//                   style: TextStyle(color: Colors.grey[600], fontSize: 12),
//                 ),
//               );
//             },
//             interval: 1,
//           ),
//         ),
//         rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//       ),
//       gridData: FlGridData(
//         show: true,
//         drawHorizontalLine: true,
//         drawVerticalLine: true,
//         horizontalInterval: 10,
//         verticalInterval: 10,
//         getDrawingHorizontalLine: (value) => FlLine(
//           color: Colors.grey[300]!,
//           strokeWidth: 1,
//         ),
//         getDrawingVerticalLine: (value) => FlLine(
//           color: Colors.grey[300]!,
//           strokeWidth: 1,
//         ),
//       ),
//       barGroups: controller.courses.course_attend?.asMap().entries.map((entry) {
//         int index = entry.key;
//         var data = entry.value;
//         return BarChartGroupData(
//           x: index,
//           barRods: [
//             BarChartRodData(
//               toY: data['seen_amount'],
//               color: Color.fromARGB(246, 6, 69, 152),
//               width: 4.77,
//               borderRadius: BorderRadius.circular(4),
//             ),
//             BarChartRodData(
//               toY: data['pay_amount'],
//               color: Color.fromARGB(255, 154, 175, 228),
//               width: 4.77,
//               borderRadius: BorderRadius.circular(4),
//             ),
//           ],
//         );
//       }).toList(),
//     ),
//   ),
// ),

//                                         SizedBox(height: 16),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: [
//                                             LegendItem(
//                                                     color: Color.fromARGB(
//                                                             246, 6, 69, 152),
//                                                 label: 'مشاهدة الكورس'),
//                                             SizedBox(width: 16),
//                                             LegendItem(
//                                                 color:  Color.fromARGB(
//                                                             255, 154, 175, 228),
//                                                 label: 'مبيعات الكورس'),
//                                           ],
//                                         ),
//                                       ],
//                                     )),
//                                 SizedBox(
//                                   height: 24,
//                                 ),
//                                 Container(
//                                   width: 592,
//                                   height: 422,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(16))),
//                                   child: Column(
//                                     children: [
//                                       // Title Section
//                                       Container(
//                                         width: 544,
//                                         height: 57,
//                                         child:Row(
                                          
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
                                          
//                                            Container(
//                                                     width:
//                                                         169, // Fixed width (169px)
//                                                     height:
//                                                         24, // Fixed height (24px)
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                       top:
//                                                           2, // Top padding (2px)
//                                                       right:
//                                                           16, // Right padding (16px)
//                                                       bottom:
//                                                           2, // Bottom padding (2px)
//                                                       left:
//                                                           16, // Left padding (16px)
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8.0), // Border radius (8px)
//                                                       border: Border.all(
//                                                         color: Colors
//                                                             .black, // Border color (1px blue)
//                                                         width: 1,
//                                                       ),
//                                                       // boxShadow: const [
//                                                       //   BoxShadow(
//                                                       //     color: Colors.grey,
//                                                       //     offset: Offset(0, 4),
//                                                       //     blurRadius: 6.0,
//                                                       //   ),
//                                                       // ],
//                                                     ),
//                                                     child:
//                                                         DropdownButtonFormField<
//                                                             String>(
//                                                       icon: SizedBox(),
//                                                       decoration:
//                                                           InputDecoration(
//                                                         icon: Icon(
//                                                             Icons
//                                                                 .arrow_drop_down,
//                                                             size: 18,
//                                                             color:
//                                                                 Colors.black),
//                                                         // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                                                         labelText:
//                                                             ' المحاضره الاوله',
//                                                         labelStyle:
//                                                             const TextStyle(
//                                                                 color: Colors
//                                                                     .black),
//                                                         border: InputBorder
//                                                             .none, // Remove inner borders for better fit
//                                                       ),
//                                                       value: controller.selectedtype2,
//                                                       items: controller.type
//                                                           .map((String value) {
//                                                         return DropdownMenuItem<
//                                                                 String>(
//                                                             value: value,
//                                                             child: Text(value,
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontSize:
//                                                                       16, // Text size
//                                                                   color: Colors
//                                                                       .black, // Text color
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold, // Bold text
//                                                                 )));
//                                                       }).toList(),
//                                                       onChanged:
//                                                           (String? newValue) {
                                                            
//                                                         controller.selectedtype2 =
//                                                             newValue;
//                                                      controller.fetchcoursedata4(controller.selectedtype2 );
//                                         controller.update();
//                                                       },
//                                                       onTap: ()=>{
//                                                         controller.fetchcoursedata4(controller.selectedtype2)
//                                                         ,controller.update()
//                                                       },
//                                                     ),
//                                                   ),
//                                            Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
                                              
//                                               Text(
//                                                 textAlign: TextAlign.start,
//                                                 'مشاهدات الكورسات',
//                                                 style: TextStyle(
//                                                     fontSize: 20,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               SizedBox(height: 4),
//                                               Text(
//                                                 'تابع عدد مشاهدات الطلاب للكورسات',
//                                                 style: TextStyle(
//                                                     fontSize: 16,
//                                                     color: Colors.grey),
//                                               ),
                                              
//                                             ]),
//                                     ])),
//                                       SizedBox(height: 16),
//                                       Container(
//                                         width: 545.91,
//                                         height: 261,
//                                         child: Column(
//                                           // Wrap the Expanded widget with a Column widget
//                                           children: [
//                                             Expanded(
//                                               child: LineChart(
//                                                 LineChartData(
//                                                   titlesData: FlTitlesData(
//                                                     leftTitles: AxisTitles(
//                                                       sideTitles: SideTitles(
//                                                         showTitles: true,
//                                                        getTitlesWidget: (value, meta) {
//   const days = [
//     'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'
//   ];

//   // Adjust the index calculation to start from Saturday
//   int index = (6 - value.toInt()) % 7; // This will start from Saturday and end on Sunday

//   // Ensure the index is valid and within the days array range
//   if (index >= 0 && index < days.length) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child:  Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: FittedBox(
//               fit: BoxFit.scaleDown,child: 
//           Text(
//             days[index], // Correctly map the Y-axis value to days from Sat to Sun
//             overflow: TextOverflow.ellipsis, // Prevent text overflow
//           ),
//       ))],
//       ),
//     );
//   }
//   return Container();
// }

//                                                       ),
//                                                     ),
//                                                     rightTitles: AxisTitles(
//                                                         sideTitles: SideTitles(
//                                                             showTitles: false)),
//                                                     topTitles: AxisTitles(
//                                                         sideTitles: SideTitles(
//                                                             showTitles: false)),
//                                                     bottomTitles: AxisTitles(
//                                                       sideTitles: SideTitles(
//                                                         showTitles: true,
//                                                         interval: 1,
//                                                         getTitlesWidget:
//                                                             (value, meta) {
//                                                           const months = [
//                                                             'Jan',
//                                                             'Feb',
//                                                             'Mar',
//                                                             'Apr',
//                                                             'May',
//                                                             'Jun',
//                                                             'Jul',
//                                                             'Aug',
//                                                             'Sep',
//                                                             'Oct',
//                                                             'Nov',
//                                                             'Dec'
//                                                           ];
//                                                           if (value >= 0 &&
//                                                               value <
//                                                                   months
//                                                                       .length) {
//                                                             return Padding(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                       .only(
//                                                                       top: 8.0),
//                                                               child: Text(
//                                                                   months[value
//                                                                       .toInt()]), // Show month names on X-axis
//                                                             );
//                                                           }
//                                                           return Container();
//                                                         },
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   gridData: FlGridData(
//                                                     show: true,
//                                                     drawVerticalLine: true,
//                                                     horizontalInterval: 20,
//                                                     verticalInterval: 1,
//                                                     getDrawingHorizontalLine:
//                                                         (value) => FlLine(
//                                                       color: Colors.grey
//                                                           .withOpacity(0.3),
//                                                       strokeWidth: 1,
//                                                     ),
//                                                     getDrawingVerticalLine:
//                                                         (value) => FlLine(
//                                                       color: Colors.grey
//                                                           .withOpacity(0.3),
//                                                       strokeWidth: 1,
//                                                     ),
//                                                   ),
//                                                   borderData: FlBorderData(
//                                                     show: true,
//                                                     border: Border.all(
//                                                         color: Colors.grey
//                                                             .withOpacity(0.3)),
//                                                   ),
//                                                   lineBarsData: [
//                                                     LineChartBarData(
//                                                       spots: [
//                                                         FlSpot(0, 10),
//                                                         FlSpot(1, 19),
//                                                         FlSpot(2, 44),
//                                                         FlSpot(3, 66),
//                                                         FlSpot(4, 67),
//                                                         FlSpot(5, 55),
//                                                         FlSpot(6, 55),
//                                                         FlSpot(7, 44),
//                                                         FlSpot(8, 18),
//                                                         FlSpot(9, 44),
//                                                         FlSpot(10, 33),
//                                                         FlSpot(11, 22),
//                                                       ],
//                                                       isCurved: true,
//                                                       color: Color.fromARGB(
//                                                           246, 6, 69, 152),
//                                                       barWidth: 3,
//                                                       belowBarData: BarAreaData(
//                                                         show: true,
//                                                         color: const Color
//                                                                 .fromARGB(255,
//                                                                 196, 194, 194)
//                                                             .withOpacity(0.2),
//                                                       ),
//                                                       dotData: FlDotData(
//                                                         show: false,
//                                                         checkToShowDot:
//                                                             (spot, barData) {
//                                                           return spot.x ==
//                                                               5; // Highlight June
//                                                         },
//                                                         getDotPainter: (spot,
//                                                                 percent,
//                                                                 barData,
//                                                                 index) =>
//                                                             FlDotCirclePainter(
//                                                           radius: 6,
//                                                           color: Colors.blue,
//                                                           strokeWidth: 2,
//                                                           strokeColor:
//                                                               Colors.white,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     LineChartBarData(
//                                                       spots: [
//                                                         FlSpot(0, 10),
//                                                         FlSpot(1, 20),
//                                                         FlSpot(2, 50),
//                                                         FlSpot(3, 30),
//                                                         FlSpot(4, 80),
//                                                         FlSpot(5, 70),
//                                                         FlSpot(6, 50),
//                                                         FlSpot(7, 60),
//                                                         FlSpot(8, 40),
//                                                         FlSpot(9, 90),
//                                                         FlSpot(10, 70),
//                                                         FlSpot(11, 50),
//                                                       ],
//                                                       isCurved: true,
//                                                       color: Color.fromARGB(
//                                                           197, 181, 181, 181),
//                                                       barWidth: 3,
//                                                       belowBarData: BarAreaData(
//                                                         show: false,
//                                                         // color: const Color.fromARGB(255, 196, 194, 194).withOpacity(0.2),
//                                                       ),
//                                                       dotData: FlDotData(
//                                                         show: false,
//                                                         checkToShowDot:
//                                                             (spot, barData) {
//                                                           return spot.x ==
//                                                               5; // Highlight June
//                                                         },
//                                                         getDotPainter: (spot,
//                                                                 percent,
//                                                                 barData,
//                                                                 index) =>
//                                                             FlDotCirclePainter(
//                                                           radius: 6,
//                                                           color: Colors.blue,
//                                                           strokeWidth: 2,
//                                                           strokeColor:
//                                                               Colors.white,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ), // Legend
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(top: 16.0),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: [
//                                             Row(
//                                               children: [

                                              
//                                                 Text('مشاهدة الكورس'),
//                                                   SizedBox(width: 8),
//                                                 Container(
//                                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
//                                                     color: Color.fromARGB(
//                                                             246, 6, 69, 152),
//                                                   ),
//                                                   width: 12,
//                                                   height: 12,
                                               
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(width: 16),
//                                             Row(mainAxisAlignment: MainAxisAlignment.end,
//                                               children: [
                                              
                                               
//                                                 Text('مبيعات الكورس'),
//                                                  SizedBox(width: 8),
//                                                   Container(
//                                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15,),
//                                                     color: Colors.grey
//                                                       .withOpacity(0.5),
//                                                   ),
//                                                   width: 12,
//                                                   height: 12,
                                                
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ]))
//                         ],
//                       ),
//                     ),
//                   ]),
//             ],
//           ) // ),
//           ,

//           // Sidebar
//           Positioned(
//             top: 0, // Align at the top
//             right: 0, // Align to the right
//             child: Container(
//               width: 280, // Fixed width
//               height: 1445, // Fixed height
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     bottomLeft: Radius.circular(24)),
//                 color:
//                     Color.fromARGB(240, 6, 69, 152), // Sidebar background color
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: rightbar(),
//             ),
//           ),
//         ],
//       ),
//     );}));
//   }
// }

// class LegendItem extends StatelessWidget {
//   final Color color;
//   final String label;

//   const LegendItem({required this.color, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
      
       
//         Text(label, style: TextStyle(fontSize: 14)),
//          SizedBox(width: 8),
//            Container(
//             decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: color, ),
//           width: 12,
//           height: 12,
          
//         ),
//       ],
//     );
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/sections.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutterwallet/app/modules/home/views/img.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../Applinks.dart';
import '../controllers/home_controller.dart';
import '../modules/file.dart';
import '../modules/students.dart';
class Mainscreen extends StatelessWidget {
   Mainscreen({super.key});


int value=0; 
  String selectedValue = "السنة الدراسية"; // Default text
  String selectedValue3 = "اسم الكورس"; // Default text
HomeController homeController =HomeController();
  final List<String> dropdownItems = [
    "السنة الدراسية",
    "السنة الأولى",
    "السنة الثانية",
    "السنة الثالثة",
  ];
  final List<String> dropdownItems3 = [
    "اسم الكورس",
    "السنة الأولى",
    "السنة الثانية",
    "السنة الثالثة",
  ];

  final ValueNotifier<DateTime> selectedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  String? selectedValue2;
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    HomeController controller=HomeController();
     controller.isDashboardOpen.value = false;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth * 0.25; // Adjust to 25% of screen width
    double containerHeight =
        screenHeight * 0.15; // Adjust to 15% of screen height
    double gap = screenWidth * 0.03;
    // Responsive dimensions
    
    double responsiveWidth = screenWidth * 0.7; // 70% of the screen width
    double responsiveHeight = screenHeight * 0.15; // 15% of the screen height
    double responsiveGap = screenHeight * 0.03;
    return Scaffold(
        body:GetBuilder( init:HomeController(), builder:(controller){ 
        int count=0;   int getCompletedCount(dynamic lesson) {
   count = lesson['completedVideosCount'] ?? 0;

  if (count != 0) {
    return count + 1;
  }
  return count;
}

           final uniqueTypes = controller.type.toSet().toList();

  // Fix selected value
  final safeValue = uniqueTypes.contains(controller.selectedtype)
      ? controller.selectedtype
      : null;
          return  SingleChildScrollView(
      child: Stack(
        children: [
          // Main Content
          // Padding(
          //   padding: const EdgeInsets.only(right: 280), // Reserve space for the sidebar
          //   child:
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Custom AppBar
              Container(
                color: Colors.white,
                width: 14440,
                height: 96,
                padding: const EdgeInsets.fromLTRB(64, 24, 344, 24),
              child:App_bar() ,
              ),
              // Main Content Area
              // Expanded(
              // Enable horizontal scrolling
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
  // height: 380.0, // Fixed height for the calendar
  child: ValueListenableBuilder<DateTime>(
    valueListenable: focusedDay,
    builder: (context, value, child) {
      return TableCalendar(
        // locale: 'ar',
          locale: 'ar',
  firstDay: DateTime.utc(2020, 1, 1),
  lastDay: DateTime.utc(2030, 12, 31),
  focusedDay: DateTime.now(),
        // firstDay: DateTime(2000),
        // lastDay: DateTime(2100),
        // focusedDay: value,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //    Container(
                    // width: MediaQuery.of(context).size.width * 0.5, // Responsive width (50% of screen width)
                    // height: MediaQuery.of(context).size.height * 0.8, // Responsive height (80% of screen height)
                    // margin: EdgeInsets.only(
                    //   top: 120, // Same top margin as the first container
                    //   left: 40,
                    //   bottom: 40,
                    //   right: 64,
                    // ),// Responsive height (80% of screen height)
                    // width: 592,height: 110,

                    // decoration: BoxDecoration(
                    //   color: Colors.grey[200],
                    //   borderRadius: BorderRadius.circular(16),
                    // ),
                    // padding: const EdgeInsets.all(16),
                    // child:
                    Center(
                      // child: Text(
                      //   'New Responsive Container',
                      //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      //   textAlign: TextAlign.center,
                      // ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width:
                                  592, // Responsive width (50% of screen width)
                              height:
                                  1166, // Responsive height (80% of screen height)
                              margin: EdgeInsets.only(
                                top:
                                    60, // Same top margin as the first container
                                left: 180,
                                bottom: 40,
                                right: 40,
                              ),
                              color: Colors.transparent,
                              child: Column(children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Container(
                                      //     width: 181.33,
                                      //     height: 110,
                                      //     alignment: Alignment.topRight,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.all(
                                      //         Radius.circular(16),
                                      //       ),
                                      //       color: Colors
                                      //           .white, // Sidebar background color
                                      //     ) // decoration: BoxDecoration(
                                      //     //   borderRadius: BorderRadius.all( Radius.circular(16) ))
                                      //     ,
                                      //     padding: EdgeInsets.all(16)),
                                      // SizedBox(
                                      //   width: 24,
                                      // ),
                                      // Container(
                                      //   width: 181.33,
                                      //   height: 110,
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.all(
                                      //       Radius.circular(16),
                                      //     ),
                                      //     color: Colors
                                      //         .white, // Sidebar background color
                                      //   ),
                                      //   padding: EdgeInsets.all(16),
                                      // ),
                                      // SizedBox(
                                      //   width: 24,
                                      // ),
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'شراء الملازم',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Container(
                                                    width: 149.33,
                                                    height: 30,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 77,
                                                          height: 17,
                                                          child: Row(
                                                            children: [
                                                               Text(
                                                                '+6  جديد',
                                                                style: TextStyle(color: Colors.red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14),
                                                              ),Image.asset('icons/IconSet1.png',color: Colors.red,)
                                                            
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                       '${controller.courseDatas.student_id?['attachments']?.length ?? ""}'
,
                                                          // '${ controller.courseDatas.students?.where((data)=>data['sheets_paym'].toString()=='true').length.toString()??''}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 24,
                                                              color: Color
                                                                  .fromARGB(
                                                                      186,
                                                                      6,
                                                                      69,
                                                                      152)),
                                                        )
                                                      ],
                                                    ))
                                              ]),
                                          width: 181.33,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            color: Colors
                                                .white, // Sidebar background color
                                          ),
                                          padding: EdgeInsets.all(16)),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  ' حضور المحاضرات',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Container(
                                                    width: 149.33,
                                                    height: 30,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 77,
                                                          height: 17,
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                '+6  جديد',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14),
                                                              ),Image.asset('icons/IconSet1.png')
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                      
                                     '${ count}',


                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 24,
                                                              color: Color
                                                                  .fromARGB(
                                                                      186,
                                                                      6,
                                                                      69,
                                                                      152)),
                                                        )
                                                      ],
                                                    ))
                                              ]),
                                          width: 181.33,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            color: Colors
                                                .white, // Sidebar background color
                                          ),
                                          padding: EdgeInsets.all(16)),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'عدد الطلاب',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Container(
                                                    width: 149.33,
                                                    height: 30,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 77,
                                                          height: 17,
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                '+6  جديد',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14),
                                                              ),Image.asset('icons/IconSet1.png')
                                                            ],
                                                          ),
                                                        ),

                                                        
                                                        Text(
                                                          '${(controller.courseDatas!.students?.length??0 )??1}',
                                                        // '${  controller.courseDatas.students?.map((data)=>data['id'].toString()).length.toString()??''}',

                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 24,
                                                              color: Color
                                                                  .fromARGB(
                                                                      186,
                                                                      6,
                                                                      69,
                                                                      152)),
                                                        )
                                                      ],
                                                    ))
                                              ]),
                                          width: 181.33,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            color: Colors
                                                .white, // Sidebar background color
                                          ),
                                          padding: EdgeInsets.all(16)),
                                    ]),
                                SizedBox(
                                  height: 22,
                                ),
                                Container(
                                    width: 592.0,
                                    height: 383.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      color: Colors 
                                          .white, // Sidebar background color
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 544,
                                          height: 62,
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width:
                                                        169, // Fixed width (169px)
                                                    height:
                                                        24, // Fixed height (24px)
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top:
                                                          2, // Top padding (2px)
                                                      right:
                                                          16, // Right padding (16px)
                                                      bottom:
                                                          2, // Bottom padding (2px)
                                                      left:
                                                          16, // Left padding (16px)
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), // Border radius (8px)
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, // Border color (1px blue)
                                                        width: 1,
                                                      ),
                                                      // boxShadow: const [
                                                      //   BoxShadow(
                                                      //     color: Colors.grey,
                                                      //     offset: Offset(0, 4),
                                                      //     blurRadius: 6.0,
                                                      //   ),
                                                      // ],
                                                    ),
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      icon: SizedBox(),
                                                      decoration:
                                                          InputDecoration(
                                                        icon: Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            size: 18,
                                                            color:
                                                                Colors.black),
                                                        // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                        labelText:
                                                            'المحاضره الاوله',
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        border: InputBorder
                                                            .none, // Remove inner borders for better fit
                                                      ),
                                                   value:
                                           controller.section.contains(controller.selectedtype)
                                           ? controller.selectedtype
                                           : null,                                          
                                           items: controller.section
                                           .map((String value) {
                                           return DropdownMenuItem<String>(
                                                            value: value ??"",
                                                            child: Text(value??"",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16, // Text size
                                                                  color: Colors
                                                                      .black, // Text color
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold, // Bold text
                                                                )));
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                            
                                                        controller.selectedtype =
                                                            newValue ??"";
                                                     controller.
                                                     fetchcoursedata2
                                                     (controller.selectedtype );
                                        controller.update();
                                                      },
                                                      onTap: ()=>{
                                                        controller.fetchcoursedata2(controller.selectedtype)
                                                        ,controller.update()
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Container(
                                                    width:
                                                        169, // Fixed width (169px)
                                                    height:
                                                        24, // Fixed height (24px)
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top:
                                                          2, // Top padding (2px)
                                                      right:
                                                          16, // Right padding (16px)
                                                      bottom:
                                                          2, // Bottom padding (2px)
                                                      left:
                                                          16, // Left padding (16px)
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), // Border radius (8px)
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, // Border color (1px blue)
                                                        width: 1,
                                                      ),
                                                      // boxShadow: const [
                                                      //   BoxShadow(
                                                      //     color: Colors.grey,
                                                      //     offset: Offset(0, 4),
                                                      //     blurRadius: 6.0,
                                                      //   ),
                                                      // ],
                                                    ),
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      icon: SizedBox(),
                                                      decoration:
                                                          InputDecoration(
                                                        icon: Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            size: 20,
                                                            color:
                                                                Colors.black),
                                                        // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                        labelText:
                                                            '15يناير 2024',
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        border: InputBorder
                                                            .none, // Remove inner borders for better fit
                                                      ),
                                                      value: controller.selectedmonth_by_year?.isNotEmpty==true?controller.selectedmonth_by_year:null
                                                      
                                                      ,
                                                      items: controller.month_by_year 
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                                String>(
                                                            value: value??"",
                                                            child: Text(value??"",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16, // Text size
                                                                  color: Colors
                                                                      .black, // Text color
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold, // Bold text
                                                                )));
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue)async {
                                                    controller.selectedmonth_by_year =
                                                            newValue??"";
                                                    controller.update();

                                                        await    controller.fetchcoursedata3(controller.selectedmonth_by_year);
                                                      },
                                                        onTap: ()=>{
                                                        controller.fetchcoursedata3(controller.selectedtype)
                                                        ,controller.update()
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                      width: 368,
                                                      height: 48,
                                                      child:

// Container(child:
                                                          Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                            Text(
                                                              'حضور الكورسات',
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20,
                                                                  height: 1.5),
                                                            ),
                                                            Text(
                                                              'تابع عدد حضور الطلاب للكورسات ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                  height: 1.2),
                                                            ),
                                                            // width: 130 ,height: 25,
                                                            // )
                                                          ]))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 22,
                                        ),
                                    Container (
  width: 544,
  height: 200,
  child: BarChart(
    BarChartData(
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 48),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              const months = [
                'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
              ];
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  months[value.toInt() % months.length],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              );
            },
            interval: 1,
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
        horizontalInterval: 10,
        verticalInterval: 10,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.grey[300]!,
          strokeWidth: 1,
        ),
        getDrawingVerticalLine: (value) => FlLine(
          color: Colors.grey[300]!,
          strokeWidth: 1,
        ),
      ),
   barGroups: List.generate(
  controller.courses.usedPercentagesList?.length??0,  
  (index) {
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: controller.courses.usedPercentagesList?[index].toDouble()??1,
            color: Color.fromARGB(255, 154, 175, 228),   
              width: 4.77,
              borderRadius: BorderRadius.circular(4),
            ),
            BarChartRodData(
              toY: controller.courses.viewedPercentagesList?[index].toDouble()??1,
               color: Color.fromARGB(246, 6, 69, 152),
              width: 4.77,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        );
      }).toList(),
    ),
  ),
),

                                        SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            LegendItem(
                                                    color: Color.fromARGB(
                                                            246, 6, 69, 152),
                                                label: 'مشاهدة الكورس'),
                                            SizedBox(width: 16),
                                            LegendItem(
                                                color:  Color.fromARGB(
                                                            255, 154, 175, 228),
                                                label: 'مبيعات الكورس'),
                                          ],
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  width: 592,
                                  height: 422,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  child: Column(
                                    children: [
                                      // Title Section
                                      Container(
                                        width: 544,
                                        height: 57,
                                        child:Row(
                                          
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          
                                      Container(
  width: 169,
  height: 24,
  padding: const EdgeInsets.only(
    top: 2,
    right: 16,
    bottom: 2,
    left: 16,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    border: Border.all(
      color: Colors.black,
      width: 1,
    ),
  ),
  child: DropdownButtonFormField<String>(
    icon: SizedBox(),
    decoration: InputDecoration(
      icon: Icon(
        Icons.arrow_drop_down,
        size: 18,
        color: Colors.black,
      ),
      labelText: ' المحاضره الاوله',
      labelStyle: const TextStyle(color: Colors.black),
      border: InputBorder.none,
    ),
    // Fix: Use controller.section instead of controller.type
    // and properly handle the value
    value: controller.section.contains(controller.selectedtype2)
        ? controller.selectedtype2
        : null,
    items: controller.section
        .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        })
        .toList(),
    onChanged: (String? newValue) {
      controller.selectedtype2 = newValue ?? "";
      controller.fetchcoursedata4(controller.selectedtype2);
      controller.update();
    },
    onTap: () {
      controller.fetchcoursedata4(controller.selectedtype2);
      controller.update();
    },
  ),
),     Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              
                                              Text(
                                                textAlign: TextAlign.start,
                                                'مشاهدات الكورسات',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                'تابع عدد مشاهدات الطلاب للكورسات',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              
                                            ]),
                                    ])),
                                      SizedBox(height: 16),
                                      Container(
                                        width: 545.91,
                                        height: 261,
                                        child: Column(
                                          // Wrap the Expanded widget with a Column widget
                                          children: [
                                            Expanded(
                                              child: LineChart(
                                                LineChartData(
                                                  titlesData: FlTitlesData(
                                                    leftTitles: AxisTitles(
                                                      sideTitles: SideTitles(
                                                        showTitles: true,
                                                   
                    getTitlesWidget: (value, meta) {
  const days = [
    'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'
  ];

  // Adjust the index calculation to start from Saturday
  int index = (6 - value.toInt()) % 7; // This will start from Saturday and end on Sunday

  // Ensure the index is valid and within the days array range
  if (index >= 0 && index < days.length) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,child: 
          Text(
            days[index], // Correctly map the Y-axis value to days from Sat to Sun
            overflow: TextOverflow.ellipsis, // Prevent text overflow
          ),
      ))],
      ),
    );
  }
  return Container();
}

                                                      ),
                                                    ),
                                                    rightTitles: AxisTitles(
                                                        sideTitles: SideTitles(
                                                            showTitles: false)),
                                                    topTitles: AxisTitles(
                                                        sideTitles: SideTitles(
                                                            showTitles: false)),
                                                    bottomTitles: AxisTitles(
                                                      sideTitles: SideTitles(
                                                        showTitles: true,
                                                        interval: 1,
                                                        getTitlesWidget:
                                                            (value, meta) {
                                                          const months = [
                                                            'Jan',
                                                            'Feb',
                                                            'Mar',
                                                            'Apr',
                                                            'May',
                                                            'Jun',
                                                            'Jul',
                                                            'Aug',
                                                            'Sep',
                                                            'Oct',
                                                            'Nov',
                                                            'Dec'
                                                          ];
                                                          if (value >= 0 &&
                                                              value <
                                                                  months
                                                                      .length) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 8.0),
                                                              child: Text(
                                                                  months[value
                                                                      .toInt()]), // Show month names on X-axis
                                                            );
                                                          }
                                                          return Container();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  gridData: FlGridData(
                                                    show: true,
                                                    drawVerticalLine: true,
                                                    horizontalInterval: 20,
                                                    verticalInterval: 1,
                                                    getDrawingHorizontalLine:
                                                        (value) => FlLine(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      strokeWidth: 1,
                                                    ),
                                                    getDrawingVerticalLine:
                                                        (value) => FlLine(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      strokeWidth: 1,
                                                    ),
                                                  ),
                                                  borderData: FlBorderData(
                                                    show: true,
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.3)),
                                                  ),
                                          lineBarsData: [
  // First line: Viewed percentages (blue line)
  LineChartBarData(
    spots: List.generate(
      controller.courses.viewedPercentagesList?.length ?? 12,
      (index) => FlSpot(
        index.toDouble(),
        controller.courses.viewedPercentagesList?[index]?.toDouble() ?? 0.0,
      ),
    ).toList(),
    isCurved: true,
    color: Color.fromARGB(246, 6, 69, 152),
    barWidth: 3,
    belowBarData: BarAreaData(
      show: true,
      color: const Color.fromARGB(255, 196, 194, 194).withOpacity(0.2),
    ),
    dotData: FlDotData(
      show: false,
    ),
  ),
  // Second line: Used percentages (grey line)
  LineChartBarData(
    spots: List.generate(
      controller.courses.usedPercentagesList?.length ?? 12,
      (index) => FlSpot(
        index.toDouble(),
        controller.courses.usedPercentagesList?[index]?.toDouble() ?? 0.0,
      ),
    ).toList(),
    isCurved: true,
    color: Color.fromARGB(197, 181, 181, 181),
    barWidth: 3,
    belowBarData: BarAreaData(
      show: false,
    ),
    dotData: FlDotData(
      show: false,
    ),
  ),
],   ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ), // Legend
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [

                                              
                                                Text('مشاهدة الكورس'),
                                                  SizedBox(width: 8),
                                                Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                                    color: Color.fromARGB(
                                                            246, 6, 69, 152),
                                                  ),
                                                  width: 12,
                                                  height: 12,
                                               
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 16),
                                            Row(mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                              
                                               
                                                Text('مبيعات الكورس'),
                                                 SizedBox(width: 8),
                                                  Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15,),
                                                    color: Colors.grey
                                                      .withOpacity(0.5),
                                                  ),
                                                  width: 12,
                                                  height: 12,
                                                
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]))
                        ],
                      ),
                    ),
                  ]),
            ],
          ) // ),
          ,

          // Sidebar
          Positioned(
            top: 0, // Align at the top
            right: 0, // Align to the right
            child: Container(
              width: 280, // Fixed width
              height: 1445, // Fixed height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24)),
                color:
                    Color.fromARGB(240, 6, 69, 152), // Sidebar background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: rightbar(),
            ),
          ),
        ],
      ),
    );}));
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      
       
        Text(label, style: TextStyle(fontSize: 14)),
         SizedBox(width: 8),
           Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: color, ),
          width: 12,
          height: 12,
          
        ),
      ],
    );
  }
}
