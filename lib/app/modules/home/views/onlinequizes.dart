import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/quizes.dart';
import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/dialogs/dialog_quizes.dart';
import 'package:flutterwallet/app/modules/home/views/dropdown.dart';
import 'package:flutterwallet/app/modules/home/views/offlinedialog.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'dart:ui' as ui;

import 'stabledropdown.dart';
class Onlinequizes extends StatefulWidget {
  const Onlinequizes({super.key});

  @override
  State<Onlinequizes> createState() => _OnlinequizesState();
}

class _OnlinequizesState extends State<Onlinequizes> {


  final HomeController controller = HomeController();

  bool clicked=false;
  @override
  Widget build(BuildContext context) {
var  startdate=controller.startdate;
DateTime startDateTime = DateTime.parse(controller.startdate);
int day = startDateTime.day; // 13

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[900]),
              child: Center(
                child: Text(
                  'الامتحنات',
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
    
    // Main Content
    Expanded(
    // Reduced to 50% width (you can adjust the value further)
      child: Column(
        children: [
          
          Container(

            color: Colors.white,
            height: 96,
            padding: const EdgeInsets.fromLTRB(64, 24, 344, 24),
            child: App_bar(),
          ),
          SizedBox(height: 16),
          Expanded(


            child:Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                // boxShadow: [BoxShadow(
                //   color: Colors.black.withOpacity(0.05), 
                //   offset: Offset(0, 3), 
                //   blurRadius: 13, 
                //   spreadRadius: 0, 
                // ),]
              ),
              child: Container(
                width: 1032,
              margin: const EdgeInsets.symmetric(horizontal: 100),
              color:  Colors.white,
              // elevation: 3,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(16),
              // ),
              // child: Padding(
                // padding: const EdgeInsets.all(16.0),
                
                child: Column(
                  children: [
               Container(
                decoration: BoxDecoration(   color: Colors.white,borderRadius: BorderRadius.only(

                  topLeft:Radius.circular(16) ,topRight:Radius.circular(16) ,
                  // bottomLeft:Radius.circular(16) ,bottomRight:Radius.circular(16) 
                )),
             
                child: Column(children: [    SizedBox(height: 10,), _buildHeader(context),
                SizedBox(height: 10,),
              _buildHeader2(context),       SizedBox(height: 5,),
                           ]), ),  
                           
                           
                                     Container(
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 95,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
           
           
               child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Image.asset('icons/Frame6.png', width: 26, height: 23),
            
                
            
               
                Row(
                  children: [
                    Text(
                      'سعر الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:  Text(
                      'اجمالي الدرجه',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),),
                    SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'تاريخ بدا الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                
                Row(
                  children: [
                    Text(
                      'مكان الامتحان ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'مده الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'نوع الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 7),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              ],
            ),)
          ,
                    // SizedBox(height: 10),
                    // _buildList(controller),
                   
                                                                   Container(
    width: 1030,
    height: 67,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // زر التالي
     
           GestureDetector(
          onTap: () {
            if (controller.currentPage > 1) {
              controller.currentPage--;
                  // controller.exampaginationonline(context,page:controller.currentPage);
          controller.update();
            }
          },
          child: Container(
            width: 95,
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset('icons/arrow-left.png', width: 20, height: 20,color:controller.currentPage > 1 ? Colors.blue : Colors.black,
                   ) ,  const SizedBox(width: 4), Text(
                  'السابق',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,color: controller.currentPage > 1 ? Colors.blue : Colors.black,
                  ),
                ),
              
              
              ],
            ),
          ),
        ),
     
 
        // أرقام الصفحات
        Container(
          // width: 292,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageNumbers(controller),
          ),
        ),

        // زر السابق
        GestureDetector(
          onTap: () {
            if (controller.currentPage < controller.totalPages) {
              controller.currentPage++;
            // controller.exampaginationonline(context,page:controller.currentPage);
          controller.update();
            }
          },
          child: Container(
            width: 87,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Text(
                  'التالي',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: controller.currentPage < controller.totalPages
                  ? Colors.blue
                  : Colors.black,
                  ),
                ),    const SizedBox(width: 4),  Image.asset('icons/Icon.png', width: 20, height: 20,color:
                 controller.currentPage < controller.totalPages
                  ? Colors.blue
                  : Colors.black,),
            
              ],
            ),
          ),
        ),

   ],
    ),
  )
                    // _buildPagination(controller),
                  ],
                ),
              ),
            ),)
          // ),
        ],
      ),
    ),
    // Sidebar
    Container(
      width: 280, // Fixed width for the sidebar
      height: double.infinity, // Full height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        color: Color.fromARGB(240, 6, 69, 152), // Sidebar background color
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
  ],
);
        },
      ),
    );
  }

  Widget _buildHeader(context) {
    return Positioned(top: 0,bottom: 50,child:  Container(
     
     
   decoration:BoxDecoration(
        
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight:Radius.circular(16) ,topLeft: Radius.circular(16)),
       ),
      height: 40,
      width: 1007,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
     
           
          ElevatedButton(
            onPressed: () {
      showDialog(context: context, builder: (BuildContext context ){
return Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment:MainAxisAlignment.center,
  children: [ 
    
Expanded(child:     SingleChildScrollView(child: 
    dialogoffline()))]);
      });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color.fromARGB(206, 6, 69, 152)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child:Container(height: 40,child:  Row(
              children: [
                Text(
                  'أضف المحاضره',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromARGB(206, 6, 69, 152),
                  ),
                ),
                SizedBox(width: 4),
                Image.asset('icons/add-square.png',height: 24,width: 24,)
              ],
            ),)
          ),
          
        ],
      ),)
    );
  }
  Widget _buildHeader2(context) {
    return Container(
     
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
     
       InkWell(onTap: (){
        Navigator.push(context,MaterialPageRoute( builder:(context)=>quizes()));
       },child: 
         Container(
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.only(topLeft:Radius.circular(4),bottomLeft:Radius.circular(4) ),
            color: Color.fromARGB(255, 235, 239, 249)),
          child:Row(children: [
           Container(
            decoration: BoxDecoration(color: const Color.fromARGB(255, 235, 239, 249),
            
        borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 11),
            child:InkWell(child:  Row(children: [  
              
              
              Text('امتحان في السنتر',style: TextStyle(color:
 Color.fromARGB(155, 6, 69, 152)
             ),textAlign: TextAlign.right,)
         ,     Image.asset('assets/Frame (2).png',width: 30,height: 30,)
              
              ],),
            
 onTap: (){
  setState(() {
    // clicked=!clicked;
           Navigator.push(context,MaterialPageRoute( builder:(context)=>quizes()));
    
  });

 },           )
,
),
          Container(
            decoration: BoxDecoration(color: 
             Color.fromARGB(155, 6, 69, 152)
        ,borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 11),
            child:   InkWell(child: Row(children: [  
              
            
              Text('امتحان اونلاين',style:
               TextStyle(color:
               Colors.white)
               ,textAlign: TextAlign.right,)
         ,     Image.asset('assets/Frame (1).png',width: 30,height: 30,)
              
              ],),onTap: (){
                // setState(() {
                //    clicked=!clicked;
                // });

// controller.exampaginationonline(context);
                },)
            
            ),
         

         ],))
       )
        ],
      ),
    );
  }

  // Widget _buildList(HomeController controller) {
  //   return Expanded(
  //     child:       ListView.builder(
  //       itemCount: controller.exam.length,
  //       itemBuilder: (context, index) {
  //         final item = controller.exam[index];
  //         return 
  //         Container(
            
  //           margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),

  //           padding: const EdgeInsets.symmetric(horizontal: 14),
  //           height: 95,
  //           decoration: BoxDecoration(
  //             boxShadow: [BoxShadow(
  //                 color: Colors.black.withOpacity(0.05), 
  //                 offset: Offset(0, 3), 
  //                 blurRadius: 13, 
  //                 spreadRadius: 0, 
  //               ),],
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(16),
  //           ),
  //           child: 
            
            
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [InkWell(child: 
  //               Image.asset('icons/Frame6.png', width: 26, height: 23),onTap:(){

  //               },),
  //                             Row(
  //                 children: [
  //                   Text('جنيه', style: TextStyle(fontSize: 16)),
  //                   Text(
  //                    '${ item.durationmin.toString()}',
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                       color: Color.fromARGB(202, 6, 69, 152),
  //                     ),
  //                   ),
  //                 ],
  //               ),
               
              
  //               Row(
  //                 children: [
  //                   Text('درجة', style: TextStyle(fontSize: 16)),
  //                   Text(
  //                     item.totaldegree.toString(),
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                       color: Color.fromARGB(202, 6, 69, 152),
  //                     ),
  //                   ),
  //                 ],
  //               ),
               
  //               Row(
  //                 children: [
                    
  //                   Text('', style: TextStyle(fontSize: 16)),
  //                   Text(
  //                     item.course?['month_by_year'],
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                       color: Color.fromARGB(202, 6, 69, 152),
  //                     ),
  //                   ),
  //                 ],
  //               ),  Row(
  //                 children: [
  //                   Text('', style: TextStyle(fontSize: 16)),
  //                   Text(
  //                     item.examplace.toString(),
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                       color: Color.fromARGB(202, 6, 69, 152),
  //                     ),
  //                   ),
  //                 ],
  //               ),
                
  //                Row(
  //                 children: [
  //                   Text('دقيقة', style: TextStyle(fontSize: 16)),
  //                   Text(
  //                     item .examprice.toString(),
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                       color: Color.fromARGB(202, 6, 69, 152),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //                Row(
  //                 children: [
  //                   Text(
  //                     'اسم الامتحان',
  //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  //                   ),
  //                   SizedBox(width: 4),
  //                  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
  //                 ],
  //               ),
              
              
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  
  //   );
 
  // }

  Widget _buildPagination(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.totalPages, (index) {
        final pageIndex = index + 1;
        return GestureDetector(
          onTap: () {
            controller.currentPage = pageIndex;
            // controller.exampaginationonline(context,page:controller.currentPage);
            controller.update();
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: pageIndex 
              == controller.currentPage
                  ? Colors.blue
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$pageIndex',
              style: TextStyle(
                color: pageIndex == controller.currentPage
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }



  bool isToggled = false;

  void toggle() {
  
      isToggled = !isToggled;

  }

  // @override
  // Widget build(BuildContext context) {
  //   return 
  // }
// }

}

List<Widget> _buildPageNumbers(HomeController controller) {
  final currentPage = controller.currentPage;
  final totalPages = controller.totalPages;
  final List<Widget> pages = [];

  void addPage(int page) {
    pages.add(
      GestureDetector(
        onTap: () {
          controller.currentPage = page;
            // controller.exampaginationonline(context,page:controller.currentPage);
          controller.update();
        },
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: page == currentPage ? Colors.grey.shade300 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$page',
            style: TextStyle(
              color: page == currentPage ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // Always show: 1 2 3 ... last-2 last-1 last
  if (totalPages <= 7) {
    for (int i = 1; i <= totalPages; i++) {
      addPage(i);
    }
  } else {
    for (int i = 1; i <= 3; i++) {
      addPage(i);
    }

    if (currentPage > 4 && currentPage < totalPages - 3) {
      pages.add(const SizedBox(
        width: 40,
        height: 40,
        child: Center(child: Text('...')),
      ));

      addPage(currentPage);

      pages.add(const SizedBox(
        width: 40,
        height: 40,
        child: Center(child: Text('...')),
      ));
    } else {
      pages.add(const SizedBox(
        width: 40,
        height: 40,
        child: Center(child: Text('...')),
      ));
    }

    for (int i = totalPages - 2; i <= totalPages; i++) {
      addPage(i);
    }
  }

  return pages;
}
