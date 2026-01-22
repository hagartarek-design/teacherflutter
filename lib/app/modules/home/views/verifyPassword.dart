import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutterwallet/app/google_auth.dart';
import 'package:flutterwallet/app/modules/home/views/Quizes.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/sections.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../controllers/home_controller.dart';

class MyWidget extends StatelessWidget {
   MyWidget({super.key});

 int value = 0;
  String selectedValue = "السنة الدراسية";
  String selectedValue3 = "اسم الكورس";
  HomeController homeController = HomeController();
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
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

 final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: '311774865338-i0eljc50q4qgcosvtdkohbmfgmm10mkc.apps.googleusercontent.com',
    scopes: ['email', 'profile', 'openid'],
  );

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication auth = await account.authentication;
        print("ID Token: ${auth.idToken}");
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }}

    return Scaffold(
      backgroundColor: ui.Color.fromARGB(255, 6, 69, 152),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    width: 960,
                    height: 600,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/Left section (1).png'),
                            ],
                          ),
                        ),
                        Container(
                          width: 480,
                          height: 344,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                             topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              // SizedBox(height: 121),
                           Container(width: 422,height: 88,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
Text('ادخل كود',style: TextStyle(color: 
                    ui.Color.fromARGB(255, 6, 69, 152),
                      fontSize: 32,fontWeight: FontWeight.w600
                    ),textAlign: TextAlign.right,),
Text('ادخل كود التفعيل الموجود فى الرسائل الخاصة بك',style: TextStyle(color: 
                    ui.Color.fromARGB(255, 6, 69, 152),
                      fontSize: 18,fontWeight: FontWeight.w400
                    ),textAlign: TextAlign.right,)
                   
                   
                    ])
                  )
                  ,
                    Container(
                      // color: Colors.blue,
                 width: 422,height: 216,child: 
  
 Container(width: 413,
//  color: Colors.deepOrange,
 child:Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
  children:  [
Container(height: 60,width: 413
,
child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  // mainAxisAlignment: MainAxisAlignment.center,
  children: [
Container(
  width: 62.17,
  height: 60,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      width: 1,
      color: ui.Color.fromARGB(255, 154, 175, 228),
    ),
  ),
  child: Center(
    child: TextField(
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        color: ui.Color.fromARGB(255, 154, 175, 228),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        border: InputBorder.none, 
        contentPadding: EdgeInsets.zero, 
      ),
    ),
  ),
)

,Container(
  width: 62.17,height: 60,
   decoration: BoxDecoration( 
            // color:Color.fromARGB(255, 6, 69, 152)
          //  ,
           borderRadius: BorderRadius.circular(8),
           border: Border.all(width: 1,
          color:ui.Color.fromARGB(255, 154, 175, 228)
         
           )), 
  child:Center(
    child:TextField(
textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        color: ui.Color.fromARGB(255, 154, 175, 228),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        border: InputBorder.none, // 
        contentPadding: EdgeInsets.zero, 
      ),

    )
    ))
,Container(
  width: 62.17,height: 60,
   decoration: BoxDecoration( 
            // color:Color.fromARGB(255, 6, 69, 152)
          //  ,
           borderRadius: BorderRadius.circular(8),
           border: Border.all(width: 1,
           color:ui.Color.fromARGB(255, 154, 175, 228)
         
           )), 
   child:Center(
    child:TextField(
textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        color: ui.Color.fromARGB(255, 154, 175, 228),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        border: InputBorder.none, // 
        contentPadding: EdgeInsets.zero, // 
      ),

    )
  ))
,Container(
  width: 62.17,height: 60,
   decoration: BoxDecoration( 
            // color:Color.fromARGB(255, 6, 69, 152)
          //  ,
           borderRadius: BorderRadius.circular(8),
           border: Border.all(width: 1,
           color: Color.fromARGB(255, 6, 69, 152)
         
           )), 
  child:Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ Text('4',style: TextStyle(
    fontSize: 24,color: Color.fromARGB(255,6,69,152)
    ,fontWeight: FontWeight.w500
    
    ),textAlign: TextAlign.right,),]))
,Container(
  width: 62.17,height: 60,
   decoration: BoxDecoration( 
            // color:Color.fromARGB(255, 6, 69, 152)
          //  ,
           borderRadius: BorderRadius.circular(8),
           border: Border.all(width: 1,
           color: Color.fromARGB(255, 6, 69, 152)
         
           )), 
  child:Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ Text('4',style: TextStyle(
    fontSize: 24,color: Color.fromARGB(255,6,69,152)
    ,fontWeight: FontWeight.w500
    
    ),textAlign: TextAlign.right,),]))
,Container(
  width: 62.17,height: 60,
   decoration: BoxDecoration( 
            // color:Color.fromARGB(255, 6, 69, 152)
          //  ,
           borderRadius: BorderRadius.circular(8),
           border: Border.all(width: 1,
           color: Color.fromARGB(255, 6, 69, 152)
         
           )), 
  child:Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ Text('4',style: TextStyle(
    fontSize: 24,color: Color.fromARGB(255,6,69,152)
    ,fontWeight: FontWeight.w500
    
    ),textAlign: TextAlign.right,),]))

],)
),
Text('59:00',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,),textAlign: TextAlign.right,)
 
 ,
 
Container(
  width: 422,
  height: 80,
child: 
Column(
children: [

Container(
  padding: EdgeInsets.symmetric(horizontal:  14,  ),
  width: 422,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)
  ,boxShadow: [BoxShadow(
      color: Color(0x0D000000), 
      blurRadius: 13,          
      offset: Offset(0, 3),   
    )]
    ,color:ui.Color.fromARGB(255, 6, 69, 152)
  ), height: 44,
    // padding: EdgeInsets.symmetric(horizontal:  14, )
    
  // ,
child: 
  TextButton(
    style: TextButton.styleFrom(
      padding:EdgeInsets.symmetric(horizontal:  14,  ),
     ),
    child:Text('تسجيل دخول',
  style: TextStyle(fontWeight: FontWeight.w500,
  fontSize: 18,color: Colors.white
  ),
  textAlign: TextAlign.right,

  ) ,onPressed: (){

      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen2()),
            )  ;
  },),
 ),SizedBox(height: 16,),
 Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    
Text('اعادة الارسال')
,Image.asset('assets/Group (1).png',height: 20,width: 20),
  Text('لم يصلك الكود؟'),
])],)

)
 ],
 
 
  

 )
 )
 
                  
// child:Column(children: [],)

                    ),
                  // ,SizedBox(height: 16,),
                    Container(
                    
child: Column(children: [

   
  
//   Container( 
    
//     width: 422
//     ,
//     padding: EdgeInsets.symmetric(horizontal:  14,  )
//  , decoration: BoxDecoration(
//   borderRadius: BorderRadius.circular(8),
//   border: Border.all(width: 1 ,color:Color.fromARGB(255, 195, 202, 210))
//    ,color: Colors.white, boxShadow: [
//     BoxShadow(
//     ),
//   ],)
//   ,child: 
  
//  Directionality(
//     textDirection: TextDirection.rtl,
//     child:TextField(
//       textAlignVertical: TextAlignVertical.center,
//       decoration: InputDecoration(
//       border:  InputBorder.none,
      
//     hintText: "**********",
//     hintStyle: TextStyle(
  
//       color:
//     ui.Color.fromARGB(255, 125, 140, 158),
    
    
//     ),  suffixIcon: IconButton(
//       icon: Icon(
//         Icons.visibility,color: const ui.Color.fromARGB(255, 212, 211, 211),
//         // _passwordVisible ? Icons.visibility : Icons.visibility_off,
//       ),
//       onPressed: () {
//         // setState(() {
//           _passwordVisible = !_passwordVisible;
//         // });
//       },
//     ),
//     ))),
// ),

// TextField(
//   obscureText: !_passwordVisible,
//   decoration: InputDecoration(
//    hintText: '************',
  
//   ),
// ),
//  )
SizedBox(height: 16,),

 ],),

                    )
                  ,
             Column(

          children: [
            SizedBox(height: 5,),
          Container(
           width: 422,
            // child: 
           
     
         
          
        
           
                
         ),
        //    Container( width: 422,height: 1,
         
        //   color:Color.fromARGB(255, 6, 69, 152) ,
        //    child:Row(children: [Text('تسجيل دخول عبر',
        //  textAlign: TextAlign.center,
        //  style:TextStyle(color:Color.fromARGB(255, 6, 69, 152)
        //  ,fontWeight: FontWeight.w500,
        //  fontSize: 18
        //  ) ,)],),
           




        //     ),
          ]),        
         SizedBox(height: 16,),
        Container()      ],
                ),
                // color: Colors.red,
                // padding: EdgeInsets.fromLTRB(29, 121, 0, 0),
                // padding: EdgeInsets.fromLTRB(29, 121, 29, 121),
                // child: 
          
      
                                  
                                
                              
                            
                          ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          Positioned(
            top: -119,
            left: -64,
            child: Container(
              width: 811,
              height: 785,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2),
                ),
              ),
              child: Opacity(
                opacity: 0.0,
                child: Image.asset('assets/triangles.png'),
              ),
            ),
          ),
              Positioned(
            width: 1039.83,
            height: 259.96,
            top: 456.27,
            left: -112,
            child: Transform.rotate(
              angle: 45 * (3.1415926535 / 180), 
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                  border: Border.all(
                    width: 2,
                    color: Color.fromRGBO(246, 248, 253, 0.1),
                  ),
                ),child: Image.asset('assets/Vector 1.png'),
              ),
            ),
          ),
    
 Positioned(
            width: 132,
            height: 132,
            top: 72,
            left: -39,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  top: BorderSide(width: 2, color: Color.fromRGBO(246, 248, 253, 0.1)),
                ),
              

              ),
              child: Image.asset('assets/circle.png'),
            ),
          ),
        ],
      ),
    );
  }
}