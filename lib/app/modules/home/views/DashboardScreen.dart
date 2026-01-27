import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/homescreen.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:flutterwallet/app/modules/home/views/showdialog.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:flutterwallet/app/modules/home/views/videodialog.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class DashboardScreen extends StatelessWidget {
//   final HomeController controller = HomeController();
// @override
// void initState() {
//   super.initState();

//   final authController = Get.find<AuthController>();
//   authController.startAutoRefresh(token);
// }
// class DashboardScreenextends StatefulWidget {
//    DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final HomeController controller = Get.find<HomeController>();
//   final HomeController controller = Get.find<HomeController>();
// class _DashboardScreenState extends State<DashboardScreen> {
  final HomeController controller = Get.find<HomeController>();
  
// In _DashboardScreenState class
Timer? _dashboardTokenTimer;

@override
void initState() {
  super.initState();
  
  controller.currentScreen.value = '/DashboardScreen';
  controller.isDashboardOpen.value = true;
  controller.isDashboardActive.value = true;
  
  // Start Dashboard-specific token monitoring
  _startDashboardTokenMonitoring();
  
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _initializeDashboardWithRefresh();
  });
}

void _startDashboardTokenMonitoring() {
  // Stop any existing timer
  _dashboardTokenTimer?.cancel();
  
  // Check token every minute when in Dashboard
  _dashboardTokenTimer = Timer.periodic(Duration(minutes: 1), (timer) {
    if (mounted) {
      controller.checkDashboardToken();
    }
  });
}

@override
void dispose() {
  // Stop the Dashboard timer
  _dashboardTokenTimer?.cancel();
  _dashboardTokenTimer = null;
  
  controller.stopDashboardTimer();
  controller.isDashboardActive.value = false;
  
  super.dispose();
}

 Future<void> _initializeDashboardWithRefresh() async {
  print('📱 DashboardScreen - Initializing with auto-refresh');
  
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  
  if (token == null || token.isEmpty) {
    print('⚠️ No token in Dashboard');
    return;
  }
  
  try {
    final expiryDate = JwtDecoder.getExpirationDate(token);
    final remaining = expiryDate.difference(DateTime.now());
    
    print('📱 Dashboard token expires in: ${remaining.inMinutes} minutes');
    
    // If token is already expired, refresh immediately
    if (remaining.isNegative) {
      print('🔄 Token already expired, refreshing now...');
      await controller.refreshAccessToken();
    } 
    // If token expires in less than 10 minutes, refresh now
    else if (remaining.inMinutes < 10) {
      print('🔄 Token expiring soon, refreshing now...');
      await controller.refreshAccessToken();
    }
    
    // Start Dashboard timer
    if (controller.isDashboardActive.value) {
      controller.startDashboardTimer();
    }
    
  } catch (e) {
    print('❌ Error in Dashboard token initialization: $e');
  }
}
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
        // init: HomeController(),
        builder: (controller) {
          return Row(
  children: [
    
    Expanded(
      flex: 1,
      child: Column(
        children: [
Column(
  children: [
    // Text('Dashboard Screen'),
    // SizedBox(height: 20),
    // ElevatedButton(
    //   onPressed: () async {
    //     final prefs = await SharedPreferences.getInstance();
    //     final token = prefs.getString('token');
    //     final expiry = JwtDecoder.getExpirationDate(token!);
    //     final remaining = expiry.difference(DateTime.now());
        
    //     // print(' الوقت المتبقي: ${remaining.inMinutes} دقيقة و${remaining.inSeconds % 60} ثانية');
        
    //     if (JwtDecoder.isExpired(token)) {
    //       // print(' التوكن منتهي!');
    //     } else {
    //       // print('التوكن ساري');
    //     }
    //   },
    //   child: Text('تحقق من صلاحية التوكن'),
    // ),
    // SizedBox(height: 20),
    // ElevatedButton(
    //   onPressed: () {
    //     // محاكاة انتهاء التوكن
    //     // controller.handleTokenExpired();
    //   },
    //   child: Text('محاكاة انتهاء التوكن'),
    // ),
  ],
),
          Container(
            color: Colors.white,
            height: 96,
            padding: const EdgeInsets.fromLTRB(64, 24, 344, 24),
            child: App_bar(),
          ),
          SizedBox(height: 16),
          Expanded(


            child: Container(
              width: 1032,
              margin: const EdgeInsets.symmetric(horizontal: 100),
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
              color:  Colors.white,
             ),
              // elevation: 3,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(16),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                
                child: Column(
                  children: [
               SizedBox(width: 50,),      _buildHeader(context),
                    
                    
                      Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
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
                SizedBox( width: 26, height: 23),
                Row(
                  children: [
                    Text('  ', style: TextStyle(fontSize: 16)),
                    Text(
                     'سعر المحاضره',
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
                      'صلاحيه مشاهده المحاضره ',
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
                  //  Image.asset('icons/ Digit.png',width: 24,height: 24,)
                  ],
                ),
              ],
            ),
          ),
                  
                    // SizedBox(height: 10),
                    _buildList(controller),
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
     
           GestureDetector(
         onTap: () {
  if (controller.currentPage > 1) {
    controller.currentPage--;
    controller.allpaginsections(page: controller.currentPage);
    controller.update();
  }
}
,
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
     
 
      SizedBox(
  height: 40,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: _buildPageNumbers(controller),
  ),
)
,

        GestureDetector(
         onTap: () {
  if (controller.currentPage < controller.totalPages) {
    controller.currentPage++;
    controller.allpaginsections(page: controller.currentPage);
    controller.update();
  }
}
,
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
            ),
          ),
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

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
     
       
          ElevatedButton(
            onPressed: ()async {
            // controller.getToken();
            final prefs=await SharedPreferences.getInstance();
        final  token =   prefs.getString('token')??"";
     
    showDialog(context: context, builder: (BuildContext context){
    //   List.generate(controller.allsections.length,(index){
    // print('http://localhost:3000/${controller.allsections[index].cardimg}');});
    // return  show_Dialog();
     controller.startTokenTimer(token);
return  UploadLectureDialog();
    });
       controller.gloabalsection();     },
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
        controller.deletesection(item.id.toString());
controller.update();
controller.allpaginsections(page: 1);
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
                      '${item.name}',
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
//    Widget _buildPagination(HomeController controller) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(controller.totalPages, (index) {
//         final pageIndex = index + 1;
//         return GestureDetector(
//           onTap: () {
//             controller.currentPage = pageIndex;
//             controller.allpaginsections(page:controller.currentPage);
//             controller.update();
//           },
//           child: Container(
//             margin: const EdgeInsets.all(4),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: pageIndex 
//               == controller.currentPage
//                   ? Colors.blue
//                   : Colors.grey.shade300,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Text(
//               '$pageIndex',
//               style: TextStyle(
//                 color: pageIndex == controller.currentPage
//                     ? Colors.white
//                     : Colors.black,
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
//  // Import with a prefix

void showCustomDialog(BuildContext context) {
  // final pathContext = path.Context(); // Use the prefix to access `Context`

  showDialog(
    context: context, // This is the Flutter `BuildContext`
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

}
List<Widget> _buildPageNumbers(HomeController controller) {
  final int currentPage = controller.currentPage;
  final int totalPages = controller.totalPages;

  final List<Widget> pages = [];

  // Helper to add page box
  void addPage(int page) {
    pages.add(
      GestureDetector(
        onTap: () {
          controller.currentPage = page;
          controller.allpaginsections(page: page);
          controller.update();
        },
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: page == currentPage ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Text(
            "$page",
            style: TextStyle(
              color: page == currentPage ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // Helper to add ellipsis
  void addDots() {
    pages.add(
      const SizedBox(
        width: 40,
        height: 40,
        child: Center(
          child: Text("..."),
        ),
      ),
    );
  }

  // ---------- BUILD LOGIC ----------
  if (totalPages <= 7) {
    // Show all pages normally
    for (int i = 1; i <= totalPages; i++) {
      addPage(i);
    }
  } else {
    // Always show pages 1, 2, 3
    addPage(1);
    addPage(2);
    addPage(3);

    // Middle pages
    if (currentPage > 4 && currentPage < totalPages - 3) {
      addDots();
      addPage(currentPage);
      addDots();
    } else {
      addDots();
    }

    // Always show last 3 pages
    addPage(totalPages - 2);
    addPage(totalPages - 1);
    addPage(totalPages);
  }

  return pages;
}
}