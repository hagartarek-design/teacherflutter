import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart' show HomeController;
import 'package:get/get.dart';

class Notificationdialog extends StatefulWidget {
  const Notificationdialog({super.key});

  @override
  State<Notificationdialog> createState() => _NotificationdialogState();
}

class _NotificationdialogState extends State<Notificationdialog> {
 
   Widget _buildButtonmain({
  // required String text,
  required   icon,
  required String route,
  bool isActive = false,
}) {
  final HomeController controller = Get.find<HomeController>();
  
  return SizedBox(
    width: 24.0,
    height: 24.0,
    child: InkWell(
      // style: ElevatedButton.styleFrom(
      //   // backgroundColor: isActive ?Colors.white: Color.fromARGB(235, 6, 69, 152),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(14),
      //   ),
      // ),
      onTap: () {
        Get.back();
        controller.smartNavigate(route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         
        icon
          // Image.asset('$icon', color: isActive ? Colors.blue[900] : Color.fromARGB(181, 154, 175, 228),),
        ],
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Dialog(child:  Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white,),
    width: 592,height: 551,
    child:Column(children: [
      Container(width: 592,height: 439,decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(16),topRight:Radius.circular(16))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
      children: [
      Container(width: 592,padding:
       EdgeInsets.fromLTRB(16, 20, 24, 20)
      ,decoration: BoxDecoration(borderRadius: 
      BorderRadius.only(topLeft: Radius.circular(8)
      ,topRight: Radius.circular(8)
      
      
      )
      ,color: Color.fromARGB(255, 212, 221, 232)
      ),
      child: Column(children: [

        Container(width: 552,
        height: 24,child: Column(
          spacing: 5,
          children: [
Row(children:[
  _buildButtonmain(   icon:          
                       Image.asset('assets/close-circl.png', width: 24, height: 24),

                      route: '/quizes'
                      ,  isActive: Get.currentRoute == '/quizes',
                      ),
  _buildButtonmain(   icon:          
                       Image.asset('assets/Vector.png', width: 24, height: 24),

                      route: '/quizes'
                      ,  isActive: Get.currentRoute == '/quizes',
                      )

])         
        ],),),
        Container(
          width: 552,//height: 40,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [Text('اشعار جديد',style: TextStyle(fontSize: 32,
        fontWeight: FontWeight.w600,color: Color.fromARGB(255, 6, 69, 152)),)],), )
      ,
   
      ],),
      )
      , 
      
      Container(width: 592,height: 80,
      child:
     Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
Container(
  // color: Colors.amber,
  width: 524,
  child: 
      TextField(
        decoration: InputDecoration(
          
          border:UnderlineInputBorder(borderSide: BorderSide.none)),textDirection: TextDirection.rtl,
        ))
     ,
     Text('الى',style: TextStyle(fontSize: 20,fontWeight:  FontWeight.w500,color: Color.fromARGB(255, 6, 69, 152)
     ),) 
   
    ]
    )
    
      )
      // ,Container(width: 592,height: 321,padding: EdgeInsets.all(10),
      // child: Column(
      //   spacing: 10,
      //   children: [],),)
,    
      ],
      ),
      )
   , Container(
        width: 592,height: 112,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(16),
       
       
        child: Row(
          
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(width: 80,height: 80, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 6, 69, 152)),
        child: 
      Image.asset('assets/Frame 1597883506.png',width: 38,height: 38,)  ),         Container(width: 464,height: 80,
          decoration: BoxDecoration(borderRadius: 
          BorderRadius.circular(16),color: 
          Color.fromARGB(255, 236, 238, 241),),
          
child:   Container( width: 463,height: 30,
          padding: EdgeInsets.only(right: 24,left: 24)
          , child:Row(crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [ 
 
           Container(width: 122,height: 30,child: Row(
            spacing: 16,
            children: [
              Image.asset('assets/fluent_emoji-laugh-16-regular.png',height: 30,width: 30,),
              Image.asset('assets/ant-design_paper-clip-outlined (1).png',height: 30,width: 30,),
              Image.asset('assets/image (1).png',height: 30,width: 30,)
            ],),),
           Container(width: 136,child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 2,
            children: [Container(width: 104,height:20 ,child: TextField(
decoration: InputDecoration(
  border: UnderlineInputBorder(borderSide: BorderSide.none),
hintText:'اكتب اشعارك هنا',hintStyle: 
 TextStyle(fontWeight: FontWeight.w300,fontSize: 16),
 
),textDirection: TextDirection.rtl,
            )
),
Image.asset('assets/ant-design_paper-clip-outlined (1).png',height: 30,width: 30,)
        
            ],),)
          ],) ,),

          )
          ],),)  ],)
    
    ));
  }
}