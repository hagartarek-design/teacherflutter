import 'package:flutter/material.dart';

class Showdialogs extends StatefulWidget {
  const Showdialogs({super.key});

  @override
  State<Showdialogs> createState() => _ShowdialogsState();
}

class _ShowdialogsState extends State<Showdialogs> {
  @override
  Widget build(BuildContext context) {


          return AlertDialog(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: Colors.white,

            content:  Container(
            width: 503,height: 297 ,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container( child: Column(
              spacing: 24,
              children: [
              Image.asset('assets/Frame 1597882157.png',width: 80,height: 80,),
              Text('هل تريد ايقاف اشتراك هذا الطالب؟',style
              : TextStyle(fontWeight: FontWeight.w500,fontSize: 24),)
            ],),),
            Container(
              width:342,
              child:
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Container(
                    width: 155,height: 48,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                    ,border: Border.all(width: 1,color:Color.fromARGB(255, 6, 69, 152)
                    
                    ),
                    ),
            
                     child:Center(child:  Text ('الرجوع',style: 
                     TextStyle(color: Color.fromARGB(255, 6, 69, 152),)
                     ,textAlign: TextAlign.center,) ,),)
               ,
                  Container(
                    width: 155,height: 48,decoration: 
                    BoxDecoration(color: Color.fromARGB(255, 222, 1, 49),
                    borderRadius: BorderRadius.circular(8)),
                   child:Center(child:  Text ('تفعيل الاشتراك',style:
                    TextStyle(color: Colors.white,),textAlign: TextAlign.center,) ,),)
                 
                 ],
                
            ),)
           ],),
           ));
         
  }
}