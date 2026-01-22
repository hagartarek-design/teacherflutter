
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/%D8%A7%D8%AF%D8%A7%D8%B1%D8%A9%20%D8%A7%D9%84%D8%B3%D9%86%D8%AA%D8%B1.dart';
import 'package:flutterwallet/app/modules/home/views/assignments.dart';
import 'package:flutterwallet/app/modules/home/views/home_view.dart';
import 'package:flutterwallet/app/modules/home/views/Quizes.dart';
import 'package:flutterwallet/app/modules/home/views/lectures.dart';
import 'package:flutterwallet/app/modules/home/views/logoutScreen.dart';
import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:flutterwallet/app/modules/home/views/sections.dart';
import 'package:flutterwallet/app/modules/home/views/settings.dart';
import 'package:flutterwallet/app/modules/home/views/students.dart';
import 'package:flutterwallet/app/modules/home/views/table.dart';
import 'package:get/get.dart';
import 'package:flutterwallet/app/modules/home/views/notifications.dart';
import 'package:flutterwallet/app/modules/home/views/students_questions.dart';

class rightbar extends StatefulWidget {
  const rightbar({super.key});

  @override
  State<rightbar> createState() => _rightbarState();
}

bool clicked = false;
bool sections = false;
bool assignments = false;
bool onlinestudents = false;
bool students = false;
bool home = false;
bool tables = false;
bool bankques = false;
bool centermanage=false;
bool studentsques=false;
bool notifications=false;
bool settings=false;
bool orders=false;
bool logout=false;
class _rightbarState extends State<rightbar> {
                          // HomeController controller=HomeController();
  HomeController homeController = HomeController();
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
    // } else {
    //   print('ll');
    //   // Fluttertoast.showToast(msg: "Logout Failed");
    // }
  }

  @override
  Widget build(BuildContext context) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sidebar Header
        // Container(
        //   // height: 100,
        //   // padding: EdgeInsets.all(16),
        //   child: Row(
        //     children: [

        // SizedBox(width: 16),
        Container(
          width: 280, height: 157,
          child: Image.asset(
            '3lmnasa.png',
            height: 118,
            width: 153.11,
          ),
          //     )
          //     // Text(
          //     //   'Username',
          //     //   style: TextStyle(
          //     //     fontSize: 20,
          //     //     color: Colors.white,
          //     //     fontWeight: FontWeight.bold,
          //     //   ),
          //     // ),
          //   ],
          // ),
        ),
        // Divider(color: Colors.white54, thickness: 1),
        // Sidebar Items
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                width: 279.0, height: 1008.0,
                child: Column(children: [
                  Container(
                    width: 279,
                    height: 72,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: // Define this variable in your StatefulWidget

                        SizedBox(
                            width: 247.0,
                            height: 48.0,
                            child: SizedBox(
                              width: 247.0,
                              height: 48.0,
                              child:  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                        home
                                              ? Colors.white
                                              : Color.fromARGB(235, 6, 69, 152),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    onPressed: () {
                                      // homeController
                                      //     .toggleButtonColor();
                                           setState(() {
                                  clicked = false;
 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = true;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=false;
                                           }); 
                                           // Toggle color
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Mainscreen()),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: 
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'الرئيسية',
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            // color:
                                               color: Color.fromARGB(
                                            181, 154, 175, 228),
                                          ),
                                        ), SizedBox(
                                width: 16,
                              ),
                                        Image.asset(
                                          'icons/component.png',
                                          width: 23.71,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: clicked==false
                              ? Color.fromARGB(155, 6, 69, 152)
                              : Color.fromARGB(255, 235, 239, 249),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                       // clicked==false?clicked==true:clicked==false;
              clicked=true;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=false;   // sections ==true?sections==false:sections==true;
                          });
                          Get.to(DashboardScreen());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DashboardScreen()),
                          // );
                          // homeController.fetchDropdownData();
                        },
                        child:
                         Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // TextButton(
                              //   onPressed: () {
                              //     setState(() {
                                    // clicked = true;
                                    // home=false;
                                    // sections = false;
                              //     });
                              //      Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) => DashboardScreen()),
                              //         );
                              //   },
                                // child: 
                                Text( 'المحاضرات',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Color.fromARGB(
                                            181, 154, 175, 228))),
                              // ),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(
                                'icons/Group1.png',
                                width: 24,
                                height: 21.25,
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: sections==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14), // <-- Radius
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          // <-

                          children: [
                            Text('الامتحنات',
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Color.fromARGB(181, 154, 175, 228))),
                            SizedBox(
                              width: 16,
                            ),
                            Image.asset(
                              'icons/Component2.png',
                              width: 17.81,
                              height: 24,
                            )
                          ]),
                      onPressed: () {
           setState(() {
             
            clicked=false;                 sections = true;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=false; 
           });           
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen2()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor:assignments==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249), 
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () => {
                           setState(() {
                         clicked=false;                 sections = false;
 assignments = true;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=false; 
                             
                           }),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Assignments()),
                              )
                            },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('الواجبات',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(
                                'icons/Component3.png',
                                width: 19.06,
                                height: 22.15,
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: students==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () => { 
                          setState(() {
                      clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = true;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=false; 
                          }),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Students()),
                              )
                            },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('الطلاب',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 25 / 14,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(
                                'icons/Group3.png',
                                width: 21.67,
                                height: 22.15,
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                       backgroundColor: tables==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () => {
                        setState(() {
                           clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = true;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=false; 
                        }),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => table()),
                              )
                            },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('جدول',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(
                                'icons/Vector1.png',
                                width: 21.67,
                                height: 22.15,
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                 backgroundColor: bankques==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () => {
                  
                  setState(() {
                     clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = true;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=false; 
                  }),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Lectures()),
                              )
                            },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('بنك الاسالة',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(
                                'icons/Group4.png',
                                width: 22.59,
                                height: 21.98,
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                     
                 backgroundColor: centermanage==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () => {
                        setState(() {
                           clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=true;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=false; 
                        }),
                        
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => managecenter()),
                              )
                              
                            },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('ادارة السنتر',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(
                                'icons/Vector1.png',
                                width: 21.67,
                                height: 22.15,
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
           
                 backgroundColor: studentsques==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () 
                       {   
                  setState(() {
                     clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=true;
 notifications=false;
 settings=false;
 orders=false;
 logout=false; 
                  });
                  
                        controller.fetchQuestions();
                   
                   
                      List<int> studentLengths = homeController.questions
    .map((question) => question.students?.length ?? 0)
    .toList();

                             print('ggggg${studentLengths}');
                              Navigator.push(
                                context,
                              
                                MaterialPageRoute(
                                    builder: (context) => StudentsQuestions(//length:studentLengths.length ,
                                    )),
                              );
                        }
                            ,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('اسالة الطلاب',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(
                                'icons/Vector1.png',
                                width: 21.67,
                                height: 22.15,
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                       backgroundColor: notifications==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: ()  {
                   setState(() {
                      clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=true;
 settings=false;
 orders=false;
 logout=false; 
                   });           Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Notifications()),
                              );
                            },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('الاشعارات',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(
                                'icons/Vector1.png',
                                width: 21.67,
                                height: 22.15,
                              )
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          backgroundColor: settings==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                    setState(() {
                       clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=true;
 orders=false;
 logout=false; 
                    });      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings()));
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('الاعدادات',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              Image.asset(
                                'icons/Vector1.png',
                                width: 21.67,
                                height: 22.15,
                              )
                            ])),
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                        backgroundColor: orders==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                    setState(() {
                       clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=true;
 logout=false; 
                    });      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogOut()));
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('الطلبات',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              Image.asset(
                                'icons/Vector1.png',
                                width: 21.67,
                                height: 22.15,
                              )
                            ])),
                  ),
                  SizedBox(
                    width: 247.0,
                    height: 48.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                       backgroundColor: logout==false
                            ? Color.fromARGB(155, 6, 69, 152)
                            : Color.fromARGB(255, 235, 239, 249),
                          shape: RoundedRectangleBorder(
                            // side: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(14), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          
                          setState(() {
                             clicked=false;                 sections = false;
 assignments = false;
 onlinestudents = false;
 students = false;
 home = false;
 tables = false;
 bankques = false;
 centermanage=false;
 studentsques=false;
 notifications=false;
 settings=false;
 orders=false;
 logout=true; 
                          });
                           handleLogout(context);},

                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('الخروج',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(181, 154, 175, 228))),
                              Image.asset(
                                'icons/Vector1.png',
                                width: 21.67,
                                height: 22.15,
                              )
                            ])),
                  )
               
                ]),

             
              )
            ],
          ),
        ),
      ],
    );
  }
}
