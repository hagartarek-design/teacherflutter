import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:get/get.dart';


class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;

   // Adjust to 15% of screen height
    // Responsive dimensions
    
    bool isMobile = screenWidth <= 768;
    return  Scaffold(backgroundColor: Color.fromARGB(255, 6, 69, 152),
      
      // drawer: isMobile
      //     ? Drawer(
      //         child: ListView(
      //           children: [
      //             DrawerHeader(
      //               decoration: BoxDecoration(color: Colors.blue[900]),
      //               child: Center(
      //                 child: Text(
      //                   'المنصة التعليمية',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 24,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     : null,
            
          body:GetBuilder<HomeController>(init:HomeController() 
    ,builder: (controller){
      return  
      //  Row(
      //       children: [
      //     // Main Content
              Expanded(child:
               Row(
            children: [
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
    

       Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Container(
                      width: 680, // Fixed width
                      height:475, // Responsive height (70% of screen height)
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
                            onPressed: (){}, child: 
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
                      ,  Row(
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
      color: Color(0x0D000000), // Equivalent to #0000000D
      blurRadius: 13,          // Spread of the shadow's blur
      offset: Offset(0, 3),    // Horizontal and vertical shadow offset
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

    Text('اسم السؤال',style: TextStyle(
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
                          ),SizedBox(height: 16,)
                      ],)   , SizedBox(height: 8,)
                      ,  Row(
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
      color: Color(0x0D000000), // Equivalent to #0000000D
      blurRadius: 13,          // Spread of the shadow's blur
      offset: Offset(0, 3),    // Horizontal and vertical shadow offset
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

    Text('اسم السؤال',style: TextStyle(
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
                          ),SizedBox(height: 16,)
                      ],)   ,SizedBox(height: 8,) 
                      ,  Row(
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
      color: Color(0x0D000000), // Equivalent to #0000000D
      blurRadius: 13,          // Spread of the shadow's blur
      offset: Offset(0, 3),    // Horizontal and vertical shadow offset
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

    Text('اسم السؤال',style: TextStyle(
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
                          ),SizedBox(height: 16,)
                      ],)    
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
                Image.asset('icons/add-square.png',width: 40,height: 40,),
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
          // ,SizedBox(height: 8,)
          ,Container( width: 264,color: Color.fromARGB(255, 235, 239, 249),
          padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
          height: 52,child:  Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset('icons/delete.png',width: 24,height: 24,),
        Container(width: 105,child:  Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [  Text('اسم الدرس') ,
            Image.asset('icons/✏️ Digit.png',
            width: 24,height: 24,)
           ]) )])    
                
          ),SizedBox(height: 8,)
          ,Container( width: 264,
          padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
          height: 52,child:  Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset('icons/delete.png',width: 24,height: 24,),
        Container(width: 105,child:  Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [  Text('اسم الدرس') ,
            Image.asset('icons/✏️ Digit.png',
            width: 24,height: 24,)
           ]) )])    
                
          ),SizedBox(height: 8,)
          ,Container( width: 264,
          padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
          height: 52,child:  Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset('icons/delete.png',width: 24,height: 24,),
        Container(width: 105,child:  Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [  Text('اسم الدرس') ,
            Image.asset('icons/✏️ Digit.png',
            width: 24,height: 24,)
           ]) )])    
                
          ),SizedBox(height: 8,)
          ,Container( width: 264,
          padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
          height: 52,child:  Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset('icons/delete.png',width: 24,height: 24,),
        Container(width: 105,child:  Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [  Text('اسم الدرس') ,
            Image.asset('icons/✏️ Digit.png',
            width: 24,height: 24,)
           ]) )])    
                
          ),SizedBox(height: 8,),
 Row(
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
              onPressed: () {},
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
      

      