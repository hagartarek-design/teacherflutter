import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/containe.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
      final ValueNotifier<int> _selectedValue = ValueNotifier<int>(-1);
   String? selectedValue4='Option 1';
        double screenWidth = MediaQuery.of(context).size.width;

    
 
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
      //  Row(
      //       children: [
      //     // Main Content
              Expanded(child:
               Row( mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Expanded(
                child: ScrollConfiguration(
  behavior: const ScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.trackpad,
    },
  ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

Container(
       padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
       
      // padding: EdgeInsets.fromLTRB(504, 120, 0, 0),
        margin: EdgeInsets.only(
                        top: 30,
                        left: 17,
                        bottom: 30,
                        right: 17,
                      ),
      width: 416,height: 979,decoration: BoxDecoration(

      color: Colors.white
,borderRadius:BorderRadius.circular(16)



     ),
     
     child:
Column(
  // crossAxisAlignment: CrossAxisAlignment.center,
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    
    
    
     Row(children: [
 Container(
  width: 137, // Fixed width
  height: 40, 
  
  
  // Hug height (specific value)
  // margin: EdgeInsets.symmetric(horizontal: 16), // Assuming gap means spacing
  // opacity: 0.0, // Opacity should be wrapped inside an Opacity widget
  // child: Opacity(
  //   opacity: 0.0, // 0 means completely invisible
  //   child: Container(
  //     width: 137,
  //     height: 40,
  //     color: Colors.blue,
  //     child:
      child: 
      
      TextButton(
     style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color.fromARGB(206, 6, 69, 152)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        onPressed: (){
showDialog(
  context: context, builder: (context){
  return Expanded(
  child: DialogWrapper(),
);
});
      }, child: 
    Container(width: 137,height: 40,
    // decoration: BoxDecoration(border: Border.all(width: 1 ,color:
    //  Color.fromARGB(255, 6, 69, 152))),
    
    child:    Row(
    
    // mainAxisAlignment: MainAxisAlignment,
    children: [
    
     Text('انشاءاشعار جديد',
    style: 
    TextStyle(
    fontWeight:
    FontWeight.w400,
    fontSize: 14
    ),
    // textAlign: 
    // TextAlign.right,
    ),
        Image.asset('icons/add-square.png',width: 20,height: 20,),
     ])))),SizedBox(width: 32,) ])
              
,SizedBox(height: 16,)
,SizedBox(height: 8,),
Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade100,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 24, 0),
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 245, 245, 245),
                                suffixIcon: Icon(Icons.search),
                                hintText: 'ابحث عن ما تريد',
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        )
          // ,SizedBox(height: 8,)
          ,
        Column(children: [ 
           Column(children: [    
       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
Text('المجموعات',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600 ),textAlign: TextAlign.right,)
       ],)  ])       
         ,Container(
          
          // width: 350,height: 28,
          child: Column(children: [
 Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        
                                         Container(
                                                    width:
                                                        82, // Fixed width (169px)
                                                    height:
                                                        28, // Fixed height (24px)
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                      0,4,0,4
                                                     
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), // Border radius (8px)
                                                      border: Border.all(
                                                        color: Color.fromARGB(255, 181, 181, 181), // Border color (1px blue)
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      // icon: SizedBox(),
                                                      decoration:
                                                          InputDecoration(

                                                        icon:SizedBox(child:  Image.asset(
                                                           'icons/arrow-down2.png',width: 15,height: 20,
                                                            color:
                                                                Colors.black)),
                                                        // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                        labelText:
                                                            'ناجح',
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        border: InputBorder
                                                            .none, // Remove inner borders for better fit
                                                      ),
                                                      value: controller.selectedmonth_by_year,
                                                      items: controller.month_by_year
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                                String>(
                                                            value: value,
                                                            child: Text(value,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      10, // Text size
                                                                  color: Colors
                                                                      .black, // Text color
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold, // Bold text
                                                                )));
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                    controller.selectedmonth_by_year =
                                                            newValue??"";
controller.update();

                                                            // controller.fetchcoursedata3(context,controller.selectedmonth_by_year);
                                                      },
                                                        onTap: ()=>{
                                                        // controller.fetchcoursedata3(context,controller.selectedtype)
                                                        // ,controller.update()
                                                      },
                                                    ),
                                                  ),SizedBox(width: 4,),
                                         Container(
                                                    width:
                                                        82, // Fixed width (169px)
                                                    height:
                                                        28, // Fixed height (24px)
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                      6,4,6,4
                                                    
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), // Border radius (8px)
                                                      border: Border.all(
                                                        color: Color.fromARGB(255, 181, 181, 181)
                                                            , // Border color (1px blue)
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
                                                      // icon: SizedBox(),
                                                      decoration:
                                                          InputDecoration(

                                                        icon:SizedBox(child:  Image.asset(
                                                           'icons/arrow-down2.png',width: 15,height: 20,
                                                            color:
                                                                Colors.black)),
                                                        // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                        labelText:
                                                            'الغياب',
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        border: InputBorder
                                                            .none, // Remove inner borders for better fit
                                                      ),
                                                      value: controller.selectedmonth_by_year,
                                                      items: controller.month_by_year
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                                String>(
                                                            value: value,
                                                            child: Text(value,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      10, // Text size
                                                                  color: Colors
                                                                      .black, // Text color
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold, // Bold text
                                                                )));
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                    controller.selectedmonth_by_year =
                                                            newValue??"";
controller.update();

                                                            // controller.fetchcoursedata3(context,controller.selectedmonth_by_year);
                                                      },
                                                        onTap: ()=>{
                                                        // controller.fetchcoursedata3(context,controller.selectedtype)
                                                        // ,controller.update()
                                                      },
                                                    ),
                                                  ),
          
        ],
      ),
      
  ])),
SizedBox(height: 10,),
  Container(

    width: 352,
    decoration: BoxDecoration(
      border: Border(bottom:
      BorderSide(width: 1,color: Color.fromARGB(255, 181, 181, 181)
      ) ,top:BorderSide(width: 1,color:
       Color.fromARGB(255, 181, 181, 181)) )
    ),
    child:
    
     Column(children: [
    
      ...List.generate(3,(index){
return Column(children: [
  SizedBox(height: 10,),
Container(
  
  padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
  child: 
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(children: [
Image.asset('assets/Frame 1597883506.png',width: 50,height
: 50,) ,SizedBox(width: 2,)
,Column(children: [
  Row(children: [ Text('2023يناير'),Text('15'),]),
  Text('9:30 AM'),
 
],)
],),
Row(children: [
  Text('عباس العقاد'),SizedBox(width: 8,),
Image.asset('icons/✏️ Digit.png',
            width: 24,height: 24,)
],)

]))
       ]);  })
    ],),)
       ,    Column(children: [    
       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
Text('المجموعات',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600 ),textAlign: TextAlign.right,)
       ],)  ])       
         ,Container(
          
          // width: 350,height: 28,
          child: Column(children: [
 Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        
                                         Container(
                                                    width:
                                                        82, // Fixed width (169px)
                                                    height:
                                                        28, // Fixed height (24px)
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                      0,4,0,4
                                                     
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), // Border radius (8px)
                                                      border: Border.all(
                                                        color: Color.fromARGB(255, 181, 181, 181), // Border color (1px blue)
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      // icon: SizedBox(),
                                                      decoration:
                                                          InputDecoration(

                                                        icon:SizedBox(child:  Image.asset(
                                                           'icons/arrow-down2.png',width: 15,height: 20,
                                                            color:
                                                                Colors.black)),
                                                        // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                        labelText:
                                                            'ناجح',
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        border: InputBorder
                                                            .none, // Remove inner borders for better fit
                                                      ),
                                                      value: controller.selectedmonth_by_year,
                                                      items: controller.month_by_year
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                                String>(
                                                            value: value,
                                                            child: Text(value,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      10, // Text size
                                                                  color: Colors
                                                                      .black, // Text color
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold, // Bold text
                                                                )));
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                    controller.selectedmonth_by_year =
                                                            newValue??"";
controller.update();

                                                            // controller.fetchcoursedata3(context,controller.selectedmonth_by_year);
                                                      },
                                                        onTap: ()=>{
                                                        // controller.fetchcoursedata3(context,controller.selectedtype)
                                                        // ,controller.update()
                                                      },
                                                    ),
                                                  ),SizedBox(width: 4,),
                                         Container(
                                                    width:
                                                        82, // Fixed width (169px)
                                                    height:
                                                        28, // Fixed height (24px)
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                      6,4,6,4
                                                    
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), // Border radius (8px)
                                                      border: Border.all(
                                                        color: Color.fromARGB(255, 181, 181, 181)
                                                            , // Border color (1px blue)
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
                                                      // icon: SizedBox(),
                                                      decoration:
                                                          InputDecoration(

                                                        icon:SizedBox(child:  Image.asset(
                                                           'icons/arrow-down2.png',width: 15,height: 20,
                                                            color:
                                                                Colors.black)),
                                                        // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                        labelText:
                                                            'الغياب',
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        border: InputBorder
                                                            .none, // Remove inner borders for better fit
                                                      ),
                                                      value: controller.selectedmonth_by_year,
                                                      items: controller.month_by_year
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                                String>(
                                                            value: value,
                                                            child: Text(value,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      10, // Text size
                                                                  color: Colors
                                                                      .black, // Text color
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold, // Bold text
                                                                )));
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                    controller.selectedmonth_by_year =
                                                            newValue??"";
controller.update();

                                                            // controller.fetchcoursedata3(context,controller.selectedmonth_by_year);
                                                      },
                                                        onTap: ()=>{
                                                        // controller.fetchcoursedata3(context,controller.selectedtype)
                                                        // ,controller.update()
                                                      },
                                                    ),
                                                  ),
          
        ],
      ),
      
  ])),
SizedBox(height: 10,),
  Container(

    width: 352,
    decoration: BoxDecoration(
      border: Border(bottom:
      BorderSide(width: 1,color: Color.fromARGB(255, 181, 181, 181)
      ) ,top:BorderSide(width: 1,color:
       Color.fromARGB(255, 181, 181, 181)) )
    ),
    child:
    
     Column(children: [
           SizedBox(height: 10,),
      ...List.generate(5,(index){
return
Column(children: [
    SizedBox(height: 10,),
Container(
  
  padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
  child: 
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(children: [
Image.asset('assets/Frame 1597883506.png',width: 50,height
: 50,) ,SizedBox(width: 2,)
,Column(children: [
  Row(children: [ Text('2023يناير'),Text('15'),]),
  Text('9:30 AM'),
 
],)
],),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
 
  Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
 Text('اسم العميل',textAlign: TextAlign.end,),
 Text('+(02)1125134370',textAlign: TextAlign.end,)
  ],),SizedBox(width: 8,)
, Container(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          
                          radius: 24,
                          backgroundImage: AssetImage('assets/image 2.png'),
                        ),
                      ),
],)

]))]);
    })
    ],),)
     ]
     
     
     
     
     
     
     )])),
                    Container(
                             margin: EdgeInsets.only(
                        top: 30,
                        left: 17,
                        bottom: 30,
                        right: 17,
                      ),
                      width: 592, // Fixed width
                      height:475, // Responsive height (70% of screen height)
                      // margin: EdgeInsets.only(
                      //   top: 60,
                      //   left: 64,
                      //   bottom: 40,
                      //   right: 40,
                      // ),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // padding: const EdgeInsets.all(24),
                      child: Column(

                        children: [
                          Row(children: [



                          ],),
                    Container(
                      
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      height: 40,width: 592,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                    
    BoxShadow(
      color: Color(0x0D000000), // Equivalent to #0000000D
      blurRadius: 13,          // Spread of the shadow's blur
      offset: Offset(0, 3),    // Horizontal and vertical shadow offset
    ),
  ],),child:    Row(
                          
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
        Row(
        
        children: [

        Container(height: 20,
        child:Row(children: [
          Image.asset('icons/arrowleft.png',height: 24,width: 24,),SizedBox(width: 24,),
         Image.asset('icons/arrowright.png',height: 24,width: 24,),SizedBox(width: 24,),
        ],)
        ),
        Image.asset('icons/Vector 37.png',height: 24,),SizedBox(width: 24,),

       Text('210 من 1-50',style: TextStyle(fontWeight: FontWeight.w500,
       fontSize: 16
       ),textAlign: TextAlign.center,),
SizedBox(width:24 ,),
         Image.asset('icons/Vector 37.png',height: 24,),SizedBox(width: 24,),

        ]),
      Row(
        
        children: [
        Image.asset('icons/Vector 37.png',height: 24,),SizedBox(width: 24,),
        Image.asset('icons/server.png',height: 24,width: 24,),SizedBox(width: 24,),
         Image.asset('icons/book-open.png',height: 24,width: 24,),SizedBox(width: 24,),
         Image.asset('icons/delete.png',height: 24,width: 24,),SizedBox(width: 24,),

         Image.asset('icons/Vector 37.png',height: 24,),SizedBox(width: 24,),
        Container(
          // width: 52,
       child: Row(children: [ 
          DropdownButton<String>(
      value: selectedValue4,
      icon: Image.asset('icons/arrow-down2.png'),
      items: [
        DropdownMenuItem(
          value: 'Option 1',
          child: SizedBox.shrink(), // Empty, no text shown
        ),
        DropdownMenuItem(
          value: 'Option 2',
          child: SizedBox.shrink(), // Empty, no text shown
        ),
        DropdownMenuItem(
          value: 'Option 3',
          child: SizedBox.shrink(), // Empty, no text shown
        ),
      ],
      onChanged: (String? newValue) {
     
          selectedValue4 = newValue;
     
      },
    ),
    // ,SizedBox(width: 12,),
      ValueListenableBuilder<int>(
              valueListenable: _selectedValue,
              builder: (context, selectedValue, child) {
                return Radio<int>(
            fillColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 177, 199, 226)  ),      value: 0,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    _selectedValue.value = value!;
                  },
                  activeColor: selectedValue == 0 ? Colors.blue : Colors.grey,
                
                );
              },
            ),
           
 ],
        
      
    
       ))
  
  ,

  ])
  

  ])),
  SizedBox(height: 6,),
           ...List.generate(3,(index){ return         Row(
mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                    Column(children: [ 
                      
                       Container(
                            width: 592,
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

  Container(width: 592,child:

 Column(
  
  children: [ 



  
     Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
children: [


Container(
 child: Row(


  children: [ 

   Column(children: [
  Row(children: [ Text('2023يناير'),Text('15'),]),
  Text('9:30 AM'),
 
],),
    SizedBox(width: 16,),
   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [ 
    Text('شرح لماذا سميت وحدة قياس شدة التشرح لماذا ياايايتتي'),
    Row(children: [
   Text('عباس العقاد'),
    SizedBox(width: 16,),
  ValueListenableBuilder<int>(
              valueListenable: _selectedValue,
              builder: (context, selectedValue, child) { return Radio<int>(
            fillColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 177, 199, 226)  ),      value: 0,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    _selectedValue.value = value!;
                  },
                  activeColor: selectedValue == 0 ? Colors.blue : Colors.grey,
                
               );} )
    
    ],
),])]))



])
,
                         ]) )     )
                   ,SizedBox(height: 8,)   ])]); }), SizedBox(height: 8,)
                       ,SizedBox(height: 8,) 
                     
,
Container(
  
  decoration: BoxDecoration(color:Colors.white
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
          shape: MaterialStateProperty.all( RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)))
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
     ])),
      ]),
     
          
            
     ])))),
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
      

      