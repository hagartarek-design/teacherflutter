import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/containe%20copy.dart';
// import 'package:flutterwallet/app/modules/home/views/dialog_assignments.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';

class Assignments extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
   final screenWidth = MediaQuery.of(context).size.width;
final isDesktop = screenWidth >= 1200;  final istablet = screenWidth < 1024;
  // final screenWidth = MediaQuery.of(context).size.width;
  final isMobile = screenWidth < 650;
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
          return  ScrollConfiguration(
  behavior: const ScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.trackpad,
    },
  ),
  child: SingleChildScrollView(
    physics: const ClampingScrollPhysics(),
    child: Column(
      children: [ Stack(
        children: [
          
          // Padding(
          //   child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
     
          
                 Container(
  width: double.infinity,color: Colors.white,
  height: 96,
  padding: 
  isMobile
      ? EdgeInsets.zero
      : istablet? EdgeInsets.zero:
      const EdgeInsets.fromLTRB(64, 24, 344, 24),
  child: const App_bar(),
),
          SizedBox(height: 16),
          // Expanded(


          //   child: 
            Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
              color:  Colors.white,
             ),
              width: 1032,height: 900,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              // color:  Colors.white,
              // elevation: 3,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(16),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                
                child: Column(
                  children: [
               SizedBox(height: 10,), _buildHeader(context),
                SizedBox(height: 10,),
              _buildHeader2(),       SizedBox(height: 5,),
                      //  ),  
                           
                           

          
           Container(width: 1032,
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
           
           
               child:   isMobile?                       
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: 
               Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.center,
              children: [
                Image.asset('icons/Frame6.png', width: 26, height: 23),
             
                
            
               
                Wrap(
                  children: [
                    Text(
                      'سعر الواجب',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),
              
                Wrap(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:  Text(
                      'تاريخ بدا الواجب',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),

                Wrap(
                  children: [
                    Text(
                      'تاريخ انتهاء صلاحية',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),
                
                Wrap(
                  children: [
                    Text(
                      'اجمال الدرجة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),

                Wrap(
                  children: [
                    Text(
                      'عدد الاسالة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),

                Wrap(
                  children: [
                    Text(
                      'اسم الواجب',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),

              ],
            ),)
         :   Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.center,
              children: [
                Image.asset('icons/Frame6.png', width: 26, height: 23),
             
                
            
               
                Wrap(
                  children: [
                    Text(
                      'سعر الواجب',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),
              
                Wrap(
                  children: [
                    Padding(padding: EdgeInsets.zero
                    ,child:  Text(
                      'تاريخ بدا الواجب',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),

                Wrap(
                  children: [
                    Text(
                      'تاريخ انتهاء صلاحية',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),
                
                Wrap(
                  children: [
                    Text(
                      'اجمال الدرجة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),

                Wrap(
                  children: [
                    Text(
                      'عدد الاسالة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),

                Wrap(
                  children: [
                    Text(
                      'اسم الواجب',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  //  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
                    SizedBox(width: 7),

              ],
            ),)
                       
        ,
                    // SizedBox(height: 10),
                    _buildList(controller,isMobile),
                    // _buildPagination(controller),
    Container(
    width: 1032,
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
     
           GestureDetector(
          onTap: () {
            if (controller.currentPage > 1) {
              controller.currentPage--;
                  // controller.fetchAssignments(context,page:controller.currentPage);
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
        Container(height: 40,
          // width: 292,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageNumbers(controller,context),
          ),
        ),

        // زر السابق
        GestureDetector(
          onTap: () {
            if (controller.currentPage < controller.totalPages) {
              controller.currentPage++;
          // controller.fetchAssignments(context,page:controller.currentPage);
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
    
                  ],
                ),
              ),
            // ),
          // ),
          //  )
            )  ],
      ),
     (isMobile&&controller.isoptionselect)||(istablet&&controller.isoptionselecttablet)||(!isMobile&&!istablet)
?Positioned(
            top: 0, // Align at the top
         right: 0, // Align to the right
            child: Container(
              width: 280, // Fixed width
              height: 1445, // Fixed height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24)),
                color:
                    Color.fromARGB(240, 6, 69, 152), // Sidebar background color
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
          )
  :Container()
     ]),
    // Sidebar
 
          ])));}));}

  Widget _buildHeader(BuildContext context) {
    return Container(
     
     
      decoration:BoxDecoration(
        borderRadius: BorderRadius.only(topRight:Radius.circular(16) ,topLeft: Radius.circular(16)),
       ),
      // height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
     
       
          ElevatedButton(
            onPressed: () {
             showDialog(context: context, builder: (BuildContext context){
      List.generate(controller.allsections.length,(index){
    print('http://localhost:3000/${controller.allsections[index].cardimg}');});
    return  dialogforassignments();

    });// Add lecture logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color.fromARGB(206, 6, 69, 152)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Container(height: 40,child:  Row(
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
              ],)
            ),
          ),
          Text(
            'الواجبات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ],
      // ),
      )
    );
  }
  Widget _buildHeader2() {
    return Container(
     
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      child: 
     
       
         Container(child:Row(children: [
         

       
         

         ],))
          
       
    );
  }

  Widget _buildList(HomeController controller,isMobile) {
    return Expanded(
      child: ListView.builder(
        // itemCount: controller.assignment.length,
        itemBuilder: (context, index) {

          // final item = controller.assignment[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),

            padding: const EdgeInsets.symmetric(horizontal: 14),
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
            child:isMobile?
            SingleChildScrollView(scrollDirection: Axis.horizontal,child:  Row(spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                  PopupMenuButton<String>(
 color: Colors.white,
borderRadius: BorderRadius.circular(8),
  onSelected: (value) {
    if (value == 'close') {
      print('اغلق السؤال selected');
    } else if (value == 'delete') {
      print('مسح السؤال selected');
    }
  },
  itemBuilder: (BuildContext context) => [
    PopupMenuItem(
      value: 'close',
      child: Container(
        width: 151, // Set the width
        height: 75, // Set the height
        child: Center( // Center the text
          child: Text('اغلق السؤال' ,
          style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    ),
    PopupMenuItem(
      value: 'delete',
      child: Container(
        width: 151, // Set the width
        height: 75, // Set the height
        child: Center( // Center the text
          child: Text('مسح السؤال',style: 
          TextStyle(color: Colors.red),),
        ),
      ),
      onTap: () {
//         controller.deletesection(context,item.id.toString());
// controller.update();
// controller.allpaginsections(context,page: 1);
        // Handle the tap event if needed
      },
    
            ),
          ],
           child: Image.asset(
          'icons/Group 37966.png'
           ,width: 26,height: 6,), ),
                Row(
                  children: [
                    Text('جنيه', style: TextStyle(fontSize: 16)),
                    // Text(
                    //  item.price.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),
               
              
                Row(
                  children: [
                    // Text('درجة', style: TextStyle(fontSize: 16)),
                    // Text(
                    //   item.startdate.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),
               
                Row(
                  children: [
                    Text('', style: TextStyle(fontSize: 16)),
                    // Text(
                    //   item.lastdate.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),  Row(
                  children: [
                    Text('درجة', style: TextStyle(fontSize: 16)),
                    // Text(
                    //   item.degree.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),
                
                 Row(
                  children: [
                    Text('اسئلة', style: TextStyle(fontSize: 16)),
                    // Text(
                    //   item .price.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),
                 Row(
                  children: [
                    // Text(
                    //   '${controller.assignment[index].name}',
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    // ),
                    SizedBox(width: 4),
                   Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              
              
              ],
            )
                )    :
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                  PopupMenuButton<String>(
 color: Colors.white,
borderRadius: BorderRadius.circular(8),
  onSelected: (value) {
    if (value == 'close') {
      print('اغلق السؤال selected');
    } else if (value == 'delete') {
      print('مسح السؤال selected');
    }
  },
  itemBuilder: (BuildContext context) => [
    PopupMenuItem(
      value: 'close',
      child: Container(
        width: 151, // Set the width
        height: 75, // Set the height
        child: Center( // Center the text
          child: Text('اغلق السؤال' ,
          style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    ),
    PopupMenuItem(
      value: 'delete',
      child: Container(
        width: 151, // Set the width
        height: 75, // Set the height
        child: Center( // Center the text
          child: Text('مسح السؤال',style: 
          TextStyle(color: Colors.red),),
        ),
      ),
      onTap: () {
//         controller.deletesection(context,item.id.toString());
// controller.update();
// controller.allpaginsections(context,page: 1);
        // Handle the tap event if needed
      },
    
            ),
          ],
           child: Image.asset(
          'icons/Group 37966.png'
           ,width: 26,height: 6,), ),
                Row(
                  children: [
                    Text('جنيه', style: TextStyle(fontSize: 16)),
                    // Text(
                    // //  item.price.toString(),
                    //   // style: TextStyle(
                    //   //   fontWeight: FontWeight.bold,
                    //   //   fontSize: 16,
                    //   //   color: Color.fromARGB(202, 6, 69, 152),
                    //   // ),
                    // ),
                  ],
                ),
               
              
                Row(
                  children: [
                    // Text('درجة', style: TextStyle(fontSize: 16)),
                    // Text(
                    //   item.startdate.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),
               
                Row(
                  children: [
                    Text('', style: TextStyle(fontSize: 16)),
                    // Text(
                    //   item.lastdate.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),  Row(
                  children: [
                    Text('درجة', style: TextStyle(fontSize: 16)),
                    // Text(
                    //   item.degree.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),
                
                 Row(
                  children: [
                    Text('اسئلة', style: TextStyle(fontSize: 16)),
                    // Text(
                    //   item .price.toString(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Color.fromARGB(202, 6, 69, 152),
                    //   ),
                    // ),
                  ],
                ),
                 Row(
                  children: [
                    // Text(
                    //   '${controller.assignment[index].name}',
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    // ),
                    SizedBox(width: 4),
                   Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              
              
              ],
            ),
       
          );
        },
      ),
    );
  }

List<Widget> _buildPageNumbers(HomeController controller,context) {
  final currentPage = controller.currentPage;
  final totalPages = controller.totalPages;
  final List<Widget> pages = [];

  void addPage(int page) {
    pages.add(
      GestureDetector(
        onTap: () {
          controller.currentPage = page;
              //  controller.fetchAssignments(context,page:controller.currentPage);
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
}