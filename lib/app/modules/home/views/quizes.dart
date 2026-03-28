import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/containdialoge.dart';
import 'package:flutterwallet/app/modules/home/views/containe.dart';
import 'package:flutterwallet/app/modules/home/views/dialogs/dialog_quizes.dart';
import 'package:flutterwallet/app/modules/home/views/dropdown.dart';
import 'package:flutterwallet/app/modules/home/views/onlinequizes.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

import 'stabledropdown.dart';
class quizes extends StatefulWidget {
  const quizes({super.key});

  @override
  State<quizes> createState() => _DashboardScreen2State();
}

class _DashboardScreen2State extends State<quizes> {



 final HomeController controller = Get.find<HomeController>();
  bool _isInitialized = false;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    print('🚀 quizes - initState');
    
    Future.delayed(Duration(milliseconds: 100), () {
      if (!_isDisposed && !_isInitialized) {
        _initializeDashboard();
      }
    });
  }

  Future<void> _initializeDashboard() async {
    if (_isInitialized || _isDisposed) return;
    
    print('🔧 بدء تهيئة DashboardScreen2');
    _isInitialized = true;
    
    // تأكد أن isDashboardOpen = true
    controller.isDashboardOpen.value = true;
    print('✅ تم تعيين isDashboardOpen = true في DashboardScreen2');
    
    print('✅ DashboardScreen2 مهيأ بنجاح');
  }

  @override
  void dispose() {
    print('❌ DashboardScreen2 - dispose');
    _isDisposed = true;
    
    final nextRoute = Get.currentRoute;
    if (!nextRoute.contains('Dashboard')) {
      controller.isDashboardOpen.value = false;
    }
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
final isDesktop = screenWidth >= 1200;
  //  Timer? _refreshTimer;
  // final screenWidth = MediaQuery.of(context).size.width;
  final isMobile = screenWidth < 650;
  final istablet = screenWidth < 1024;  // return Scaffold(
  
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          // return Row(
  // children: [
    
    // Main Content
    // Expanded(
    //   flex: 1, // Reduced to 50% width (you can adjust the value further)
    //   child:
  return    ScrollConfiguration(
  behavior: const ScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.trackpad,
    },
  ),
  child: SingleChildScrollView(
    physics: const ClampingScrollPhysics(),
    child: Column(
      children: [ Stack(
        children: [
          
          // Padding(
          //   child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
  width: double.infinity,color: Colors.white,
  height: 96,
  padding: 
  isMobile
      ? EdgeInsets.zero
      : 
      const EdgeInsets.fromLTRB(64, 24, 344, 24),
  child: const App_bar(),
),
          SizedBox(height: 16),
          // Expanded(


            // child:
            // Container(
            //   decoration: BoxDecoration(
            //     // color: Colors.white,
            //     // boxShadow: [BoxShadow(
            //     //   color: Colors.black.withOpacity(0.05), 
            //     //   offset: Offset(0, 3), 
            //     //   blurRadius: 13, 
            //     //   spreadRadius: 0, 
            //     // ),]
            //   ),
              // child:
               Container( height: 860,//width: 1007,
width: 1031,
              margin: const EdgeInsets.symmetric(horizontal: 100),
         decoration:  BoxDecoration(  
          
           color:  Colors.white,
              // elevation: 3,
                borderRadius: BorderRadius.circular(16),
                
                ),
              child:
               Padding(
                padding: const EdgeInsets.all(16.0),
//                 ,
                child:
                Column(
                  
                  children: [
            // child:
              _buildHeader2(),       SizedBox(height: 5,),
 _buildHeader(context), 
                // Container(
                // width: 1031,
                // decoration: BoxDecoration(   
                //   color: Colors.white,borderRadius: BorderRadius.circular(16)),
                isMobile? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:    
                   Container(
            // margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 95,width: 1007,padding:isMobile?EdgeInsets.zero: EdgeInsets.fromLTRB(24, 25, 24, 25),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
           
           
               child: Row(
                spacing:isMobile?0: 10,
              // alignment:isMobile? WrapAlignment.center:WrapAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.asset('icons/Frame6.png', width: 26, height: 23),
                       
                // Text('   '),
            
               
                Wrap(
                  children: [
                    Text(
                      'سعر الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              
                Wrap(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:  Text(
                      'اجمالي الدرجه',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'تاريخ بدا الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                
                Wrap(
                  children: [
                    Text(
                      'مكان الامتحان ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'مده الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'نوع الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              ],
            ),)
          ,  ):          Container(
            // margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 95,width: 1007,padding:isMobile?EdgeInsets.zero: EdgeInsets.fromLTRB(24, 25, 24, 25),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
           
           
               child: Wrap(
                spacing:isMobile?0: 10,
              alignment:isMobile? WrapAlignment.center:WrapAlignment.spaceBetween,
              
              children: [
                // Image.asset('icons/Frame6.png', width: 26, height: 23),
                       
                // Text('   '),
            
               
                Wrap(
                  children: [
                    Text(
                      'سعر الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              
                Wrap(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:  Text(
                      'اجمالي الدرجه',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'تاريخ بدا الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                
                Wrap(
                  children: [
                    Text(
                      'مكان الامتحان ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'مده الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'نوع الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              ],
            ),)
          ,  
                    // _buildList(controller),
                // child: Column(children: [
                      // SizedBox(height: 10,), 
               
                SizedBox(height: 10,),
              // _buildHeader2(),       SizedBox(height: 5,),
                  // _buildHeader(context),
                   _buildList(controller,isMobile),
                            ]), ),  
                           
    ),            
                                                     Container(
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
           
                  controller.exampagination(//context,
                  page:controller.currentPage);
          controller.update();
            }
          },
          child: Container(
            width: 95,
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset('icons/arrow-left.png', width: 20, height: 20,color:controller.currentPage > 1 ? Colors.blue : Colors.black,
                   ) ,  const SizedBox(width: 4), Text(
                  'السابق',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,color: controller.currentPage > 1 ? Colors.blue : Colors.black,
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
            children: _buildPageNumbers(controller,context),
          ),
        ),

        GestureDetector(
          onTap: () {
            if (controller.currentPage < controller.totalPages) {
              controller.currentPage++;
            controller.exampagination(//context,
            page:controller.currentPage);
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
                ),    const SizedBox(width: 4),  Image.asset('icons/Icon.png', width: 20, height: 20,color:
                 controller.currentPage < controller.totalPages
                  ? Colors.blue
                  : Colors.black,),
            
              ],
            ),
          ),
        ),

   ],
    ),
  )
                                            
             
          ],),
                  // SizedBox(height: 10),
                      
                    // _buildPagination(controller),
                //   ],
                // ),
              // ),
            // ),//),
          // ),
      //   ],
      // ),
    // ),
(isMobile&&controller.isoptionselect)||(istablet&&controller.isoptionselecttablet)||(!isMobile&&!istablet)
?Positioned(
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
          )
  :Container()
   
   
  ],
),//])
          // , 

     ])));
        },
      ),
    );
  }

  Widget _buildHeader(context) {
    return // Positioned(top: 0,bottom: 50,child: 
     Container(
     
     
      decoration:BoxDecoration(
        
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight:Radius.circular(16) ,topLeft: Radius.circular(16)),
       ),
      height: 40,
      width: 1007,
      // padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
     
       
          ElevatedButton(
            onPressed: () {
      showDialog(context: context, builder: (BuildContext context ){
return Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment:MainAxisAlignment.center,
  children: [ 
    
Expanded(
  child: DialogWrapper(),
),]);
      });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color.fromARGB(206, 6, 69, 152)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child:Container(height: 40,child:  Row(
              children: [
                Text(
                  'أضف المحاضره',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromARGB(206, 6, 69, 152),
                  ),
                ),
                SizedBox(width: 4),
                Image.asset('icons/add-square.png',height: 24,width: 24,)
              ],
            ),)
          ),
          Text(
            'الامتحنات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ],
      )//,)
    );
  }
  Widget _buildHeader2() {
    return Container(
     
      height: 40,
      width: 1007,
      // padding: const EdgeInsets.symmetric(horizontal: 16,),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
     
       
         Container(
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.only(topLeft:Radius.circular(4),bottomLeft:Radius.circular(4) ),
            color: Color.fromARGB(255, 235, 239, 249)),
          child:Row(children: [
           Container(
            decoration: BoxDecoration(color:clicked? const Color.fromARGB(255, 235, 239, 249):
            
             Color.fromARGB(155, 6, 69, 152)     ,borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 11),
            child:InkWell(child:  Row(children: [  
              
              
              Text('امتحان في السنتر',style: TextStyle(color:clicked?
 Color.fromARGB(155, 6, 69, 152):Color.fromARGB(255, 235, 239, 249)
             ),textAlign: TextAlign.right,)
         ,     Image.asset('assets/Frame (2).png',width: 30,height: 30,)
              
              ],),
            
 onTap: (){
  setState(() {
    clicked=!clicked;
   
    
  });
 },           )
,
),
          Container(
            decoration: BoxDecoration(color:clicked?  
             Color.fromARGB(155, 6, 69, 152)
            : Color.fromARGB(255, 235, 239, 249),borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 11),
            child:   InkWell(child: Row(children: [  
              
            
              Text('امتحان اونلاين',style: TextStyle(color:clicked? Colors.white:Color.fromARGB(155, 6, 69, 152)),textAlign: TextAlign.right,)
         ,     Image.asset('assets/Frame (1).png',width: 30,height: 30,)
              
              ],),onTap: (){
                setState(() {
                   clicked=!clicked;
                });
Navigator.push(context, MaterialPageRoute(builder: (context)=>Onlinequizes()));


                },)
            
            ),
         

         ],))
          
        ],
      ),
    );
  }

  Widget _buildList(HomeController controller,isMobile) {
    return Expanded(
      child:
      
   ListView.builder(shrinkWrap: true,
  itemCount: controller.Exams.length,
  itemBuilder: (context, index) {
       DateTime startDateTime = DateTime.parse(controller.Exams[index].startdate.toString());
int day = startDateTime.day; 
int year = startDateTime.year; 
int month= startDateTime.month; 
List<String> arabicMonths = [
  "", 
  "يناير", // 1
  "فبراير", // 2
  "مارس", // 3
  "أبريل", // 4
  "مايو", // 5
  "يونيو", // 6
  "يوليو", // 7
  "أغسطس", // 8
  "سبتمبر", // 9
  "أكتوبر", // 10
  "نوفمبر", // 11
  "ديسمبر", // 12
];
String arabicMonth = arabicMonths[startDateTime.month];
String monthName = DateFormat('MMMM').format(startDateTime);
    final exam = controller.Exams[index];
    return isMobile?SingleChildScrollView
    (
      scrollDirection: Axis.horizontal,
      child: 
        Container(
      width: 1008,
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 25),
      height: 95,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 3),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
  
                  PopupMenuButton<String>(
 color: Colors.white,
borderRadius: BorderRadius.circular(8),
  onSelected: (value) {
    if (value == 'close') {
      print('اغلق السؤال selected');
    } else if (value == 'delete') {
      print('مسح السؤال selected');
    }
  },
  itemBuilder: (BuildContext context) => [
    PopupMenuItem(
      value: 'close',
      child: Container(
        width: 151, 
        height: 75, 
        child: Center( 
          child: Text('اغلق السؤال' ,
          style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    ),
    PopupMenuItem(
      value: 'delete',
      child: Container(
        width: 151,
        height: 75,
        child: Center(
          child: Text('مسح السؤال',style: 
          TextStyle(color: Colors.red),),
        ),
      ),
      onTap: () {
     controller.   deleteexam(exam.id.toString(),context
     );
        // controller.deletesection(item.id.toString());
controller.update();
controller.
 exampagination(//context
 );

      },
    
            ),
          ],
           child: Image.asset(
          'icons/Group 37966.png'
           ,width: 26,height: 6,), ),
          Row(
            children: [
              // const Text('جنيه', style: TextStyle(fontSize: 16)),
              Text(
                exam.examprice.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
               day.toString()+"-"+year.toString()+"-"+arabicMonth.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ),
            ],
          ),
      
          Row(
            children: [
              const Text('', style: TextStyle(fontSize: 16)),
              Text(
                'سنتر${exam.examplace.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('دقيقة', style: TextStyle(fontSize: 16)),
              Text(
                exam.durationmin.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                exam.exam_name??"",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 4),
              Image.asset('icons/✏️ Digit.png', width: 24, height: 24),
            ],
          ),
        ],
      ),
    ) 
 
    ,):
     Container(
      width: 1008,
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 25),
      height: 95,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 3),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
  
                  PopupMenuButton<String>(
 color: Colors.white,
borderRadius: BorderRadius.circular(8),
  onSelected: (value) {
    if (value == 'close') {
      print('اغلق السؤال selected');
    } else if (value == 'delete') {
      print('مسح السؤال selected');
    }
  },
  itemBuilder: (BuildContext context) => [
    PopupMenuItem(
      value: 'close',
      child: Container(
        width: 151, 
        height: 75, 
        child: Center( 
          child: Text('اغلق السؤال' ,
          style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    ),
    PopupMenuItem(
      value: 'delete',
      child: Container(
        width: 151,
        height: 75,
        child: Center(
          child: Text('مسح السؤال',style: 
          TextStyle(color: Colors.red),),
        ),
      ),
      onTap: () {
     controller.   deleteexam(exam.id.toString(),context
     );
        // controller.deletesection(item.id.toString());
controller.update();
controller.
 exampagination(//context
 );

      },
    
            ),
          ],
           child: Image.asset(
          'icons/Group 37966.png'
           ,width: 26,height: 6,), ),
          Row(
            children: [
              // const Text('جنيه', style: TextStyle(fontSize: 16)),
              Text(
                exam.examprice.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
               day.toString()+"-"+year.toString()+"-"+arabicMonth.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ),
            ],
          ),
      
          Row(
            children: [
              const Text('', style: TextStyle(fontSize: 16)),
              Text(
                'سنتر${exam.examplace.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('دقيقة', style: TextStyle(fontSize: 16)),
              Text(
                exam.durationmin.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                exam.exam_name??"",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 4),
              Image.asset('icons/✏️ Digit.png', width: 24, height: 24),
            ],
          ),
        ],
      ),
    ) ;
  },
)
    );
  }

  Widget _buildPagination(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.totalPages, (index) {
        final pageIndex = index + 1;
        return GestureDetector(
          onTap: () {
            controller.currentPage = pageIndex;
            controller.exampagination(//context,
            page:controller.currentPage);
            controller.update();
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: pageIndex 
              == controller.currentPage
                  ? Colors.blue
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$pageIndex',
              style: TextStyle(
                color: pageIndex == controller.currentPage
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }



  bool isToggled = false;

  void toggle() {
  
      isToggled = !isToggled;

  }

  // @override
  // Widget build(BuildContext context) {
  //   return 
  // }
// }

}
List<Widget> _buildPageNumbers(HomeController controller,context) {
  final currentPage = controller.currentPage;
  final totalPages = controller.totalPages;
  final List<Widget> pages = [];

  void addPage(int page, context) {
    pages.add(
      GestureDetector(
        onTap: () {
          controller.currentPage = page;
            controller.exampagination(//context,
            page:controller.currentPage);
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
      addPage(i,context);
    }
  } else {
    for (int i = 1; i <= 3; i++) {
      addPage(i,context);
    }

    if (currentPage > 4 && currentPage < totalPages - 3) {
      pages.add(const SizedBox(
        width: 40,
        height: 40,
        child: Center(child: Text('...')),
      ));

      addPage(currentPage,context);

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
      addPage(i,context);
    }
  }

  return pages;
}
