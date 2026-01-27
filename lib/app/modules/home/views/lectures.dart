import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/modules/lessons.dart';
import 'package:flutterwallet/app/modules/home/views/askquestion.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/containerforaskques.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui' as ui;


class Lectures extends StatefulWidget {
  const Lectures({super.key});

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {

 String result='';
      String? selectedValue; // Variable to store the selected value

// List<TextEditingController> controllers = [];


//   @override
//   void initState() {
//     super.initState();
 
//     controllers.add(TextEditingController());
//   }
  @override
  Widget build(BuildContext context) {
    var  lessonid;
        double screenWidth = MediaQuery.of(context).size.width;
HomeController homeController =HomeController();
double screenHeight = MediaQuery.of(context).size.height;
        screenHeight * 0.15;
    double gap = screenWidth * 0.03;

  final List<String> items = [
    'سؤال مقالي',
    'سؤال اكمل',
    'سؤال اختار',
    'سؤال صح/غلط',
  ];

    bool isDesktop = screenWidth > 1200;
    bool isTablet = screenWidth > 768 && screenWidth <= 1200;
    bool isMobile = screenWidth <= 768;
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
              Expanded(child:
               Row(
            children: [
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 16,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Container(
                      width: 680, // Fixed width
                      // height:475, // Responsive height (70% of screen height)
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
                      padding: const EdgeInsets.all(24),
                      child: Column(
spacing: 16,
                        children: [
                          
                          Container(width:632,height:40,
                          
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           
                           ElevatedButton(
                            
                            style: ButtonStyle(
                              padding:  MaterialStateProperty.all<EdgeInsets>( 
                                EdgeInsets.fromLTRB(14, 8, 14, 8)),
                                backgroundColor: 
                                 MaterialStateProperty.all<Color>
                                 (Color.fromARGB(255, 6, 69, 152),),
                         shape:  MaterialStateProperty.
                         all<RoundedRectangleBorder>(
                          
  
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      // side: BorderSide(color: Colors.red)
    )
                         ),
                            ),
                            onPressed: (){
             showDialog(context: context, builder: (BuildContext context){
      List.generate(controller.allsections.length,(index){
    print('http://localhost:3000/${controller.allsections[index].cardimg}');});
    return  Containerforaskques();

    });// Add lecture logic here
//   showDialog(context: context, builder: (BuildContext context ){
// return Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   mainAxisAlignment:MainAxisAlignment.center,
//   children: [ 
    
// Expanded(
//   child: Askquestion(),
// ),]);
//       });
     }, child: 
                          Row(children: [
                             Text('أنشاء اسئلة جديدة'
                             ,style: TextStyle(color: Colors.white),

                             ),Image.asset('icons/add-square3.png',width: 20,height: 20,)

                          ])
                           ),
                              Text('الأسئلة (5)',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: 'Teshrin AR+LT',
                                color:
                                Color.fromARGB(255, 107, 107, 107) ),)
                            ],)
                            
                            
                            
                            
                            ),SizedBox(height: 16,)
,

...List.generate(controller.lessons.questions?.length ?? 0, (index) {
  print('llesson${controller.lessons.questions?.length }');
 
    
    
    return                Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 632,
padding: EdgeInsets.fromLTRB(24, 25, 24, 25),
                            decoration: BoxDecoration(
                            color: Colors.white,

                          borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Color(0x0D000000), 
      blurRadius: 13,        
      offset: Offset(0, 3),  
    ),
  ],

),
child:
  Container(width: 584,child:
Column(
  
  children: [ 
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
children: [
 Container(
  child: Image.asset('icons/Group 37966.png',width: 26,height: 6,)
  )  ,

Container(
 child: Row(


  children: [ 

    Text('${ controller.lessons.questions?[index]['name']}',style: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16),
    textAlign: TextAlign.right,),
    SizedBox(width: 16,),
    Image.asset('icons/questions.png',width: 24,height: 24,),
    SizedBox(width: 16,),
    Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
    
    ],
),)

])
])
)
,
                          
                          )],);}),
                          SizedBox(height: 16,)
                          
                      
                      ,
Container(
height: 67,  
 padding: EdgeInsets.fromLTRB(24, 11, 24, 16), decoration: BoxDecoration(color:Colors.white
  ,
  borderRadius: BorderRadius.only(
  bottomLeft: Radius.circular(16)
  ,bottomRight:Radius.circular(16) )
  ),
  child: 
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children: [
    Container(
  width: 95,height: 36,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
  child: TextButton(onPressed: ()=>{},
  style: ButtonStyle(
          shape: MaterialStateProperty.all( 
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)))
  ),
   child: Row(
    
    children: [
Image.asset('icons/arrow-left.png',width: 20,height: 20,)
,
  Text('التالي'),

],)),),
Container( width: 292,
child: 
Row(
  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
  children: [
Container(width: 40,child: Text('1'),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),)),
Container(width: 40,child: Text('2'),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),)),
Container(width: 40,child: Text('3'),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),)),
Container(width: 40,height: 40,child: Text('...'),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),)),
Container(width: 40,child: Text('8'),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),)),
Container(width: 40,child: Text('9'),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),)),
Container(width: 40,child: Text('10'),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),)),

],)
),
Container(
  width: 95,height: 36,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
  child: TextButton(onPressed: ()=>{},
  style: ButtonStyle(
          shape: MaterialStateProperty.all( RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)))
  ),
   child: Row(children: [
  Text('السابق'),
Image.asset('icons/Icon.png',width: 20,height: 20,)

],)),)

],)
)   
     ])),Container(
       padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
       
      // padding: EdgeInsets.fromLTRB(504, 120, 0, 0),
        margin: EdgeInsets.only(
                        top: 60,
                        left: 64,
                        bottom: 40,
                        right: 40,
                      ),
      width: 328,height: 740,decoration: BoxDecoration(

      color: Colors.white
,borderRadius:BorderRadius.circular(16)



     ),
     
     child:
Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
      child:
    Text('اختر الدرس',
    style: 
    TextStyle(
    fontWeight:
    FontWeight.w600,
    fontSize: 20
    ),
    textAlign: 
    TextAlign.right,) ,width: 259, )

,SizedBox(height: 16,)
,SizedBox(height: 8,),

          Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: 264,
          child:     Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child:
                Image.asset('icons/add-square.png',width: 40,height: 40,),
                ),SizedBox(width: 10,),
           Container(  width: 120, child:     Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween
           ,children: [            
            Column(children: [  
            Text('الوحدة الاوله',
            style: TextStyle(fontWeight: FontWeight.w400
            ,fontSize:14 
            ))
            ,Text('دروس عامة',
            style: TextStyle(fontWeight: FontWeight.w500
            ,fontSize: 16),)]),
            Image.asset('icons/arrow-down.png',width: 24,height: 24,)

             ],),

 )  ]) ),
            ...List.generate(controller.lesson.length,(index){
          // ,SizedBox(height: 8,)
        return 
      InkWell(onTap: (){
       lessonid=  controller.lesson[index].id.toString();
       print(lessonid);
controller.lessonquestions(controller.lesson[index].id.toString());
// print ();
       },child:         Container( width: 264,//color: Color.fromARGB(255, 235, 239, 249),
          padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
          height: 52,child:  Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                
           onTap: () async {
    await controller.deleteLesson(controller.lesson[index].id.toString());
    
    // Remove the item from the list locally
    controller.lesson.removeAt(index);

    // Notify listeners (if using GetBuilder)
    controller.update();
    // لو كنت تستخدم Obx وما تحتاج update()، يكفي removeAt فقط.
  },
                child: 
            Image.asset('icons/delete.png',width: 24,height: 24,),)
       , Container(width: 105,child:  Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
              Text('${controller.lesson[index].name}'),
            // Image.asset('icons/✏️ Digit.png',
            // width: 24,height: 24,)
           Container(width: 24,height: 24,decoration: BoxDecoration(borderRadius: BorderRadius.circular(93.25),color: Colors.black
           
           ),child: Text('${controller.lesson[index].course_num}',style: TextStyle(
            fontWeight: FontWeight.w400,fontSize: 16,
            color: Colors.white ,),textAlign: TextAlign.center,),)
           ]) )])    ));})
                
          
      
 ,Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DottedBorder
          (
            color: Colors.blue, // لون الحدود
            strokeWidth: 1, // عرض الخط
            dashPattern: [6, 3], // نمط التقطيع: طول الخط والمسافة بين الخطوط
            borderType: BorderType.RRect, // نوع الحواف
            radius: Radius.circular(8), // نصف قطر الزاوية
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(8),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide.none, // إزالة الحدود الافتراضية
                  ),
                ),
              ),
              onPressed: () {
controller.addLesson();

              },
              child: Row(
                children: [
                  Text(
                    'أنشاء درس جديد',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    'icons/add-square.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    Column (children:[ 
       Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: 264,
          child:     Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.asset('icons/add-square.png',width: 40,height: 40,),
                SizedBox(width: 10,),
           Container(  width: 120, child:     Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween
           ,children: [            
            Column(children: [  
            Text('الوحدة الاوله',
            style: TextStyle(fontWeight: FontWeight.w400
            ,fontSize:14 
            ))
            ,Text('دروس عامة',
            style: TextStyle(fontWeight: FontWeight.w500
            ,fontSize: 16),)]),
            Image.asset('icons/arrow-down.png',width: 24,height: 24,)

             ],),

 )  ]) )
       ,Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: 264,
          child:     Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.asset('icons/add-square.png',width: 40,height: 40,),
                SizedBox(width: 10,),
           Container(  width: 120, child:     Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween
           ,children: [            
            Column(children: [  
            Text('الوحدة الاوله',
            style: TextStyle(fontWeight: FontWeight.w400
            ,fontSize:14 
            ))
            ,Text('دروس عامة',
            style: TextStyle(fontWeight: FontWeight.w500
            ,fontSize: 16),)]),
            Image.asset('icons/arrow-down.png',width: 24,height: 24,)

             ],),

 )  ]) )
      , Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: 264,
          child:     Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.asset('icons/add-square.png',width: 40,height: 40,),
                SizedBox(width: 10,),
           Container(  width: 120, child:     Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween
           ,children: [            
            Column(children: [  
            Text('الوحدة الاوله',
            style: TextStyle(fontWeight: FontWeight.w400
            ,fontSize:14 
            ))
            ,Text('دروس عامة',
            style: TextStyle(fontWeight: FontWeight.w500
            ,fontSize: 16),)]),
            Image.asset('icons/arrow-down.png',width: 24,height: 24,)

             ],),

 )  ]) )
 ])
     ]))
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
      

      