import 'package:flutter/material.dart';
import 'package:flutterwallet/Applinks.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/popup.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:flutterwallet/app/modules/home/views/studentsdetails.dart';
import 'package:flutterwallet/app/modules/home/views/title.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'service.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  final HomeController controller = HomeController();
  final TextEditingController searchController = TextEditingController();
  String query = '';









  void search(String query) async {
    final result = await controller.searchStudentss(query);
    setState(() {
      controller.students = result;
      print('mm${controller.students}');
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isDesktop = screenWidth > 1200;
    bool isTablet = screenWidth > 768 && screenWidth <= 1200;
    bool isMobile = screenWidth <= 768;

    return Scaffold(
      drawer: isMobile
          ? Drawer(
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
            )
          : null,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 96,
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop
                              ? 64
                              : isTablet
                                  ? 32
                                  : 16,
                        ),
                        child: App_bar(),
                      ),
                      SizedBox(height: 16),
                      Center(
                          child: Container(
                              width: isDesktop
                                  ? 1032
                                  : isTablet
                                      ? screenWidth * 0.8
                                      : screenWidth * 0.9,
                              margin: EdgeInsets.all(24),
                              child: Wrap(
                                  spacing: 24,
                                  runSpacing: 16,
                                  children: [
                                    _buildCard(),
                                    _buildCard2(controller),
                                    _buildCard3(),
                                    Container(
                                        width: isDesktop
                                            ? 1032
                                            : isTablet
                                                ? screenWidth * 0.8
                                                : screenWidth * 0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        padding:
                                            EdgeInsetsDirectional.symmetric(
                                                vertical: 24),
                                        child: Column(children: [
                                         Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color.fromARGB(211, 6, 69, 152),
            width: 1
          )
        ),
        width: isDesktop ? 543 : isTablet ? screenWidth * 0.8 : screenWidth * 0.9,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: controller.selectedTypes == 'center' 
                    ? Color.fromARGB(255, 6, 69, 152)
                    : Color.fromARGB(210, 203, 219, 238),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      
                    controller.courseStudentType('center');
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'طلاب السنتر',
                        style: TextStyle(
                          color: controller.selectedType == 'center'
                            ? Color.fromARGB(210, 203, 219, 238)
                            : Color.fromARGB(211, 6, 69, 152), 
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Image.asset(
                        'assets/Frame (2).png',
                        width: 30,
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    
                  controller.courseStudentType('online');
                  });
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: controller.selectedTypes == 'online'
                      ? Color.fromARGB(255, 6, 69, 152) 
                      : Color.fromARGB(210, 203, 219, 238), 
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'طلاب الاونلاين',
                        style: TextStyle(
                          height: 25 / 14,
                          color: controller.selectedTypes == 'online'
                            ? Color.fromARGB(210, 203, 219, 238) 
                            : Color.fromARGB(211, 6, 69, 152),
                          fontFamily: 'Teshrin AR+LT',
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Image.asset(
                        'assets/Frame (4).png',
                        width: 30,
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            // All Students Button
            Expanded(
              child: Container(
                height: 44,
                padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: controller.selectedTypes.value == 'all'
                    ? Color.fromARGB(255, 6, 69, 152) 
                    : Color.fromARGB(210, 203, 219, 238),
                ),
                child: InkWell(
                  onTap: () {
                      
                    setState(() {
                    controller.courseStudentType('all');
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'كل الطلاب',
                        style: TextStyle(
                          fontFamily: 'Teshrin AR+LT',
                          color: controller.selectedTypes == 'all'
                            ? Color.fromARGB(210, 203, 219, 238) 
                            : Color.fromARGB(211, 6, 69, 152), 
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Image.asset(
                        'assets/Frame (3).png',
                        width: 30,
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ]
  )
)
                           ,               Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  24, 16, 24, 16),
                                              width: isDesktop
                                                  ? 1032
                                                  : isTablet
                                                      ? screenWidth * 0.8
                                                      : screenWidth * 0.9,
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: isDesktop
                                                          ? 984
                                                          : isTablet
                                                              ? screenWidth *
                                                                  0.8
                                                              : screenWidth *
                                                                  0.9,
                                                      height: 18,
                                                      child: Text(
                                                        'أختر المجموعة',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.125,
                                                            fontSize: 18),
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                Container(
                                                  child: Container(
                                                    height: 44,
                                                    width: isDesktop
                                                        ? 984
                                                        : isTablet
                                                            ? screenWidth * 0.8
                                                            : screenWidth * 0.9,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          232,
                                                                          232,
                                                                          232))),
                                                          width: isDesktop
                                                              ? 312
                                                              : isTablet
                                                                  ? screenWidth *
                                                                      0.8
                                                                  : screenWidth *
                                                                      0.9,
                                                          height: 44,
                                                          padding: EdgeInsets
                                                              .fromLTRB(14, 10,
                                                                  14, 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(Icons
                                                                  .more_horiz),
                                                              Text('كل السناتر')
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 24,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          232,
                                                                          232,
                                                                          232))),
                                                          width: isDesktop
                                                              ? 312
                                                              : isTablet
                                                                  ? screenWidth *
                                                                      0.8
                                                                  : screenWidth *
                                                                      0.9,
                                                          height: 44,
                                                          padding: EdgeInsets
                                                              .fromLTRB(14, 10,
                                                                  14, 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(Icons
                                                                  .more_horiz),
                                                              Text('كل السناتر')
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 24,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          232,
                                                                          232,
                                                                          232))),
                                                          width: isDesktop
                                                              ? 312
                                                              : isTablet
                                                                  ? screenWidth *
                                                                      0.8
                                                                  : screenWidth *
                                                                      0.9,
                                                          height: 44,
                                                          padding: EdgeInsets
                                                              .fromLTRB(14, 10,
                                                                  14, 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(Icons
                                                                  .more_horiz),
                                                              Text('كل السناتر')
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ])),
                                          Container(
                                              width: isDesktop
                                                  ? 1030
                                                  : isTablet
                                                      ? screenWidth * 0.8
                                                      : screenWidth * 0.9,
                                              height: 68,
                                              child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      24, 12, 24, 12),
                                                  child: Container(
                                                    height: 44,
                                                    width: 852,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width: 330,
                                                          height: 44,
                                                          child: TextField(
                                                            controller: searchController,
                                                            onChanged: (value) {
                                                              // query = value;
                                                             controller.searchStudents(value
                                                             );
                                                              if (value.isEmpty) {
                                                                controller.allstudents();
                                                              } else {
                                                                search(value);
                                                              }
                                                            },
                                                            textDirection:
                                                                TextDirection.rtl,
                                                            decoration:
                                                                InputDecoration(
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      width:
                                                                          0.5,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          187,
                                                                          163,
                                                                          163))),
                                                              fillColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      245,
                                                                      245,
                                                                      245),
                                                              suffixIcon: Icon(
                                                                  Icons.search),
                                                              hintText:
                                                                  'ابحث عن اسم , رقم , ايميل الطالب',
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'الطلاب (${controller.students.length})',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18,
                                                              height: 1.125),
                                                          textAlign:
                                                              TextAlign.right,
                                                        )
                                                      ],
                                                    ),
                                                  ))),
                                          SingleChildScrollView(
                                              child: Container(
                                                  width: 1030,
                                                  height: 450,
                                                  child: Column(children: [
                                                    Row(
                                                      children: [title()],
                                                    ),
                                                    Expanded(
                                                        child:
                                                            SingleChildScrollView(
                                                      child: Column(
                                                        spacing: 8,
                                                        children: [
                                                          ...List.generate(
                                                              controller
                                                                  .students
                                                                  .length,
                                                              (index) {
                                                                final lessons = controller.students[index].lesson ?? [];

int lessonPercent(int index) {
  final lessons = controller.students[index].lesson;
  if (lessons == null || lessons.isEmpty) return 0;
  return lessons.first['percentage'] ?? 0;
}



                                                            return InkWell(
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) 
                                                                           { 
                                                                            
                                                                            print('num${controller.students[index].id}');
                                                                           String name= controller.students[index].name.toString();
                                                                  controller.fetchStudent('${controller.students[index].id}');
                                                                             return Studentsdetails(name:name,studentId:controller.students[index].id);
                                                                             }));
                                                                    controller  .findonestudent(
                                                                          '${controller.students[index].id}');
                                                                },
                                                                child:
                                                                    Container(
                                                                        width:
                                                                            1010,
                                                                        height:
                                                                            72,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.black.withOpacity(0.05),
                                                                              offset: Offset(0, 3),
                                                                              blurRadius: 13,
                                                                              spreadRadius: 0,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Container(width: 73, height: 72, decoration:
                                                                               BoxDecoration(color: Colors.white), child: popup()),
                                                                              Container(
                                                                                width: 106,
                                                                                height: 72,
                                                                                decoration: BoxDecoration(color: Colors.white),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                        width: 58,
                                                                                        height: 29,
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color.fromARGB(223, 233, 241, 238)),
                                                                                        padding: EdgeInsets.all(4),
                                                                                        child: controller.students[index].attendance == true 
                                                                                            ? Row(
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'حضر',
                                                                                                    style: TextStyle(color: Color.fromARGB(255, 39, 114, 83)),
                                                                                                  ),
                                                                                                  Image.asset(
                                                                                                    'icons/tick-circle.png',
                                                                                                    width: 16,
                                                                                                    height: 16,
                                                                                                  )
                                                                                                ],
                                                                                              )
                                                                                            : Row(
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'حضر',
                                                                                                    style: TextStyle(color: Colors.red),
                                                                                                  ),
                                                                                                  Image.asset(
                                                                                                    'icons/tick-circle.png',
                                                                                                    width: 16,
                                                                                                    height: 16,
                                                                                                    color: Colors.red,
                                                                                                  )
                                                                                                ],
                                                                                              ))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                  width: 214,
                                                                                  padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                                                                                  decoration: BoxDecoration(color: Colors.white),
                                                                                  height: 72,
                                                                                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                                    Text(
                                                                                      'لا يوجد بريد الكتروني',
                                                                                      textAlign: TextAlign.right,
                                                                                    ),
                                                                                  ])),
                                                                              Container(
                                                                                width: 205,
                                                                                decoration: BoxDecoration(color: Colors.white),
                                                                                height: 72,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: [
                                                                                    Text('%${controller.percent[index]}'),
                                                                                    new LinearPercentIndicator(width: 100.0, lineHeight: 8.0, barRadius: Radius.circular(16), percent:controller.percent[index] / 100, alignment: MainAxisAlignment.start, isRTL: true, progressColor: Color.fromARGB(230, 6, 69, 152)),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 145,
                                                                                height: 72,
                                                                                decoration: BoxDecoration(color: Colors.white),
                                                                                child: Container(
                                                                                    width: 91,
                                                                                    height: 40,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          'اسم العميل',
                                                                                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, height: 17.5 / 14, fontFamily: 'Teshrin AR+LT'),
                                                                                        ),
                                                                                        Text(
                                                                                          '${controller.students[index].Guardian}',
                                                                                          style: TextStyle(color: Colors.grey, fontFamily: 'Teshrin AR+LT', height: 15 / 4, fontSize: 12, fontWeight: FontWeight.w500),
                                                                                        )
                                                                                      ],
                                                                                    )),
                                                                              ),
                                                                              Container(
                                                                                width: 187,
                                                                                height: 72,
                                                                                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                                                                decoration: BoxDecoration(color: Colors.white),
                                                                                child: Container(
                                                                                  width: 139,
                                                                                  height: 40,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Column(children: [
                                                                                        Text(
                                                                                          '${controller.students[index].name}',
                                                                                          textAlign: TextAlign.right,
                                                                                          style: TextStyle(fontFamily: 'Teshrin AR+LT',
                                                                                           fontWeight: FontWeight.w500, fontSize: 14, 
                                                                                           height: 17.5 / 14),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 8,
                                                                                        ),
                                                                                        Text(
                                                                                          '${controller.students[index].Guardian}',
                                                                                          style: TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Teshrin AR+LT', fontWeight: FontWeight.w500, height: 15 / 14),
                                                                                        )
                                                                                      ])
                                                                                      // ],))
                                                                                      ,
                                                                                      SizedBox(width: 8),
                                                                                      Container(
                                                                                        width: 40,
                                                                                        height: 40,
                                                                                        child: CircleAvatar(
                                                                                          radius: 24,
                                                                                          backgroundImage: NetworkImage('${Applinks.baseurl}/${controller.students[index].img}'),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                  width: 80.0,
                                                                                  height: 72.0,
                                                                                  padding: EdgeInsets.fromLTRB(8, 18, 8, 18),
                                                                                  child: Text(
                                                                                    '${controller.students[index].code}',
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Teshrin AR+LT',
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      height: 24.0 / 14.0, // line-height / font-size

                                                                                      decorationStyle: TextDecorationStyle.solid,
                                                                                      textBaseline: TextBaseline.alphabetic,
                                                                                    ),
                                                                                    textAlign: TextAlign.left,
                                                                                  ),
                                                                                  // padding:  EdgeInsets.fromLTRB(24, 18, 24, 18),

                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                  )),
                                                                              SizedBox(
                                                                                height: 8,
                                                                              )
                                                                            ]//)
                                                                            )));
                                                                            // );
                                                          }),
                                                        ],
                                                      ),
                                                    )),
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
               controller.studentexam(controller.currentPage);
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
     
 
        Container(
          // width: 292,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageNumbers(controller),
          ),
        ),

        GestureDetector(
          onTap: () {
            if (controller.currentPage < controller.totalPages) {
              controller.currentPage++;
           controller.studentexam(controller.currentPage);
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
                                            
                                                    // _buildPagination(controller)
                                                  ]))),
                                        ]))
                                  ]))),
                    ],
                  ),
                ),
              ),
              if (!isMobile)
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

  Widget _buildCard() {
    return Container(
        width: 328,
        height: 137,
        padding: EdgeInsets.only(top: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Frame (7).png',
                      width: 38.75, height: 31.25),
                  Text(
                    'مستوي التقدم',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'في 3 مجموعات',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '80%',
                    style: TextStyle(
                      color: Color.fromARGB(253, 242, 149, 42),
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildCard2( HomeController controller) {
    return Container(
        width: 328,
        height: 137,
        padding: EdgeInsets.only(top: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Frame (6).png',
                      width: 38.75, height: 31.25),
                  Text(
                  'نسبة الحضور',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'في 3 مجموعات',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 8),
                  Text(
                
  '${controller.students.isEmpty 
  ? "0.00" 
  : ((controller.students.where((e) => e.attendance == true).length / controller.students.length) * 100)
}%'
,

//+'${(n.attendance == false)}%',
                    style: TextStyle(
                      color: Color.fromARGB(255, 39, 114, 83),
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ));
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
          controller.studentexam(controller.currentPage);
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

  Widget _buildCard3() {
    return Container(
        width: 328,
        height: 137,
        padding: EdgeInsets.only(top: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Frame (5).png',
                      width: 38.75, height: 31.25),
                  Text(
                    'عدد الطلاب',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'في 3 مجموعات',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 8),
                  
                  Text(
                    '${controller.student.id.toString().length+1??0}',
                    style: TextStyle(
                      color: Color.fromARGB(218, 6, 69, 152),
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ));
  }



  Widget _buildPagination(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (controller.currentPage > 1) {
              controller.currentPage--;
              controller.studentexam(controller.currentPage);
              controller.update();
            }
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: controller.currentPage > 1
                  ? Colors.blue
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.arrow_back,
              color: controller.currentPage > 1 ? Colors.white : Colors.black,
            ),
          ),
        ),
        ...List.generate(controller.totalPages, (index) {
          final pageIndex = index + 1;
          return GestureDetector(
            onTap: () {
              controller.currentPage = pageIndex;

              controller.studentexam(controller.currentPage);
              controller.update();
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: pageIndex == controller.currentPage
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
        GestureDetector(
          onTap: () {
            if (controller.currentPage < controller.totalPages) {
              controller.currentPage++;
              controller.studentexam(controller.currentPage);
              controller.update();
            }
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: controller.currentPage < controller.totalPages
                  ? Colors.blue
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: controller.currentPage < controller.totalPages
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
