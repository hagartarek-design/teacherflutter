import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/home_view.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui' as ui;
// class Settings extends StatelessWidget {
//   const Settings({super.key});
class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _Logout();
}

class _Logout extends State<LogOut> {
 HomeController homeController =HomeController();
bool isWhiteBackground = false;
  void handleLogout(BuildContext context) async {
    // bool success = await homeController.logout();

    // if (success) {
    //   print('object');
    //   // Fluttertoast.showToast(msg: "Logout Successful");
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => HomeView()),
    //   );
    // } else { print('ll');
    //   // Fluttertoast.showToast(msg: "Logout Failed");
    // }
  }

  @override
  Widget build(BuildContext context) {
  bool switchValue = true;      double screenWidth = MediaQuery.of(context).size.width;
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
    double containerWidth = screenWidth * 0.25; // Adjust to 25% of screen width
    double containerHeight =
        screenHeight * 0.15; // Adjust to 15% of screen height
    double gap = screenWidth * 0.03;
    // Responsive dimensions
    
    double responsiveWidth = screenWidth * 0.7; // 70% of the screen width
    double responsiveHeight = screenHeight * 0.15; // 15% of the screen height
    double responsiveGap = screenHeight * 0.03;
    // Define breakpoints for responsiveness
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
               Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //  mainAxisAlignment:MainAxisAlignment .spaceBetween,
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
                                vertical: 24
                      ),
                      child: App_bar(),
                    ),

     
          Center(
          child: Container(  width: 1031,
          height: 426,margin: EdgeInsets.fromLTRB(40, 48, 40, 48),
             decoration:BoxDecoration(color: Colors.white)
         , child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [ 
        Container(
          width: 951,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ Text('تسجيل خروج',textAlign: TextAlign.right,
        style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600),
        )])),
       Center(child:  Container(width: 561,//height: 266
      //  ,
       decoration: BoxDecoration(
        border: Border.all(width: 1,
        color: 
        Color.fromARGB(255, 154, 175, 228)) ,)
        ,padding: EdgeInsets.fromLTRB(86, 24, 86, 24)
       ,child:Column(children: [ Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/Group (2).png',height: 94,width: 94,)],),
       Container(width: 389,
       child: Column(
   spacing: 12,
        children: [
Text('اهلا عمرو سمير !!!!',style: TextStyle(
  color: Color.fromARGB(255, 6, 69, 152),
  fontSize: 32,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
,Text('أنت متأكد أنك عايز تسجيل خروج؟',style: TextStyle(
  color: Color.fromARGB(255, 6, 69, 152),
  fontSize: 16,fontWeight: FontWeight.w500),
  textAlign: TextAlign.center,),
  
 Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
     Container(
  width: 173,height: 44,
  child:   TextButton(onPressed: (){},
   child: Text('لا' ,
   style: TextStyle(
    color: Color.fromARGB(255, 6, 69, 152) ),)
 , style: TextButton.styleFrom(
shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)

) ,side:BorderSide(width: 1,color: Color.fromARGB(255, 6, 69, 152)),
  backgroundColor: Colors.white
 ),)),
 Container( width: 173,height: 44,child: TextButton(onPressed: (){

  handleLogout(context);
 }, child: Text('تسجيل الخروج',style: TextStyle(color: Colors.white),)
 , style: TextButton.styleFrom(
shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)

) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)
 ),),),

 ]
  )     ],),
       )
         ])),)
          ])
             ))]))),
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
      

      