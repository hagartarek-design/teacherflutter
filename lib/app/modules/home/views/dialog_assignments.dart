// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterwallet/app/modules/home/views/Quizes.dart';
// import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
// import 'package:flutterwallet/app/modules/home/views/dropdown.dart';
// import 'package:flutterwallet/app/modules/home/views/progress.dart';
// import 'package:flutterwallet/app/modules/home/views/stabledropdown.dart';

// class DialogAssignments extends StatefulWidget {
//   const DialogAssignments({super.key});

//   @override
//   State<DialogAssignments> createState() => _dialogassignmentsState();
// }

// class _dialogassignmentsState extends State<DialogAssignments> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           // Use constraints to determine the size of the dialog
//           double dialogWidth = constraints.maxWidth > 1032 ? 1032 : constraints.maxWidth * 0.9;
//           double columnWidth = dialogWidth * 0.45; // Adjust column width based on dialog width

//           return Container(
//             padding: EdgeInsets.fromLTRB(18, 18, 18, 40),
//             width: dialogWidth,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     onTap: (){
//                                Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DashboardScreen2()),
//             );    
//                     },
//                     child: 
//                   Image.asset('assets/close-circl.png', width: 24, height: 24),
//                   ),SizedBox(height: 16),
//                   Container(
//                     width: dialogWidth,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           'اضافه واجب جديد',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 32,
//                             color: Color.fromARGB(255, 6, 69, 152)),
//                           textAlign: TextAlign.right,
//                         ),
//                         SizedBox(height: 16),
//                         Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   width: columnWidth,
//                                   child: Column(
//                                     children: [
//                                   _buildTextField('سعر الامتحان', 'ادخل سعر الامتحان'),
//                                       SizedBox(height: 16),
//                                       _buildTextField('المدة', 'ادخل المدة'),
//                                       SizedBox(height: 16),
//                                       _buildTextField('الدرجه النجاح', 'ادخل درجة النجاح الامتحان'),   
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   width: columnWidth,
//                                   child: Column(
//                                     children: [
//                                    _buildTextField('اسم الامتحان', 'ادخل اسم الامتحان'),
//                                       SizedBox(height: 16),
//                                       _buildTextField('عدد الامتحان', 'ادخل عدد السنوات'),
//                                       SizedBox(height: 16),
//                                       _buildTextField('الدرجة', 'ادخل الدرجة'),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 16),
//                         Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [    DraggableToggleSwitch(
//                     initialValue: controller.showdegreeEveryQues == 1,
//                     onToggleChanged: (value) {
//                       controller.updateShowDegreeEveryQues(value ? 1 : 0);
//                     },
//                   ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'اظهار النتيجه بعد الامتحان',
//                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 16),
//                         Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                              DraggableToggleSwitch(
//                     initialValue: controller.showdegreeEveryQues == 1,
//                     onToggleChanged: (value) {
//                       controller.updateShowDegreeEveryQues(value ? 1 : 0);
//                     },
//                   ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'وضع قيمه الدرجه علي كل سؤال',
//                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 16),
//                         Container(
//                           width: dialogWidth,
//                           height: 76,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: columnWidth,
//                                 height: 76,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       'تاريخ استحقاق الامتحان ',
//                                       textAlign: TextAlign.right,
//                                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                                     ),
//                                     CustomDropdown(),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: columnWidth,
//                                 height: 76,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       'تاريخ فتح الامتحان',
//                                       textAlign: TextAlign.right,
//                                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                                     ),
//                                     CustomDropdown(),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Container(
//                           width: dialogWidth,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Container(
//                                 width: dialogWidth,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       'اختار شكل الكارت',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                         color: Color.fromARGB(255, 6, 69, 152)),
//                                       textAlign: TextAlign.right,
//                                     ),
//                                     SizedBox(height: 8),
//                                     Text(
//                                       'اختار شكل كارت اللي يناسب استخدامك في العمل الامتحانات بكل سهولة ودقة!',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 16,
//                                         color: Color.fromARGB(255, 80, 124, 181)),
//                                       textAlign: TextAlign.right,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 16),
//                               Container(
//                                 width: dialogWidth * 0.3, // Adjust width for the image row
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Image.asset('assets/Component 170.png', width: 93, height: 109),
                                    
//                                   ],
//                                 ),
//                               ),
                           
//                             ],
//                           ),
//                         ),  
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [  
//                Container( width: 193,height: 40,
               
//                child: 
//                               TextButton(
                                
//                                 style: TextButton.styleFrom(
//                                   backgroundColor: Color.fromARGB(255, 6, 69, 152),
//                                      padding: EdgeInsets.all(8)
//                                      ,shape:RoundedRectangleBorder( borderRadius:BorderRadius.circular(8))
//                                 ),
//                                 onPressed: (){

// Navigator.push(context, MaterialPageRoute(builder: (context)=>Assignments2()));

//                               }, child: Text("بدا عمل الامتحان",style: TextStyle(color: Colors.white),)))      ],
//                     ),
//                 ])),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildTextField(String label, String hint) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Text(
//           label,
//           style: TextStyle(),
//           textAlign: TextAlign.right,
//         ),
//         SizedBox(height: 8),
//         TextField(
//           textDirection: TextDirection.rtl,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),),
//             hintText: hint,
//             hintTextDirection: TextDirection.rtl,
//             hintStyle: TextStyle(
//               color: Color.fromARGB(255, 125, 140, 158),
//               fontSize: 16,
//               fontWeight: FontWeight.w400),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/quizes.dart';
import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
import 'package:flutterwallet/app/modules/home/views/calenderpick.dart';
import 'package:flutterwallet/app/modules/home/views/calenderpick2.dart';
import 'package:flutterwallet/app/modules/home/views/dropdown.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:flutterwallet/app/modules/home/views/stabledropdown.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DialogAssignments extends StatefulWidget {
  const DialogAssignments({super.key});

  @override
  State<DialogAssignments> createState() => _DialogAssignmentsState();
}

class _DialogAssignmentsState extends State<DialogAssignments> {
    HomeController controller=HomeController();
  
Future<bool> ensureTokenValidForDialog() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    if (token == null || token.isEmpty) {
      print(' لا يوجد توكن في الديالوج');
      return false;
    }
    
    if (JwtDecoder.isExpired(token)) {
      print(' التوكن منتهي في الديالوج - محاولة التجديد');
      
      final refreshed = await controller. refreshTokenForDialog();
      
      if (refreshed) {
        print(' تم تجديد التوكن بنجاح - يمكن متابعة الديالوج');
        return true;
      } else {
        print(' فشل تجديد التوكن - الديالوج سيفشل');
        return false;
      }
    }
    
    print(' التوكن صالح في الديالوج');
    return true;
    
  } catch (e) {
    print(' خطأ في التحقق من التوكن للديالوج: $e');
    return false;
  }
}  
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
  return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {  return Dialog(
      backgroundColor: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use constraints to determine the size of the dialog
          double dialogWidth = constraints.maxWidth > 1032 ? 1032 : constraints.maxWidth * 0.9;
          double columnWidth = dialogWidth * 0.45; // Adjust column width based on dialog width

          return Container(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 40),
            width: dialogWidth,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => quizes()),
            );    
                    },
                    child: 
                  Image.asset('assets/close-circl.png', width: 24, height: 24),
                  ),SizedBox(height: 16),
                  Container(
                    width: dialogWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'اضافه الامتحان جديد',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            color: Color.fromARGB(255, 6, 69, 152)),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 16),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: columnWidth,
                                  child: Column(
                                    children: [
                                      _buildTextField('سعر الامتحان', 'ادخل سعر الامتحان',controller.examprice),
                                      SizedBox(height: 16),
                                      _buildTextField('المدة', 'ادخل  المدة',controller.durationmin),
                                      SizedBox(height: 16),
                                      _buildTextField('الدرجة النجاح', 'ادخل درجةالنجاح',controller.degree_success),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: columnWidth,
                                  child: Column(
                                    children: [
                                      _buildTextField( 'اسم الامتحان','ادخل اسم الامتحان',controller.exam_name),
                                      SizedBox(height: 16),
                                      _buildTextField( 'عدد المحاولات','ادخل عدد المحاولات',controller.trials_number),
                                      SizedBox(height: 16),
                                      _buildTextField( 'الدرجة','ادخل الدرجة',controller.totaldegree),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                 DraggableToggleSwitch(
                    initialValue: controller.showdegreeEveryQues == 1,
                    onToggleChanged: (value) {
                      controller.updateShowDegreeEveryQues(value ? 1 : 0);
                      controller.updateShowDegreeAfter(value ? 1 : 0);
                    },
                  ),
                                SizedBox(width: 8),
                                Text(
                                  'اظهار النتيجه بعد الامتحان',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DraggableToggleSwitch(
                    initialValue: controller.showdegreeEveryQues == 1,
                    onToggleChanged: (value) {
                      controller.updateShowDegreeEveryQues(value ? 1 : 0);
                      controller.updateShowDegreeAfter(value ? 1 : 0);
                    },
                  ),       SizedBox(width: 8),
                                Text(
                                  'وضع قيمه الدرجه علي كل سؤال',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: dialogWidth,
                          height: 76,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: columnWidth,
                                height: 76,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'تاريخ فتح الامتحان',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                Calenderpick2(
  onDateSelected: (date) {
    setState(() {
    controller.  seedate = date; // or seedate = date depending on which one you're setting
    });
  },
  initialDate:controller. seedate, // or seedate
  isStartDate: true, // or false for seedate
)
                                  ],
                                ),
                              ),
                              Container(
                                width: columnWidth,
                                height: 76,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'تاريخ فتح الامتحان',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                Calenderpick2(
  onDateSelected: (date) {
    setState(() {
    controller.  seedate = date; // or seedate = date depending on which one you're setting
    });
  },
  initialDate:controller. seedate, // or seedate
  isStartDate: true, // or false for seedate
)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: dialogWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: dialogWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'اختار شكل الكارت',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 6, 69, 152)),
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'اختار شكل كارت اللي يناسب استخدامك في العمل الامتحانات بكل سهولة ودقة!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 80, 124, 181)),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: dialogWidth * 0.3, // Adjust width for the image row
                                child:InkWell(child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/Component 170.png', width: 93, height: 109),
                                    // Image.asset('assets/Component 171.png', width: 93, height: 109),
                                    // Image.asset('assets/Component 171.png', width: 93, height: 109),
                                  ],
                                ),
                              onTap: (){
                                // controller.gloabalsection();
                                //         List.generate(controller.allsections.length, (index) {
                                //           print('http://localhost:3000/${controller.allsections[index].cardimg}');
                                //         });
                                        controller.pickAndUploadImage3();
                              },
                              ),)
                           
                            ],
                          ),
                        ),  
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [  
               Container( width: 193,height: 40,
               
               child: 
                              TextButton(
                                
                                style: TextButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 6, 69, 152),
                                     padding: EdgeInsets.all(8)
                                     ,shape:RoundedRectangleBorder( borderRadius:BorderRadius.circular(8))
                                ),
                                onPressed: (){
controller.uploadcard3online(context);

                              }, child: Text("بدا عمل الامتحان",style: TextStyle(color: Colors.white),)))      ],
                    ),
                ])),
                ],
              ),
            ),
          );
        },
      ),
    );
  });}

  Widget _buildTextField(String label, String hint,controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 8),
        TextField(
          textAlign: TextAlign.right
      ,  controller:controller
         , textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),),
            hintText: hint,
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 125, 140, 158),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}