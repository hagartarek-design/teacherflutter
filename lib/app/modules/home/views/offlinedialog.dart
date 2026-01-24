import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen2.dart';
import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
import 'package:flutterwallet/app/modules/home/views/dropdown.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:flutterwallet/app/modules/home/views/stabledropdown.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class dialogoffline extends StatefulWidget {
  const dialogoffline({super.key});

  @override
  State<dialogoffline> createState() => _dialogquizesState();
}

class _dialogquizesState extends State<dialogoffline> {
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
              MaterialPageRoute(builder: (context) => DashboardScreen2()),
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
                    },
                  ),
                                SizedBox(width: 8),
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
                                    CustomDropdown(),
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
                                    CustomDropdown(),
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
controller.uploadcard3offline(context,);

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