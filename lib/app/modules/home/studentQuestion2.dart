import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';


class studentQuestion2 extends StatelessWidget {
  // const studentQuestion2({super.key});
  final  studentsId;
  final  text;
  const studentQuestion2({super.key,
  required this.studentsId
  ,required this.text
  });

 

  @override
  Widget build(BuildContext context) {
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
              Expanded(child:
               Row(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
Container(
margin: EdgeInsets.only(top: 120,left: 64,),
  width: 1032,height: 857,padding: EdgeInsets.fromLTRB(12, 40, 12, 40),

  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
 color: Colors.white ),
  child: 
Column(
  spacing: 10,
  children: [ Row(children: [
Container(width: 980,height: 777,child: Column(
 spacing: 27, 
 children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
Container( width: 757,height: 777,
decoration: BoxDecoration(
  // color: Colors.red
  ),
child:  Column(
  spacing: 24,
  children: [ Container(width: 757,height: 315,
decoration: BoxDecoration(
  // color: Colors.blue
  )
,child:Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [ Container(width:757 ,height: 76, decoration:BoxDecoration( //color:Colors.yellow,


),
child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.end,
  children: [
Text('اختار الدرس',textDirection: TextDirection.rtl,textAlign: TextAlign.right,
style: TextStyle(fontSize: 16,
fontWeight: FontWeight.w500,
color: Color.
fromARGB(255, 181, 181, 181)),)
,TextField(
  decoration: InputDecoration(
    hintText: 'الذرة'
    ,  border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),hintTextDirection: TextDirection.rtl
  ),textDirection: TextDirection.rtl,
)

])


),

Text('اسال سوالك',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textDirection: TextDirection.rtl,

),Container(
  width: 757,height: 199,
  child: 
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [

  Container(
    height: 183,width: 757,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

      Container(    height: 183,width: 757,
  //        keyboardType: TextInputType.multiline,
  // minLines: 4,
  // maxLines: 8, 
      decoration: BoxDecoration(  
      border: Border.all(width: 1),),
      
        child: Text('${text}'),
      //   contentPadding: EdgeInsets.all(20.0),
      //    hintText: ' امبيرشرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة اح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة شرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة شرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة التشرح لماذا سميت وحدة قياس شدة الت'
      // ,hintStyle: TextStyle(fontWeight:FontWeight.w400,fontSize:16),hintTextDirection: TextDirection.rtl,
      // )
      ) 
    ],)) 
    
],)),

])
,) 
,
Container(width:757,
child: Column(spacing: 16,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
 Text('اجابه المدرس',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),) ,
Container(width: 757,height: 338
,decoration:BoxDecoration(border: 
Border.all(width: 1,color:
 Color.fromARGB(255, 195, 202, 210)),
borderRadius: BorderRadius.circular(8)) 
,child: Column(children: [
 Container(
  width: 725,
  child:   TextField(
   controller: controller.teacher_answer,      keyboardType: TextInputType.multiline,
  minLines: 9,
  maxLines: 9, textDirection: TextDirection.rtl,
        decoration:InputDecoration(
     border:  OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
        contentPadding: EdgeInsets.all(20.0),
         hintText: 'ادخل السوال',hintTextDirection: TextDirection.rtl
      ))),
   Container(
    width: 725,
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [  Text('500')])
)],),)

, Container(
  width:757 ,height: 44,
  child: 
 TextButton(
  
  style: TextButton.styleFrom(
    shape:RoundedRectangleBorder( borderRadius:BorderRadius.circular(8)),
    backgroundColor: Color.fromARGB(255, 6, 69, 152),

  ),
  onPressed: (){
controller.  addanswer(studentsId,context
);
  }, child: Text('رد علي السؤال',style: TextStyle(color: Colors.white),))
)
],),
)

],)
,),
Container(height: 777,child:
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Container(
  width: 196,
  child: 
Row(mainAxisAlignment: MainAxisAlignment.end, 

// crossAxisAlignment: CrossAxisAlignment.start,
children: [
 Container(
  //width: 117, 
 child:  Column(
  mainAxisAlignment: MainAxisAlignment.start,
    // spacing: 8,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.start,
        children: [
Text("اسم العميل",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.w500,
fontSize: 14),)
,Container(
  // width: 117,
  child:Text('+(02)1156463445',style: TextStyle(
  color:Color.fromARGB(255, 140, 140, 140) ,
  fontWeight: FontWeight.w400,
fontSize: 15)))

    ],) ]))
,
   Container(
                        width: 71,
                        height: 71,
                        child: CircleAvatar(
                          
                          radius: 24,
                          backgroundImage: AssetImage('assets/image 2.png'),
                        ),
                      ),


],))

 ],),

)
])])),

],),

])),

                  ],)]))),   if (!isMobile)
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
                )]));
     
     
     }));}
  
     }
      

      