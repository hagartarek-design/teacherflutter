import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/homescreen.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';
import 'package:flutterwallet/app/modules/home/views/homescreen.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';
import 'package:flutterwallet/app/modules/home/views/homescreen.dart';
import 'package:get/get.dart';

class App_bar extends StatelessWidget {
  const App_bar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 24,
                height: 24,
                child: Image.asset('icons/notification-bing.png'),
              ),
              SizedBox(width: 1),

              Flexible(
                flex: screenWidth > 600 ? 1 : 2,
                child: Container(
                  height: 48.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'عمرو سمسر',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                'فزياء',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          controller.allimages();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homescreen()),
                          );
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage('${controller.img}') == null
                                ? NetworkImage('${controller.img2}')
                                : NetworkImage('${controller.img}'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 24),

              if (screenWidth > 600)
                Expanded(
                  flex: screenWidth > 800 ? 6 : 4,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade100,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 24, 0),
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 245, 245, 245),
                                suffixIcon: Icon(Icons.search),
                                hintText: 'ابحث عن ما تريد',
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),

                      // Fixed Grade Dropdown
                      Expanded(
                        child: Container(
                          height: 48,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: SizedBox(),
                            value: controller.selectedGrade?.isNotEmpty == true 
                                ? controller.selectedGrade 
                                : null, // Allow null if no selection
                            icon: Icon(Icons.arrow_drop_down),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.selectedGrade = newValue;
                                controller.update();
                                controller.fetchcoursedata(
                                  controller.selectedName ?? '',
                                  controller.selectedGrade ?? ''
                                );
                              }
                            },
                            items: [
                              // Add a default hint item
                              DropdownMenuItem<String>(
                                value: null,
                                enabled: false,
                                child: Text(
                                  'اختر الصف',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              ...controller.grades.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),

                      // Fixed Name Dropdown
                      Expanded(
                        child: Container(
                          height: 48,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: SizedBox(),
                            value: controller.selectedName?.isNotEmpty == true 
                                ? controller.selectedName 
                                : null, // Allow null if no selection
                            icon: Icon(Icons.arrow_drop_down),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.selectedName = newValue;
                                controller.update();
                                controller.fetchcoursedata(
                                  controller.selectedName ?? '',
                                  controller.selectedGrade ?? ''
                                );
                              }
                            },
                            items: [
                              // Add a default hint item
                              DropdownMenuItem<String>(
                                value: null,
                                enabled: false,
                                child: Text(
                                  'اختر الاسم',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                                ...controller.names.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(width: 12),

              Container(
                width: 24,
                height: 24,
                child: Image.asset('icons/Menu_Icons_UIA.png'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Fixed _buildDropdownField method
  Widget _buildDropdownField(
    controller,
    bool isMobile,
    String hint,
    Rx<String?> value,
    List<Course> items,
    Function(String?) onChanged,
  ) {
    controller.fetchSAllCourses();
    return Container(
      width: isMobile ? 263 : 552,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 16),
          Container(
            height: 44,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownButtonFormField<String?>(
                value: value.value,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hint,
                  hintTextDirection: TextDirection.rtl,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 154, 175, 228),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 154, 175, 228),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(255, 6, 69, 152),
                ),
                isExpanded: true,
                items: [
                  DropdownMenuItem<String?>(
                    value: null,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        hint,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 154, 175, 228),
                        ),
                      ),
                    ),
                  ),
                  ...items.map((Course course) {
                    return DropdownMenuItem<String?>(
                      value: course.name ?? 'Unknown',
                      child: Text(
                        course.name ?? 'Unknown',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 154, 175, 228),
                        ),
                      ),
                    );
                  }).toList(),
                ],
                onChanged: (newValue) {
                  onChanged(newValue);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class App_bar extends StatelessWidget {
//   const App_bar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return GetBuilder<HomeController>(
//       init: HomeController(),
//       builder: (controller) {
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 12),
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 24,
//                 height: 24,
//                 child: Image.asset('icons/notification-bing.png'),
//               ),
//               SizedBox(width: 1),

//               Flexible(
//                 flex: screenWidth > 600 ? 1 : 2,
//                 child: Container(
//                   height: 48.0,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           padding: EdgeInsets.only(right: 8),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 'عمرو سمسر',
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.right,
//                               ),
//                               Text(
//                                 'فزياء',
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   color: Colors.grey,
//                                 ),
//                                 textAlign: TextAlign.right,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
// InkWell(
//   onTap: (){controller.allimages();
//     // print('http://localhost:3000/${controller.users.url}');
//     Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Homescreen()),);
//   },
//   child: 
//                       Container(
                        
//                         width: 48,
//                         height: 48,
//                         child: CircleAvatar(
                          
//                           radius: 24,
//                           backgroundImage: NetworkImage('${controller.img}')==null
//                           ? NetworkImage('${controller.img2}'): NetworkImage('${controller.img}'),
//                         ),
//                       ),)
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 24),

//               if (screenWidth > 600)
//                 Expanded(
//                   flex: screenWidth > 800 ? 6 : 4,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           height: 48,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade100,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: Colors.grey.shade100,
//                               width: 1,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.fromLTRB(35, 0, 24, 0),
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               decoration: InputDecoration(
//                                 fillColor: Color.fromARGB(255, 245, 245, 245),
//                                 suffixIcon: Icon(Icons.search),
//                                 hintText: 'ابحث عن ما تريد',
//                                 border: InputBorder.none,
//                               ),
//                               textAlign: TextAlign.right,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 12),

//                       Expanded(
//                         child: Container(
//                           height: 48,
//                           child: DropdownButton<String>(
//                             isExpanded: true,
//                             underline: SizedBox(),
//                             value: controller.selectedGrade,
//                             icon: SizedBox(),
//                             onChanged: (String? newValue) {
//                               controller.selectedGrade = newValue!;
//                               controller.update();
//                                 controller.fetchcoursedata(controller.selectedName, 
//                               controller.selectedGrade
//                               );
//                             },
//                             items: controller.grades.map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Icon(Icons.arrow_drop_down, size: 20),
//                                     SizedBox(width: 8),
//                                     Text(
//                                       value,
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 12),

//                       Expanded(
//                         child: Container(
//                           height: 48,
//                           child: DropdownButton<String>(
//                             isExpanded: true,
//                             underline: SizedBox(),
//                             value: controller.selectedName,
//                             icon: SizedBox(),
//                             onChanged: (String? newValue) {
//                               controller.fetchcoursedata(controller.selectedName, 
//                               controller.selectedGrade
//                               );
//                               controller.selectedName = newValue!;
//                               controller.update();
//                             },
//                             items: controller.names.map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Icon(Icons.arrow_drop_down, size: 20),
//                                     SizedBox(width: 8),
//                                     Text(
//                                       value,
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               SizedBox(width: 12),

//               Container(
//                 width: 24,
//                 height: 24,
//                 child: Image.asset('icons/Menu_Icons_UIA.png'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
