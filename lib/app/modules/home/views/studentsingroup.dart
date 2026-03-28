import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/grouphasstudents.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
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
