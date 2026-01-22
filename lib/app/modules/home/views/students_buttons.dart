import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';

class StudentsButtons extends StatefulWidget {
  const StudentsButtons({super.key});

  @override
  State<StudentsButtons> createState() => _StudentsButtonsState();
}

class _StudentsButtonsState extends State<StudentsButtons> {
  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
HomeController controller =HomeController();
    bool isDesktop = screenWidth > 1200;
    bool isTablet = screenWidth > 768 && screenWidth <= 1200;
    bool isMobile = screenWidth <= 768;
    return  Container(
                                                          height: 44,
                                                          width: isDesktop
                                                              ? 180
                                                              : isTablet
                                                                  ? screenWidth *
                                                                      0.8
                                                                  : screenWidth *
                                                                      0.9,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              8)),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      6,
                                                                      69,
                                                                      152)),
                                                          child: InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .courseStudentType(
                                                                      'center');
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  'طلاب السنتر',
                                                                  style: TextStyle(
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          210,
                                                                          203,
                                                                          219,
                                                                          238),
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                ),
                                                                Image.asset(
                                                                  'assets/Frame (2).png',
                                                                  width: 30,
                                                                  height: 30,
                                                                )
                                                              ],
                                                            ),
                                                          ));
  }
}