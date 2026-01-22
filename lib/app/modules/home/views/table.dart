import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/calender1.dart';
import 'package:flutterwallet/app/modules/home/views/datepicker.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui' as ui;

class table extends StatelessWidget {
  const table({super.key});

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
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

final List<Color> colors=[
  Color.fromARGB(255, 181, 181, 181),
  Color.fromARGB(255, 255, 249, 236),
  Color.fromARGB(255, 235, 250, 254),
  Color.fromARGB(255, 255, 238, 234),
  Color.fromARGB(255, 205, 242, 224),

];
    
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth * 0.25; 
    double containerHeight =
        screenHeight * 0.15; 
    double gap = screenWidth * 0.03;
    
    double responsiveWidth = screenWidth * 0.7; 
    double responsiveHeight = screenHeight * 0.15; 
    double responsiveGap = screenHeight * 0.03;
    bool isDesktop = screenWidth > 1200;
    bool isTablet = screenWidth > 768 && screenWidth <= 1200;
    bool isMobile = screenWidth <= 768;
  HomeController controller=HomeController();
    return  Scaffold(
      drawer: isMobile
          ? Drawer(
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
            
          body:GetBuilder<HomeController>(init:HomeController() 
    ,builder: (controller){
      return  
      //  Row(
      //       children: [
      //     // Main Content
              Expanded(child:
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(

    
                      color: Colors.white,
                      height: 96,
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop
                            ? 64
                            : isTablet
                                ? 32
                                : 16,
                      ),
                      child: App_bar(),
                    ),

       Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

calender1(),
 
 
     Container(
       padding: EdgeInsets.symmetric(horizontal: 24,vertical: 40),
        margin: EdgeInsets.only(
                        top: 60,
                        left: 64,
                        bottom: 40,
                        right: 40,
                      ),
      width: 593,height: 642,decoration: BoxDecoration(

      color: Colors.white
,borderRadius:BorderRadius.circular(16)



     ),
     
     child:
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [


Container(
  width: 545,height: 73,
 
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
                                                  Container(
                                                    width:
                                                        120, 
                                                    height:
                                                        28, 
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top:
                                                          4, 
                                                      right:
                                                          10, 
                                                      bottom:
                                                          4, 
                                                      left:
                                                          10, 
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), 
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, 
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
                                                   child: TextButton(onPressed: ()async{
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

          final selectedDateString = controller. formatDate(newSelectedDay)??'';

       controller.   dailytable(coursetabledate:selectedDateString);


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
   
 

                                                   });}, child: Text('')),
                                      
                                                  ),

Container( width: 425,height: 73,child: Column(children: [
  Container(width: 425,height: 40,child: 
Text('الجدول اليومي' ,textAlign: TextAlign.right,style
: TextStyle(fontFamily: 'Teshrin AR+LT',fontWeight: FontWeight.w600
,fontSize: 32,


),
)),


Container(width: 425,height: 25,child: 
Text('الاتنين 14 يناير 2023',textAlign: TextAlign.right,
style: TextStyle(
  color: Colors.grey,
  fontWeight:
 FontWeight.w500,fontSize: 20,
 fontFamily: 'Teshrin AR+LT'
 ),
)  )
 ],),
 )
//  ])

],),)

   ,Container( width: 545,height: 65,
   child: Row(children: [


Container(height: 1,width: 457
,decoration: BoxDecoration(color:
 Color.fromARGB(255, 181, 181, 181)))
,
SizedBox(width: 24,),
Text('07:00',textAlign: 
TextAlign.right,style: 
TextStyle(fontFamily: 'Teshrin AR+LT'
,fontWeight: FontWeight.w500
,fontSize: 20,color: Color.fromARGB(255, 181, 181, 181)

),)

   ],),
   ),
Column(
  
  
  children: [
    
   ...List.generate(controller.dailytables.course_info?.length??0 ,(index){
  return Column(children: [

   Container( width: 545,height: 65,
   child: Row(children: [


Container(width: 457,height: 64,decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(12)
,
color: colors[index]
),padding: EdgeInsets.fromLTRB(22, 10, 22, 10),
child: Container(
  width: 413,height: 44,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

Container(width: 65,height: 16,
child: 
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
 
Text('${controller.dailytables.course_info?[index]['course_num']}'
,style:TextStyle(fontFamily: 'Montserrat',
fontWeight: FontWeight.w700,fontSize: 12
,color: Color.fromARGB(255, 77, 85, 162)
))


],)
),
Container(width: 65,height: 16,
child: 
Row(
  children: [
    SizedBox(width: 24,),
Text('${controller.dailytables.course_info?[index]['course_center']}'
,style:TextStyle(fontFamily: 'Montserrat',
fontWeight: FontWeight.w700,fontSize: 12
,color: Color.fromARGB(255, 77, 85, 162)
))


],)
),

Container(
  width:235 ,height:44 ,
  
  child:
Row(
 mainAxisAlignment: MainAxisAlignment.start,
  children: [

Container ( width: 235,height: 44,
child:  Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.start,
  
  children: [
Container(child: Row(
 
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
 Column(
  
  children: [ 
  Text('${controller.dailytables.course_info?[index]['name']??''}',
style:TextStyle(fontFamily: 'Montserrat',
fontWeight: FontWeight.w700,fontSize: 12
,color: Color.fromARGB(255, 77, 85, 162)
)
 ,textAlign: TextAlign.right,),
 
 Text('07:00 - 09:00',textAlign: TextAlign.center,
 style: TextStyle(fontFamily: "Montserrat",
 fontWeight: FontWeight.w700,
 fontSize: 12,
 color: Color.fromARGB(248, 140, 140, 140)),)],),
 SizedBox(width: 8,)
 ],),),
 Image.asset(
'icons/✏️ Digit@2x.png' ,
 width: 24,height: 24,
),

],)),



]))

]))
)
,
SizedBox(width: 24,),
Text('07:00',textAlign: TextAlign.right,style: 
TextStyle(fontFamily: 'Teshrin AR+LT'
,fontWeight: FontWeight.w500
,fontSize: 20,color: Color.fromARGB(255, 181, 181, 181)

),)

   ],),
   )
   ,               SizedBox(height: 16,)
   
   ]);



                  }),
                  SizedBox(height: 16,)
                  ]
                  
                  
                  )]))
      ]),
     
          
            
     ]))),
     if (!isMobile)
                Container(
                  width: 280,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                    color: Color.fromARGB(240, 6, 69, 152),
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
     ]));
     
     
     }));}}
      

      