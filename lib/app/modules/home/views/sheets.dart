import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class sheets extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Row(
  children: [
    
//     Expanded(
//       flex: 1, 
//       child: Column(
//         children: [
          
//           Container(
//             color: Colors.white,
//             height: 96,
//             padding: const EdgeInsets.fromLTRB(64, 24, 344, 24),
//             child: App_bar(),
//           ),
//           SizedBox(height: 16),
//           Expanded(


//             child: Card(
//               margin: const EdgeInsets.symmetric(horizontal: 100),
//               color: const Color.fromARGB(255, 247, 244, 244),
//               elevation: 3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               // child: Padding(
//                 // padding: const EdgeInsets.all(16.0),
                
//                 child: Column(
//                   children: [
//                Container(
//                 decoration: BoxDecoration(   color: Colors.white,borderRadius: BorderRadius.only(

//                   topLeft:Radius.circular(16) ,topRight:Radius.circular(16) ,
//                   // bottomLeft:Radius.circular(16) ,bottomRight:Radius.circular(16) 
//                 )),
             
//                 child: Column(children: [    SizedBox(height: 10,), _buildHeader(),
//                 SizedBox(height: 10,),
//               _buildHeader2(),       SizedBox(height: 5,),
//                            ]), ),  
                           
                           
//                                      Container(
//             margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             height: 95,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//             ),
           
           
//                child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
//               children: [
//                 Image.asset('icons/Frame6.png', width: 26, height: 23),
            
                
            
               
//                 Row(
//                   children: [
//                     Text(
//                       'سعر الامتحان',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     SizedBox(width: 7),
//                   //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
//                   ],
//                 ),
              
//                 Row(
//                   children: [
//                     Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:  Text(
//                       'اجمالي الدرجه',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),),
//                     SizedBox(width: 7),
//                   //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'تاريخ بدا الامتحان',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     SizedBox(width: 7),
//                   //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
//                   ],
//                 ),
                
//                 Row(
//                   children: [
//                     Text(
//                       'مكان الامتحان ',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     SizedBox(width: 7),
//                   //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'مده الامتحان',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     SizedBox(width: 7),
//                   //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'نوع الامتحان',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     SizedBox(width: 7),
//                   //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
//                   ],
//                 ),
//               ],
//             ),)
//           ,
//                     // SizedBox(height: 10),
//                     _buildList(controller),
//                     _buildPagination(controller),
//                   ],
//                 ),
//               ),
//             ),
//           // ),
//         ],
//       ),
//     ),
//     // Sidebar
//     Container(
//       width: 280, // Fixed width for the sidebar
//       height: double.infinity, // Full height
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24),
//           bottomLeft: Radius.circular(24),
//         ),
//         color: Color.fromARGB(240, 6, 69, 152), // Sidebar background color
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: rightbar(),
//     ),
//   ],
// );
//         },
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Positioned(top: 0,bottom: 50,child:  Container(
     
     
//       decoration:BoxDecoration(
//         borderRadius: BorderRadius.only(topRight:Radius.circular(16) ,topLeft: Radius.circular(16)),
//        ),
//       height: 40,
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
     
       
//           ElevatedButton(
//             onPressed: () {
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white,
//               side: BorderSide(color: Color.fromARGB(206, 6, 69, 152)),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Text(
//                   'أضف المحاضره',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     color: Color.fromARGB(206, 6, 69, 152),
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 Image.asset('icons/add-square.png',height: 24,width: 24,)
//               ],
//             ),
//           ),
//           Text(
//             'الملازم',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
          
//         ],
//       ),)
//     );
//   }
//   Widget _buildHeader2() {
//     return Container(
     
//       height: 40,
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 16,),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
     
       
//          Container(child:Row(children: [
//            Container(
//             decoration: BoxDecoration(color: const Color.fromARGB(210, 203, 219, 238),borderRadius: BorderRadius.circular(6)),
//             padding: EdgeInsets.symmetric(horizontal: 25,vertical: 11),
//             child: Row(children: [  
              
              
//               Text('امتحان في السنتر',style: TextStyle(color: Color.fromARGB(155, 6, 69, 152),),textAlign: TextAlign.right,)
//          ,     Image.asset('assets/Frame (2).png',width: 30,height: 30,)
              
//               ],),
            
//             )
// ,
//           Container(
//             decoration: BoxDecoration(color: const Color.fromARGB(155, 6, 69, 152),borderRadius: BorderRadius.circular(6)),
//             padding: EdgeInsets.symmetric(horizontal: 25,vertical: 11),
//             child: Row(children: [  
              
              
//               Text('امتحان اونلاين',style: TextStyle(color: Colors.white),textAlign: TextAlign.right,)
//          ,     Image.asset('assets/Frame (1).png',width: 30,height: 30,)
              
//               ],),
            
//             ),
         

//          ],))
          
//         ],
//       ),
//     );
      ] ); }));}
  }
