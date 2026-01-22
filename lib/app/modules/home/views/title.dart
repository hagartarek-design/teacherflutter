import 'package:flutter/material.dart';

class title extends StatefulWidget {
  const title({super.key});

  @override
  State<title> createState() => _titleState();
}

class _titleState extends State<title> {
  @override
  Widget build(BuildContext context) {
    return   Container( width: 1010,height: 95 ,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),
              ],
        
        ),
        child: 
       Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(width: 73,height: 95,decoration: BoxDecoration(color: Colors.white),),
            Flexible(
                child:  Container(
padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
width: 106,height: 95,
decoration: BoxDecoration(color: Colors.white),
          
          child: Align(alignment: Alignment.centerRight,
              
              child: 
              Text( 'حاضر/غائب',style: TextStyle(fontSize: 16,height: 1.5),
              textAlign: TextAlign.right,),),
              
            ),
            ),

              Container(width:214 ,height: 95,decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
              child: Align(alignment: Alignment.centerRight,
              
              child: 
              Text( 'البريد الالكتروني',textAlign: TextAlign.right,),),
              ),
              Container(width: 205,height: 95,
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
              child: 
              Align(alignment: Alignment.centerRight,
              
              child: 
              Text( 'مستوي التقدم في الكورس'),))
             , Container(width: 145,height: 95,
              padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
            decoration: BoxDecoration(color: Colors.white),
            child:Align(alignment: Alignment.centerRight,
            child: Text('ولي الامر (الام)' ,textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
               )   ),
              ),
              Container(
                width: 187,
                padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),child:Align(alignment: Alignment.centerRight,child: 
                 Text('أسم الطالب',textAlign:TextAlign.right ,),
              ),),
              Flexible( 
                child: Container(
                  width: 80,
                  height: 95,
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8), 
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Colors.white,
                  ),
                  child: Align( 
                    alignment: Alignment.centerRight,
                    child: Text(
                      'الاكواد',
                      style: TextStyle(
                        fontFamily: 'Teshrin AR+LT',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.black,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
          // _buildPagination(controller)
            ],
          ),)
       ,
      // 
       
        ) ;
  }
}