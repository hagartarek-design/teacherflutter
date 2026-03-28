import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
  bool switchValue = true;      double screenWidth = MediaQuery.of(context).size.width;

    
  
    
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

     
          Center(
          child: Container(  width: 1032,
          height: 979,margin: EdgeInsets.all(10),
             decoration:BoxDecoration(color: Colors.white)
             ,child:Container(width: 1008,height: 979,
             padding: EdgeInsets.fromLTRB(0, 40, 0,0)
             ,child:Column(
              spacing: 18,
              children: [
              Container(
              width: 1008,  
              child: 
              Text('الاعدادات',style: TextStyle(
              fontWeight: FontWeight.w600,fontSize: 32,)
              ,textAlign: TextAlign.right,)
             )
            ,
             Container( width: 1008,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
            Container(
               child:Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
           Container(
            
                                width: 54.42,
                                height: 33,
                                // padding: EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(6, 70, 152, 1),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(58),
                                ),
                                child:
                                 CupertinoSwitch(
                                  value: switchValue,
                                  activeColor: const Color.fromARGB(255, 255, 255, 255),
                                  trackColor: CupertinoColors.transparent,
                                  thumbColor: const Color.fromARGB(255, 242, 195, 42),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      switchValue = value ?? false;
                                    });
                                  },
                                ),
          ) 
     
          
           ])),SizedBox(width: 10,),  Text('الاشعارات',textAlign: TextAlign.right,
             style:TextStyle(
              
              fontWeight: FontWeight.w600 ,color: const Color.fromARGB(255, 6, 69, 152),
             
             fontSize: 32) ),  
             ])) ,
          Container(width:1008,child: Column(
          spacing: 24, mainAxisAlignment: MainAxisAlignment.end, 
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Text('تغير كلمة المرور' ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24
            ,color: const Color.fromARGB(255, 6, 69, 152)
            ),textAlign: TextAlign.right,
            
            )
              
          ],),) ,  Container(width:960,
          child: Column(
          spacing: 24, mainAxisAlignment: MainAxisAlignment.end, 
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Container( width: 457,child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [   Text('كلمة المرور القديمه' ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16
           
            ),textAlign: TextAlign.right,
            
            ),
         
             
            TextField(textDirection: ui.TextDirection.rtl,

            controller: controller.oldPasswordcontroller,
            decoration: InputDecoration( border:OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 195, 202, 210)))
        ,  hintText: '***********',hintTextDirection: ui. TextDirection.rtl
            )
            )
          ]))
         , Container( width: 457,child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [   Text('كلمة المرور القديمه' ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16
           
            ),textAlign: TextAlign.right,
            
            ),
         
             
            TextField(textDirection: ui.TextDirection.rtl,controller: controller.oldPasswordcontroller,
            decoration: InputDecoration( border:OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 195, 202, 210)))
        ,  hintText: '***********',hintTextDirection: ui. TextDirection.rtl
            )
            )
          ]))
          ,Container( width: 457,child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [   Text('كلمة المرور القديمه' ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16
           
            ),textAlign: TextAlign.right,
            
            ),
         
             
            TextField(textDirection: ui.TextDirection.rtl,controller: controller.newPasswordcontroller,
            decoration: InputDecoration( border:OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 195, 202, 210)))
        ,  hintText: '***********',hintTextDirection: ui. TextDirection.rtl
            )
            )
          ])),

          Container(
            width: 220,height: 44,
            child: 
        TextButton(
          style: TextButton.styleFrom(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),) ,
            backgroundColor: Color.fromARGB(255, 6, 69, 152)),
          onPressed: (){
controller.updatePasword(context
);

          }, child: Text('حفظ',style: TextStyle(color: Colors.white),))
        
           ) ],),)      
           ,Container
           (
            height: 164,
            child:Container(
              width: 1008,padding:EdgeInsets.all(24) ,
              child: Column(
                
                // mainAxisAlignment: MainAxisAlignment.end
                // ,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [ 
                Text(
                'تغير اللغه', 
              textAlign: TextAlign.right,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500
             , color: Color.fromARGB(255, 6, 69, 152)
              ),
              )  ,Container(height: 76, width: 457,child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [   Text('كلمة المرور القديمه' ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16
           
            ),textAlign: TextAlign.right,
            
            ),
         
             
            TextField(textDirection: ui.TextDirection.rtl,
            decoration: InputDecoration( border:OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 195, 202, 210)))
        ,  hintText: '***********',hintTextDirection: ui. TextDirection.rtl
            )
            )
          ])
          
          
          )   ])) ,
             )
           ,Container
           ( 
            height: 171,
            child:Container(
              width: 1008,padding:EdgeInsets.all(24) ,
              child: Column(
             spacing: 24,   
                // mainAxisAlignment: MainAxisAlignment.end
                // ,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [ 
           Container(
            
            width: 1008,
            child:  Text(
                'مسح الحساب', 
              textAlign: TextAlign.right,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500
             , color: Color.fromARGB(255, 222, 61, 49) 
              ),
              ) ,),
              Container(
                
            width: 960,
            child:Column(
      crossAxisAlignment: CrossAxisAlignment.end,
              children: [
        TextButton(
          style: TextButton.styleFrom(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),) ,
            backgroundColor: Color.fromARGB(255, 6, 69, 152)),
          onPressed: (){controller.deleteaccount(context
          );}, child: Text('مسح الحساب',style: TextStyle(color: Colors.white),))
        
                 ,
           TextButton(onPressed: (){}, child:
           Text('احنا زعلانين لمغاده حسابك نتمني نشوفك تاني !!'
           ,style: TextStyle(fontSize: 14,
           fontWeight: FontWeight.w400,
           color: Color.fromARGB(255, 80, 124, 181)),
           textAlign: TextAlign.right,
           ))
         
             
          
          
          
          
             ]) ,
             )
            
                    ])          ,
               ))]))))]))),
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
      

      