import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/grouphasstudents.dart';
import 'package:flutterwallet/app/modules/home/views/homescreen.dart';
import 'package:flutterwallet/app/modules/home/views/showdialog.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
class Studentsingroup extends  StatelessWidget {
final  Course course;
   Studentsingroup({super.key,required this.course});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// class Studentsingroup extends StatelessWidget {
  
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
    
    Expanded(
      flex: 1, 
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

child: groupHasStudents(course:course),
          ),
        ],
      ),
    ),

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
  ],
);
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
     
       
          ElevatedButton(
            onPressed: () {
    showDialog(context: context, builder: (BuildContext context){
      List.generate(controller.allsections.length,(index){
    print('http://localhost:3000/${controller.allsections[index].cardimg}');});
    return  show_Dialog();

    });
       controller.gloabalsection(//context
       );     },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color.fromARGB(206, 6, 69, 152)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
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
            ),
          ),
          Text(
            'المحاضرات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _buildList(HomeController controller) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.sections.length,
        itemBuilder: (context, index) {
          final item = controller.sections[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 95,
            decoration: BoxDecoration(
              boxShadow:[ BoxShadow(
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
                
                Container( height: 75,width: 151,child:
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
        // Handle the tap event if needed
      },
    
            ),
          ],
           child: Image.asset(
          'icons/Group 37966.png'
           ,width: 26,height: 6,), ),
            ),    Row(
                  children: [
                    Text('جنيه', style: TextStyle(fontSize: 16)),
                    Text(
                      item.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(202, 6, 69, 152),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('مرات', style: TextStyle(fontSize: 16)),
                    Text(
                      item.viewingWatching.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(202, 6, 69, 152),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'اسم المحاضره',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
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

  // Widget _buildPagination(HomeController controller) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: List.generate(controller.totalPages, (index) {
  //       final pageIndex = index + 1;
  //       return GestureDetector(
  //         onTap: () {

  //           controller.currentPage = pageIndex;
  //           controller.allpaginsections(controller.currentPage);
  //           controller.update();
  //         },
  //         child: Container(
  //           margin: const EdgeInsets.all(4),
  //           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //           decoration: BoxDecoration(
  //             color: pageIndex 
  //             == controller.currentPage
  //                 ? Colors.blue
  //                 : Colors.grey.shade300,
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Text(
  //             '$pageIndex',
  //             style: TextStyle(
  //               color: pageIndex == controller.currentPage
  //                   ? Colors.white
  //                   : Colors.black,
  //             ),
  //           ),
  //         ),
  //       );
  //     }),
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
            // controller.allpaginsections(context,page:controller.currentPage);
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

void showCustomDialog(BuildContext context) {

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Dialog Title'),
        content: Text('This is a dialog.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}}
