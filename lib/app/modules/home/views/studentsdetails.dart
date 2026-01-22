import 'dart:typed_data';
import 'dart:io';
import 'package:excel/excel.dart' as excel_lib;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html; 

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/Applinks.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/dropdown.dart';
import 'package:flutterwallet/app/modules/home/views/mypage.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class Studentsdetails extends StatelessWidget {
  String name; final studentId;
   Studentsdetails({super.key,required this. name,required this.studentId});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
// class Studentsdetails extends StatefulWidget {
//   final name ;
//   const Studentsdetails({super.key,required this. name});

//   @override
//   State<Studentsdetails> createState() => _StudentsdetailsState();
// }

// class _StudentsdetailsState extends State<Studentsdetails> {
  double absentPercentage=0.0;
double presentPercentage=0.0;
  final HomeController controller = HomeController();
                                                                  double absentCount = 0.0;
  String dropdownValue = 'Option 1';
  List<String> items = ['Option 1', 'Option 2', 'Option 3'];
List<String>attendence=[ 'حضر' , 'غائب' ];
String dropdownattendence='حضر';
  Uint8List? image;

double presentCount = 0.0;
double totalAttendance = 0;
 
// void _selectFile() async {

// final FilePickerResult? result = await FilePicker.platform.pickFiles();

// if (result != null) {

// // setState(() {
// selectedFile = result.files.first.name;
// print(selectedFile);
// controller.addfile(result.toString());
// // });
// }}
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
 double screenWidth = MediaQuery.of(context).size.width;
  
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[900]),
              child: Center(
                child: Text(
                  'المنصة التعليمية',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Row(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    color: Colors.white,
                    height: 96,
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Mypage(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02, vertical: 10),
                    child: Column(
                      children: [
                        Container(),
                        //
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      height: 360,

                      // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 10),

                      width: 1032,
                      constraints: BoxConstraints(maxWidth: 1032),
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 10),
                        // color: Colors.white,
                        width: screenWidth * 0.9,
                        constraints: BoxConstraints(maxWidth: 938),
                        child: Row(
                          spacing: 24,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 644,
                              height: 428,
                              padding: EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 102, 28, 23),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      width: 0.8,
                                      color:
                                          Color.fromARGB(255, 228, 231, 236))),
                              child: Column(
                                spacing: 16,
                                children: [
                                  Container(
                                    width: 596,
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      spacing: 16,
                                      children: [
                                        Container(
                                          width: 82,
                                          height: 28, 
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 4, 0, 4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                8.0), 
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255,
                                                  181,
                                                  181,
                                                  181),
                                              width: 1,
                                            ),
                                          ),
                                          child:
                                              DropdownButtonFormField<String>(
                                          
                                            decoration: InputDecoration(
                                              icon: SizedBox(
                                                  child: Image.asset(
                                                      'icons/arrow-down2.png',
                                                      width: 15,
                                                      height: 20,
                                                      color: Colors.black)),
                                              labelText: 'الكل',
                                              labelStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 6, 69, 152)),
                                              border: InputBorder
                                                  .none, 
                                            ),
                                            value: controller 
                                                .selectedmonth_by_year,
                                            items: controller.month_by_year
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value,
                                                      style: TextStyle(
                                                        fontSize:
                                                            10,
                                                        color: Colors
                                                            .black, 
                                                        fontWeight: FontWeight
                                                            .bold, 
                                                      )));
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              controller.selectedmonth_by_year =
                                                  newValue??"";
                                              controller.update();

                                              controller.fetchcoursedata3(
                                                  controller
                                                      .selectedmonth_by_year);
                                            },
                                            onTap: () => {
                                              controller.fetchcoursedata3(
                                                  controller.selectedtype),
                                              controller.update()
                                            },
                                          ),
                                        ),
                                        Text(
                                          'حضور',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),

//  AttendanceChart()
// ,
                                  Container(
                                    width: 603,
                                    // height: 250,
                                    child: Row(
                                      // spacing: 24,
                                      children: [
                                        Container(
                                            width: 400,
                                            // height: 251,
                                            child: Column(
                                                spacing: 16,
                                                children: [
                                                  // Padding(
                                                  //             padding: EdgeInsets.all(15.0),
                                                  // child:
 ...List.generate(1?? 0,(index){
int absentCount = 0;
int presentCount = 0;

for (var i = 0; i < controller.student.exams!.length; i++) {
  if (controller.student.exams![i]['attendence'] == true) {
    presentCount++; 
  } else {
    absentCount++; 
  }
}

int totalAttendance = presentCount + absentCount; 

double presentPercentage = (presentCount / totalAttendance) * 100;
double absentPercentage = (absentCount / totalAttendance) * 100;
double presentFraction = presentCount / totalAttendance; 
double absentFraction = absentCount / totalAttendance;   

presentPercentage = double.parse(presentPercentage.toStringAsFixed(2));
absentPercentage = double.parse(absentPercentage.toStringAsFixed(2));

print('Total Present: $presentCount (${presentPercentage}%)');
print('Total Absent: $absentCount (${absentPercentage}%)');
print('Total Attendance Records: $totalAttendance');

LinearProgressIndicator(
  value: presentFraction, 
  backgroundColor: Colors.red,
  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
);

                                        return          Container(
                                                      width: 400,
                                                      height: 73,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child:
                                                          new LinearPercentIndicator(
                                                        isRTL: true,
                                                        animation: true,
                                                        lineHeight: 73.0,
                                                        barRadius:
                                                            Radius.circular(6),
                                                        // animationDuration: 2000,
                                                        percent: absentFraction ,

                        
                                                        center: Container(
                                                            width: 360,
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                      width: 79,
                                                                      height:
                                                                          29,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              4),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              8),
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              254,
                                                                              236,
                                                                              235)),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            'لم يحضر',
                                                                            style: TextStyle(
                                                                                color: Color.fromARGB(255, 222, 61, 49),
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 14),
                                                                          ),
                                                                          Image
                                                                              .asset(
                                                                            'assets/close-circle.png',
                                                                            width:
                                                                                16,
                                                                            height:
                                                                                16,
                                                                          )
                                                                        ],
                                                                      )),
                                                                  Container(
                                                                      child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                        Container(
                                                                          width:
                                                                              175,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            spacing:
                                                                                10,
                                                                            children: [
                                                                              Text(
                                                                                'اسم الدرس',
                                                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                                              ),
                                                                              Container(
                                                                                  width: 175,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 84,
                                                                                        child: Row(
                                                                                          spacing: 3,
                                                                                          children: [
                                                                                            Image.asset(
                                                                                              'assets/calendar.png',
                                                                                              width: 16,
                                                                                              height: 16,
                                                                                            ),
                                                                                            Text(
                                                                                              '28\12\2023',
                                                                                              style: TextStyle(fontSize: 12,
                                                                                               fontWeight: FontWeight.w500),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'اسم السكشن',
                                                                                        style: TextStyle(fontWeight: FontWeight.w500),
                                                                                      )
                                                                                    ],
                                                                                  ))
                                                                              // Container(child: ,)
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ]))
                                                                ])),
                                                        linearStrokeCap:
                                                            LinearStrokeCap
                                                                .roundAll,
                                                        progressColor:
                                                            Color.fromARGB(255,
                                                                222, 61, 49),
                                                        backgroundColor:
                                                            Colors.white
                                                        // ),
                                    ));}),
                                             ...List.generate(1?? 0,(index){
int absentCount = 0;
int presentCount = 0;

for (var i = 0; i < controller.student.exams!.length; i++) {
  if (controller.student.exams![i]['attendence'] == true) {
    presentCount++; 
  } else {
    absentCount++; 
  }
}

int totalAttendance = presentCount + absentCount; 

double presentPercentage = (presentCount / totalAttendance) * 100;
double absentPercentage = (absentCount / totalAttendance) * 100;

double presentFraction = presentCount / totalAttendance; 
double absentFraction = absentCount / totalAttendance;  

presentPercentage = double.parse(presentPercentage.toStringAsFixed(2));
absentPercentage = double.parse(absentPercentage.toStringAsFixed(2));

print('Total Present: $presentCount (${presentPercentage}%)');
print('Total Absent: $absentCount (${absentPercentage}%)');
print('Total Attendance Records: $totalAttendance');

LinearProgressIndicator(
  value: presentFraction, 
  backgroundColor: Colors.red,
  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
);

                                        return       Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      width: 400,
                                                      height: 73,
                                                      child:
                                                          new LinearPercentIndicator(
                                                        isRTL: true,
                                                        animation: true,
                                                        lineHeight: 73.0,
                                                        barRadius:
                                                            Radius.circular(6),
                                                        percent: presentFraction,
                                                        center: Container(
                                                            width: 360,
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                      width: 57,
                                                                      height:
                                                                          29,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              4),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              8),
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              233,
                                                                              241,
                                                                              238)),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            'حضر',
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 14,
                                                                                color: Color.fromARGB(255, 39, 114, 83)),
                                                                          ),
                                                                          Image
                                                                              .asset(
                                                                            'assets/tick-circle.png',
                                                                            width:
                                                                                16,
                                                                            height:
                                                                                16,
                                                                          )
                                                                        ],
                                                                      )),
                                                                  Container(
                                                                      child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                        Container(
                                                                          width:
                                                                              175,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            spacing:
                                                                                10,
                                                                            children: [
                                                                              Text(
                                                                                'اسم الدرس',
                                                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                                              ),
                                                                              Container(
                                                                                  width: 175,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 84,
                                                                                        child: Row(
                                                                                          spacing: 3,
                                                                                          children: [
                                                                                            Image.asset(
                                                                                              'assets/calendar.png',
                                                                                              width: 16,
                                                                                              height: 16,
                                                                                            ),
                                                                                            Text(
                                                                                              '28\12\2023',
                                                                                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'اسم السكشن',
                                                                                        style: TextStyle(fontWeight: FontWeight.w500),
                                                                                      )
                                                                                    ],
                                                                                  ))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ]))
                                                                ])),
                                                        linearStrokeCap:
                                                            LinearStrokeCap
                                                                .roundAll,
                                                        progressColor:
                                                            Color.fromARGB(255,
                                                                39, 114, 83),
                                                        backgroundColor:
                                                            Colors.white,
                                                        // ),
                                                      ));}),
                                                  Container(
                                                      width: 400,
                                                      height: 73,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child:
                                                          new LinearPercentIndicator(
                                                        isRTL: true,
                                                        barRadius:
                                                            Radius.circular(6),
                                                        animation: true,
                                                        lineHeight: 73.0,
                                                        // animationDuration: 2000,
                                                        percent: 0.0,
                                                        center: Container(
                                                            width: 360,
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                      width: 64,
                                                                      height:
                                                                          29,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              4),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              8),
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              254,
                                                                              249,
                                                                              230)),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            'لم يبدا',
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 14,
                                                                              color: Color.fromARGB(255, 242, 195, 42),
                                                                            ),
                                                                          ),
                                                                          Image
                                                                              .asset(
                                                                            'assets/info-circle.png',
                                                                            width:
                                                                                16,
                                                                            height:
                                                                                16,
                                                                          )
                                                                        ],
                                                                      )),
                                                                  Container(
                                                                      child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                        Container(
                                                                          width:
                                                                              175,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            spacing:
                                                                                10,
                                                                            children: [
                                                                              Text(
                                                                                'اسم الدرس',
                                                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                                              ),
                                                                              Container(
                                                                                  width: 175,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 84,
                                                                                        child: Row(
                                                                                          spacing: 3,
                                                                                          children: [
                                                                                            Image.asset(
                                                                                              'assets/calendar.png',
                                                                                              width: 16,
                                                                                              height: 16,
                                                                                            ),
                                                                                            Text(
                                                                                              '28\12\2023',
                                                                                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'اسم السكشن',
                                                                                        style: TextStyle(fontWeight: FontWeight.w500),
                                                                                      )
                                                                                    ],
                                                                                  ))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ]))
                                                                ])),
                                                        linearStrokeCap:
                                                            LinearStrokeCap
                                                                .roundAll,
                                                        progressColor:
                                                            Color.fromARGB(255,
                                                                242, 195, 42),
                                                        backgroundColor:
                                                            Colors.white,
                                                        // ),
                                                      ))
                                                ])),
                                        Container(
                                          width: 179,
                                          child: Column(
                                            spacing: 13.95,
                                            children: [
                                              AttendanceChart(),
                                              Container(
                                                  width: 180.17076110839844,
                                                  // child: Row(
                                                  //   spacing: 20.93,
                                                  //   children: [
                                                     child:  Container(
                                                          // width: 42.439029693603516,
                                                          child: Row(
                                                        spacing: 6.98,
                                                        children: [
                                                          Text(
                                                            'لم يبدا',
                                                            style: TextStyle(
                                                                fontSize: 12.21,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      242,
                                                                      195,
                                                                      42),
                                                            ),
                                                            width:
                                                                10.463417053222656,
                                                            height:
                                                                10.463417053222656,
                                                          ),
                                                          //  Container(width: 10.46,height: 10.46,
                                                          //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                                          //  )
                                                          
                                                      Container(
                                                          // width: 42.439029693603516,
                                                          child: Row(
                                                        spacing: 6.98,
                                                        children: [
                                                          Text(
                                                            'غياب',
                                                            style: TextStyle(
                                                                fontSize: 12.21,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      39,
                                                                      114,
                                                                      83),
                                                            ),
                                                            width:
                                                                10.463417053222656,
                                                            height:
                                                                10.463417053222656,
                                                          ),
                                                          //  Container(width: 10.46,height: 10.46,
                                                          //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                                          //  )
                                                        ],
                                                      )),
                                                      Container(
                                                          // width: 42.439029693603516,
                                                          child: Row(
                                                        spacing: 6.98,
                                                        children: [
                                                          Text(
                                                            'حضور',
                                                            style: TextStyle(
                                                                fontSize: 12.21,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      222,
                                                                      61,
                                                                      49),
                                                            ),
                                                            width:
                                                                10.463417053222656,
                                                            height:
                                                                10.463417053222656,
                                                          ),
                                                          //  Container(width: 10.46,height: 10.46,
                                                          //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                                          //  )
                                                        ],
                                                      ))
                                                    ],
                                                  ))
                                           ) ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                              width: 364,
                              // height: 428,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      width: 0.8,
                                      color:
                                          Color.fromARGB(255, 228, 231, 236))),
                              child: Column(
                                spacing: 16,
                                children: [
                                  Container(
                                    width: 316,
                                    child: Row(
                                      spacing: 16,
                                      children: [
                                        Container(
                                          width: 232,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            spacing: 8,
                                            children: [
                                              Text(
                                                '${name??"N/A"}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                'انضم في يناير 2023',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 107, 107, 107)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 56,
                                          height: 56,
                                          child: CircleAvatar(
                                            radius: 24,
                                            backgroundImage: NetworkImage(
  controller.student?.img != null 
    ? '${Applinks.baseurl}/${controller.student!.img}' 
    : 'placeholder_url'
),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      width: 316,
                                      height: 24,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 316,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '%',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    'مستوي التقدم',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ]),
                                          ),
                                          Container(
                                              width: 316,
                                              child: new LinearPercentIndicator(
                                                  isRTL: true,
                                                  // width:316,
                                                  // alignment:Alignment.centerRight,
                                                  // lineHeight: 8.0,
                                                  percent: 0.2,
                                                  progressColor: Color.fromARGB(
                                                      255, 39, 114, 83)))
                                        ],
                                      )),
                                  Container(
                                    width: 316,
                                    height: 44,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1)),
                                    padding: EdgeInsets.all(4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                            // borderRadius: BorderRadius.circular(16),
                                          ),
                                        child:   TextButton(
                                              style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      12, 8, 12, 8)),
                                              onPressed: () {},
                                                 child: Text('ولي الامر')),
                                          // child: TextButton(
                                          //     style: TextButton.styleFrom(
                                          //         padding: EdgeInsets.fromLTRB(
                                          //             12, 8, 12, 8)),
                                          //     onPressed: () {},
                                          //     child: Text('ولي الامر')),
                                        ),
                                        Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.05),
                                                offset: Offset(0, 3),
                                                blurRadius: 13,
                                                spreadRadius: 0,
                                              ),
                                            ],
                                            color: Colors.white,
                                            // borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      12, 8, 12, 8)),
                                              onPressed: () {},
                                              child: Text('الطالب')),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      width: 316,
                                      child: Column(
                                        spacing: 1,
                                        children: [

                                          Container(
                                            width: 316,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      child: Text(
                                                    '${controller.student.grade??"N/A"}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  Container(
                                                      child: Text(
                                                    ':السنة الدراسية',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                                ]),
                                          ),
                                          Container(
                                            width: 286,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      child:
                                                          Text('${controller.student.branch??'N/A'}')
                                                          ),
                                                  Container(
                                                      child: Text(
                                                          ':الشعبه العلميه')),
                                                ]),
                                          ),
                                          Container(
                                            width: 286,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      child:
                                                          Text('${controller.student.course?['placecountry']}')),
                                                  Container(
                                                      child: Text(':سنتر')),
                                                ]),
                                          ),
                                          Container(
                                            width: 286,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      width: 134,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              '${controller.student.phoneNum.toString()}',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            Image.asset(
                                                              'icons/call.png',
                                                              width: 16,
                                                              height: 16,
                                                            )
                                                          ]))
                                                ]),
                                          ),
                                          Container(
                                            width: 316,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      width: 250,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              '${controller.student.email.toString()??"n/a"}',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            Image.asset(
                                                              'icons/sms.png',
                                                              width: 16,
                                                              height: 16,
                                                            )
                                                          ]))
                                                ]),
                                          ),
                                          Container(
                                              width: 316,
                                              height: 40,

                                              // child:Column(

                                              // spacing: 8,
                                              // children: [
                                              child: TextButton(
                                                  style: TextButton.styleFrom(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 6, 69, 152)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'المعلومات التفصيليه',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  )))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 20,
                  ),SingleChildScrollView(child: 
                  Container(
                    padding: EdgeInsets.all(24),
                    width: 1032,
                    // height: 874,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      spacing: 24,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            width: 428,
                            child: Text(
                              'انشطه الطالب',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 6, 69, 152),
                              ),
                              textAlign: TextAlign.end,
                            )),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(255, 235, 239, 249),
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 6, 69, 152))),
                            width: 642,
                            height: 44,
                            child: Container(
                              width: 642,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 213,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            Color.fromARGB(255, 235, 239, 249)),
                                    padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('الواجبات',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 6, 69, 152))),
                                        Image.asset(
                                          'assets/Frame (2).png',
                                          width: 30,
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                  height: 44,  width: 213,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color.fromARGB(255, 6, 69, 152)),
                                    // padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          
                                          child: Text(
                                          'الامتحنات',style:TextStyle( fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: Colors.white),),
                                            style: TextButton.styleFrom(
                                               padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                                                )
                                                ,onPressed: (){},
                                                ),
                                        Image.asset(
                                          'assets/Frame (2).png',
                                          width: 30,
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  ),
                          InkWell(onTap: (){

                        controller.    fetchstud(Id:studentId );
                          },child:         Container(
                                    width: 213,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            Color.fromARGB(255, 235, 239, 249)),
                                    padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('محاضرات',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 6, 69, 152))),
                                        Image.asset(
                                          'assets/Frame (2).png',
                                          width: 30,
                                          height: 30,
                                        )
                                      ],
                                                            )                                  ),
                                  )
                                ],
                              ),
                            )),
                    SingleChildScrollView(child:     Container(
                          width: 984, //height: 702,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.only(top: 24),
                          child:  Column(
                            spacing: 24,
                            children: [
                              Container(
                                width: 982,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
// padding:EdgeInsets.fromLTRB(16, 8, 16, 8) ,
                                      width: 108,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 6, 69, 152)),
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.fromLTRB(
                                                16, 8, 16, 8)),
                                        onPressed: () {exportExcelSimple(context);},
                                        child: Container(
                                            // width: 76,
                                            child: Row(
                                          spacing: 3,
                                          children: [
                                            Text(
                                              'تصدير',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Color.fromARGB(
                                                      255, 6, 69, 152)),
                                            ),
                                            Image.asset("send-sqaure-2.png",
                                                width: 24, height: 24)
                                          ],
                                        )),
                                      ),
                                    ),
                                    Text(
                                      'الامتحانات السابقة (15)',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  width: 948,
                                  height: 68,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8) //,border: Border(top:BorderSide(width: 1)),
                                      ),
                                  child: Container(
                                      width: 984,
                                      height: 68,
                                      padding:
                                          EdgeInsets.fromLTRB(24, 12, 24, 12),
                                      child: Column(children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            spacing: 16,
                                            children: [
                                              Container(
                                                  width: 700,
                                                  height: 44,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    spacing: 32,
                                                    children: [
                                                      Container(
                                                        width: 95,
                                                        child: TextField(
                                                          textDirection: ui
                                                              .TextDirection
                                                              .rtl,
                                                          decoration:
                                                              InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    width: 0.5,
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        187,
                                                                        163,
                                                                        163))),
                                                            fillColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    245,
                                                                    245,
                                                                    245),
                                                            suffixIcon: Icon(
                                                                Icons.search),
                                                            hintText: 'بحث',
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 530,
                                                        height: 44,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          spacing: 16,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                      14,
                                                                      10,
                                                                      14,
                                                                      10), 
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Image.asset(
                                                                      'icons/arrow-down-icon.png',
                                                                      width: 24,
                                                                      height:
                                                                          24), 

                                                                  DropdownButton<
                                                                      String>(
                                                                    value:
                                                                        dropdownattendence,
                                                                    onChanged:
                                                                        (String?
                                                                            newValue) {
                                                                      // setState(
                                                                      //     () {
                                                                        dropdownattendence =
                                                                    
                                                                            newValue!;
                                                                            if(newValue=='حضر')
                                                                              //  controller.
                                                                { 
                                                                       List.generate(
                                                              controller
                                                                  .students2
                                                                  .length,
                                                              (index) {


for (var i = 0; i < controller.student.exams!.length; i++) {
  if (controller.student.exams![i]['attendence'] == true) {
    presentCount++; 
  } else {
    absentCount++; 
  }
}

 totalAttendance = presentCount + absentCount; 

presentPercentage = (presentCount / totalAttendance) * 100;
 absentPercentage = (absentCount / totalAttendance) * 100;

presentPercentage = double.parse(presentPercentage.toStringAsFixed(2));
absentPercentage = double.parse(absentPercentage.toStringAsFixed(2));

print('Total Present: $presentCount (${presentPercentage}%)');
print('Total Absent: $absentCount (${absentPercentage}%)');
print('Total Attendance Records: $totalAttendance');
// print('Total exams: $totalExams');
print('Present: $presentCount');
print('Absent: $absentCount'); 

                                                                   controller.  findonestudent('${controller.students2[index].id}',attendence: 1);}
                                                                    );}    else   if(newValue=='غائب')
                                                                              //  controller.
                                                                {      List.generate(
                                                              controller
                                                                  .students2
                                                                  .length,
                                                              (index) {
                                                                   controller.  findonestudent('${controller.students2[index].id}',attendence:0);}
                                                                    );}
                                                                      // });
                                                                    },
                                                                    items: attendence.map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                      return DropdownMenuItem<
                                                                          String>(
                                                                        value:
                                                                            value,
                                                                        child: Text(
                                                                            value),
                                                                      );
                                                                    }).toList(),
                                                                    iconSize: 0,
                                                                    icon:
                                                                        null, 
                                                                    underline:
                                                                        Container(), 
                                                                    isExpanded:
                                                                        false, 
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          14,
                                                                          10,
                                                                          14,
                                                                          10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey), 
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Image.asset(
                                                                      'icons/arrow-down-icon.png',
                                                                      width: 24,
                                                                      height:
                                                                          24),

                                                                  DropdownButton<
                                                                      String>(
                                                                    value:
                                                                        dropdownValue,
                                                                    onChanged:
                                                                        (String?
                                                                            newValue) {
                                                                      // setState(
                                                                      //     () {
                                                                        dropdownValue =
                                                                            newValue!;
                                                                      // });
                                                                    },
                                                                    items: items.map<
                                                                        DropdownMenuItem<
                                                                            String>>((String
                                                                        value) {
                                                                      return DropdownMenuItem<
                                                                          String>(
                                                                        value:
                                                                            value,
                                                                        child: Text(
                                                                            value),
                                                                      );
                                                                    }).toList(),
                                                                    iconSize: 0,
                                                                    icon:
                                                                        null, 
                                                                    underline:
                                                                        Container(), 
                                                                    isExpanded:
                                                                        false, 
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 266,
                                                              height: 44,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                spacing: 12,
                                                                children: [
                                                                  Container(
                                                                    width: 266,
                                                                    child:
                                                                        TextField(
                                                                          onChanged: (value){return controller.searchExams(value);},
                                                                      textDirection: ui
                                                                          .TextDirection
                                                                          .rtl,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        enabledBorder:
                                                                            OutlineInputBorder(borderSide: BorderSide(width: 0.5, color: const Color.fromARGB(255, 187, 163, 163))),
                                                                        fillColor: Color.fromARGB(
                                                                            255,
                                                                            245,
                                                                            245,
                                                                            245),
                                                                        suffixIcon:
                                                                            Icon(Icons.search),
                                                                        hintText:
                                                                            'ابحث عن اسم الامتحان او الدرس',
                                                                        border:
                                                                            InputBorder.none,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                    ),
                                                                  )
                                       
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            ])
                                      ]))),
                              Container(
                                width: 984,
                                height: 95,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      offset: Offset(0, 3),
                                      blurRadius: 13,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          height: 95,
                                          padding: EdgeInsets.fromLTRB(
                                              24, 12, 24, 12),
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(
                                            spacing: 12,
                                            children: [Text('المستوي')],
                                          )),
                                      Container(
                                          height: 95,
                                          padding: EdgeInsets.fromLTRB(
                                              24, 12, 24, 12),
                                          width: 185,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(
                                            spacing: 12,
                                            children: [Text('درجة الامتحان')],
                                          )),
                                      Container(
                                          height: 95,
                                          padding: EdgeInsets.fromLTRB(
                                              24, 12, 24, 12),
                                          width: 149,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(
                                            spacing: 12,
                                            children: [Text('تاريخ التقديم')],
                                          )),
                                      Container(
                                          height: 95,
                                          padding: EdgeInsets.fromLTRB(
                                              24, 12, 24, 12),
                                          width: 113,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(
                                            spacing: 12,
                                            children: [Text('حاضر\غائب')],
                                          )),
                                      Container(
                                          height: 95,
                                          padding: EdgeInsets.fromLTRB(
                                              24, 12, 24, 12),
                                          width: 187,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(
                                            spacing: 12,
                                            children: [Text('اسم الدرس')],
                                          )),
                                      Container(
                                        
                                          height: 95,
                                          // padding: EdgeInsets.fromLTRB(
                                          //     24, 12, 24, 12),
                                          width: 123,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: 
                                          
                                          // Row(
                                          //   spacing: 12,
                                          //   children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [  
                                          
                                            Container(width: 85,child:   Text(
                                                'اسم الامتحان',
                                                style: TextStyle(),
                                              )
                                              // )
                                            // ],
                                          )]))
                                    ]),
                              ),  ...List.generate(controller.student.exams?.length ?? 0,(index){





for (var i = 0; i < controller.student.exams!.length; i++) {
  if (controller.student.exams![i]['attendence'] == true) {
    presentCount++; 
  } else {
    absentCount++;
  }
}

 totalAttendance = presentCount + absentCount; 
presentPercentage = (presentCount / totalAttendance) * 100;
 absentPercentage = (absentCount / totalAttendance) * 100;

presentPercentage = double.parse(presentPercentage.toStringAsFixed(2));
absentPercentage = double.parse(absentPercentage.toStringAsFixed(2));

print('Total Present: $presentCount (${presentPercentage}%)');
print('Total Absent: $absentCount (${absentPercentage}%)');
print('Total Attendance Records: $totalAttendance');
// print('Total exams: $totalExams');
print('Present: $presentCount');
print('Absent: $absentCount');                          return Container(
                                width: 984,
                                height: 72,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        offset: Offset(0, 3),
                                        blurRadius: 13,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                spacing: 12,  children: [
                                   Row(children: [
Container(width: 127 ,child:Container( width: 117,height: 50
, child:  TextButton(  style: TextButton.styleFrom(shape:
 RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
),
side: BorderSide(width: 1,color: Color.fromARGB(255, 6, 69, 152)),padding: EdgeInsets.all(16)
), child:Text('شوف التفاصيل' ,style: TextStyle(color:
Color.fromARGB(255, 6, 69, 152) ),) ,onPressed: (){},))),
Container(
  
  width: 100,height: 72 ,child:Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ Text('ناجح',style: TextStyle(color: Colors.green),),])),

                                    Container( 
                                      width: 205,decoration: BoxDecoration(color: Colors.white)
,height: 72,child: Row(
  
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
  Text('%90'),
 new LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 8.0,barRadius: Radius.circular(16),
                    percent: 0.9
                    ,alignment:MainAxisAlignment.start,isRTL: true,
                    progressColor: Color.fromARGB(230, 6, 69, 152)
                  ),

],),),
//  Container(child: ,),
  Container( width: 149, child:Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                Text('2023 15يناير')
,
                                Text('9:30AM')
                               ],) 
                               
                                  ,  Image.asset('assets/calendar.png',width: 20,height: 20,)
                                ],) ),


Container(
width: 58,height: 29,
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
color:Color.fromARGB(223, 233, 241, 238)),
padding: EdgeInsets.all(4)
,child:

 Row(children: [
 
Text( '${controller.student.exams![index]['attendence']==true?'حاضر':'غائب'}',style: TextStyle(color: Color.fromARGB(255, 39, 114, 83)),)
 , Image.asset('icons/tick-circle.png',width:16 ,height:16 ,)
])),]),
                                     Container( width: 187,height: 72,
                                    //  padding: EdgeInsets.fromLTRB(24,16,24,16),
                              child:
                               Row(//spacing: 12,
                               mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Container(width: 142,height: 40,child:
                                 Text('${controller.student.courses?.map((e)=>e['type']??'').join()}',style: TextStyle(fontSize: 14),),//)
                              // )
                              ],),),
                                   Container(
                                      width: 123,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                      ),
                                    // padding: EdgeInsets.fromLTRB(24, 18, 24, 18),
                                child:Container(height: 72, 
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [  
                                  

                                     Text('${controller.student.exams![index]['exam_name']}')
                                    
                                    ])),
                                    )
                                    ,
                                  
                                
                                  ],
                                ),
                              );
                             


        })],
                          ),
                    ))
                     ,  Container(
    width: 1030,
    height: 67,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
           GestureDetector(
          onTap: () {
            if (controller.currentPage > 1) {
              controller.currentPage--;
            var id= controller.students2.map((f)=>f.id.toString());
          controller .fetchStudent('${controller.student.id}',page:controller.currentPage);
              // controller.studentexam(controller.currentPage);
              print( controller.currentPage);
              controller.update();
            }
          },
          child: Container(
            width: 95,
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset('icons/arrow-left.png', width: 20, height: 20,color:controller.currentPage <
                 controller.totalPages  ?Colors.black 
                  : Colors.blue,) ,  const SizedBox(width: 4), Text(
                  'السابق',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,color: controller.currentPage < controller.totalPages
               ? Colors.black
                  :Colors.blue ,
                  ),
                ),
              
              
              ],
            ),
          ),
        ),
     
 
        Container(
          // width: 292,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageNumbers(controller),
          ),
        ),

        GestureDetector(
          onTap: () {
            if (controller.currentPage < controller.totalPages) {
              controller.currentPage++;
          print('students44${ controller.students2.map((f)=>f.id.toString())}' );
          
        // var id= controller.students2.map((f)=>f.id.toString());
        var id = controller.students2.map((f)=>f.id.toString());
        
controller.fetchStudent('${controller.student.id}', page:controller.currentPage);
          // controller .fetchStudent('$id',page:controller.currentPage);
              // controller.studentexam(controller.currentPage);
              controller.update();
            }
          },
          child: Container(
            width: 87,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Text(
                  'التالي',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: controller.currentPage < controller.totalPages
                  ? Colors.blue
                  : Colors.black,
                  ),
                ),    const SizedBox(width: 4), 
                 Image.asset('icons/Icon.png', width: 20, height: 20,
                 color: controller.currentPage < controller.totalPages
                  ? Colors.blue
                  : Colors.black,),
            
              ],
            ),
          ),
        ),

   ],
    ),
  )
                               ],
                    ),
                    
                  )
                   )
                   
                  ,                    
                                           
                    ]),
              ))
            ],
          );
        },
      ),
    );
  }
Future<void> exportExcelSimple(BuildContext context) async {
  try {
    print('=== Export Started ===');
    
    final controller = Get.find<HomeController>();
    
    // تحميل البيانات إذا لزم
    if (controller.student == null) {
      await controller.fetchStudent(studentId.toString());
      controller.update();
      await Future.delayed(Duration(milliseconds: 500));
    }
    
    if (controller.student?.exams == null || controller.student!.exams!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ لا توجد بيانات'))
      );
      return;
    }
    
    final exams = controller.student!.exams!;
    
    // إنشاء Excel
    final excel = excel_lib.Excel.createExcel();
    final sheet = excel['نتائج الامتحانات'];
    
    // إضافة العناوين باستخدام appendRow (أسهل)
    sheet.appendRow([
      excel_lib.TextCellValue('اسم الامتحان'),
      excel_lib.TextCellValue('اسم الدرس'),
      excel_lib.TextCellValue('الحضور'),
      excel_lib.TextCellValue('التاريخ'),
      excel_lib.TextCellValue('الدرجة'),
      excel_lib.TextCellValue('النتيجة'),
    ]);
    
    // إضافة كل البيانات مرة واحدة
    for (final exam in exams) {
      if (exam == null) continue;
      
      sheet.appendRow([
        excel_lib.TextCellValue(exam['exam_name']?.toString() ?? ''),
        excel_lib.TextCellValue('التيار الكهربي الفصل الرابع'),
        excel_lib.TextCellValue(exam['attendence'] == true ? 'حاضر' : 'غائب'),
        excel_lib.TextCellValue(exam['date']?.toString() ?? ''),
        excel_lib.TextCellValue(exam['score']?.toString() ?? '90%'),
        excel_lib.TextCellValue(exam['passed'] == true ? 'ناجح' : 'راسب'),
      ]);
    }
    
    // حفظ الملف
    final bytesList = excel.save();
    if (bytesList == null) throw 'Failed to save Excel';
    
    final bytes = Uint8List.fromList(bytesList);
    final fileName = '${name ?? "طالب"}_نتائج_${DateFormat('yyyy-MM-dd').format(DateTime.now())}.xlsx';
    
    if (kIsWeb) {
      final blob = html.Blob([bytes], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', fileName)
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      final dir = await getDownloadsDirectory();
      if (dir != null) {
        await File('${dir.path}/$fileName').writeAsBytes(bytes);
      }
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ تم تصدير ${exams.length} امتحان'),
        backgroundColor: Colors.green,
      )
    );
    
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ $e'),
        backgroundColor: Colors.red,
      )
    );
  }
}
//     var sheet = excel['Sheet1'];

//     // Add headers
//     sheet.appendRow([
//       excel_lib.TextCellValue('اسم الامتحان'),
//       excel_lib.TextCellValue('اسم الدرس'),
//       excel_lib.TextCellValue('حاضر/غائب'),
//       excel_lib.TextCellValue('تاريخ التقديم'),
//       excel_lib.TextCellValue('درجة الامتحان'),
//       excel_lib.TextCellValue('المستوي'),
//     ]);

//     // Add data
//     for (var exam in controller.student.exams ?? []) {
//       sheet.appendRow([
//         excel_lib.TextCellValue(exam['exam_name']?.toString() ?? ''),
//         excel_lib.TextCellValue('التيارالكهربي الفصل الرابع'),
//         excel_lib.TextCellValue(exam['attendence'] == true ? 'حاضر' : 'غائب'),
//         excel_lib.TextCellValue(exam['date']?.toString() ?? ''),
//         excel_lib.TextCellValue('90%'),
//         excel_lib.TextCellValue('ناجح'),
//       ]);
//     }

//     // Generate file name
//     String studentName = name ?? "طالب";
//     String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
//     String fileName = '${studentName}_exam_results_$date.xlsx';

//     // Get bytes
//     List<int>? excelBytesList = excel.save();
    
//     if (excelBytesList != null) {
//       Uint8List excelBytes = Uint8List.fromList(excelBytesList);
      
//       if (kIsWeb) {
//         // Web download
//         final blob = html.Blob([excelBytes], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
//         final url = html.Url.createObjectUrlFromBlob(blob);
//         final anchor = html.AnchorElement(href: url)
//           ..setAttribute('download', fileName)
//           ..click();
//         html.Url.revokeObjectUrl(url);
        
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('✅ تم بدء تحميل ملف Excel'),
//             backgroundColor: Colors.green,
//           )
//         );
//       } else {
//         // Mobile: Save to downloads folder
//         Directory? directory;
//         if (Platform.isAndroid) {
//           directory = Directory('/storage/emulated/0/Download');
//           if (!await directory.exists()) {
//             directory = await getExternalStorageDirectory();
//           }
//         } else if (Platform.isIOS) {
//           directory = await getApplicationDocumentsDirectory();
//         }

//         if (directory != null) {
//           File file = File('${directory.path}/$fileName');
//           await file.writeAsBytes(excelBytes);
          
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('✅ تم حفظ الملف في: ${file.path}'),
//               backgroundColor: Colors.green,
//             )
//           );
//         }
//       }
//     }

//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('❌ خطأ: $e'),
//         backgroundColor: Colors.red,
//       )
//     );
//   }
// }
  
  Widget _buildTextField(
      String label, String hint, TextEditingController controllers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 4),
        TextField(
          controller: controllers,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

String dropdownValue = 'ادخل السنه الدراسيه';

List<String> list = ['ادخل السنه الدراسيه', 'Item 2', 'Item 3'];
Widget buildDropdownContainer(double maxWidth) {
  return Container(
    width: maxWidth * 0.40,
    constraints: BoxConstraints(minWidth: 453),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('السنه الدراسيه'),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 125, 140, 158),
              style: BorderStyle.solid,
              // width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              onChanged: (String? newValue) {
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_drop_down),
                      Flexible(
                        child: Text(
                          value,
                          textDirection: ui.TextDirection.rtl,
                          style: TextStyle(),
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}
List<Widget> _buildPageNumbers(HomeController controller) {
  final currentPage = controller.currentPage;
  final totalPages = controller.totalPages;
  final List<Widget> pages = [];

  void addPage(int page) {
    pages.add(
      GestureDetector(
        onTap: () {
          controller.currentPage = page;
           var id= controller.students2.map((f)=>f.id.toString());
          controller .fetchStudent('${controller.student.id}',page:controller.currentPage);
              // controller.studentexam(controller.currentPage);
              controller.update();
        },
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: page == currentPage ? Colors.grey.shade300 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$page',
            style: TextStyle(
              color: page == currentPage ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  if (totalPages <= 7) {
    for (int i = 1; i <= totalPages; i++) {
      addPage(i);
    }
  } else {
    for (int i = 1; i <= 3; i++) {
      addPage(i);
    }

    if (currentPage > 4 && currentPage < totalPages - 3) {
      pages.add(const SizedBox(
        width: 40,
        height: 40,
        child: Center(child: Text('...')),
      ));

      addPage(currentPage);

      pages.add(const SizedBox(
        width: 40,
        height: 40,
        child: Center(child: Text('...')),
      ));
    } else {
      pages.add(const SizedBox(
        width: 40,
        height: 40,
        child: Center(child: Text('...')),
      ));
    }

    for (int i = totalPages - 2; i <= totalPages; i++) {
      addPage(i);
    }
  }

  return pages;
}
