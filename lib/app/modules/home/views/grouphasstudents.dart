import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'dart:ui' as ui;
  

// ignore: must_be_immutable
class groupHasStudents extends StatelessWidget {
   groupHasStudents({super.key ,required this.course});
  final HomeController controller = HomeController();
  String dropdownValue = 'Option 1';
  final Course course;
  List<String> items = ['Option 1', 'Option 2', 'Option 3'];

  Uint8List? image;

// void _selectFile() async {

// final FilePickerResult? result = await FilePicker.platform.pickFiles();

// if (result != null) {

// // setState(() {
// selectedFile = result.files.first.name;
// print(selectedFile);
// controller.addfile(result.toString());
// // });
// }}
  String? selectedValue;
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
                      fontWeight: FontWeight.bold),
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
                  child: SingleChildScrollView(
                child: Column(children: [
                
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    width: 1032,
                    height: 874,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      spacing: 24,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 984,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 24 , children: [
                            Text('المجموعة (1)',style: TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 24
                            ),)
                          ],),
                         ),
                     
                        Container(
                          width: 984, //height: 702,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.only(top: 24),
                          child: Column(
                            spacing: 24,
                            children: [
                              Container(
                                width: 982,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                    // padding:EdgeInsets.fromLTRB(16, 8, 16, 8) ,
                                      width: 136,height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 6, 69, 152)),
                                      ),
                                      child:
                                      
                                      InkWell(
                                        onTap: (){
                                          // print('idd${controller.coursemanager.map((toElement)=>{toElement.id}).toString()}');
            // controller.controlcenter(controller.currentPage,controller.coursemanager.map((toElement)=>{toElement.id}).toString());
           showDialog(context: context, builder: (context){
return AlertDialog(
  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
  content: Container(height: 276,
  decoration: BoxDecoration(borderRadius:
   BorderRadius.circular(16),color: 
   Colors.white,),child:Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [ Column
   (spacing: 10,
  crossAxisAlignment: CrossAxisAlignment.start,
   children: [
    InkWell(
      onTap: (){
Navigator.pop(context);
    // Navigator.push(context,MaterialPageRoute (builder: (context) {return groupHasStudents();}   ));
      },
      child: 
 Image.asset('assets/close-circl.png',width: 24,height: 24,)
    ),
 Container(
  width: 455,
  child: 
 Text('اضافه طالب جديد',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 32,fontWeight: FontWeight.w600,
 ),textAlign: TextAlign.end,))

 ,Container(
  width: 453,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
  Text('الكود',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
  TextField(textDirection: ui.TextDirection.rtl
  ,decoration: InputDecoration( 
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey,width: 1)
    ),
    hintTextDirection:
  ui. TextDirection.rtl , hintText: 'ادخل الكود',hintStyle: 
  TextStyle(color: Colors.grey)),)

 
 ],),
 
   )
   ,Container(width: 193,height: 40,child:TextButton(onPressed: (){}, 
   child: Text('خفظ',style: TextStyle(color: Colors.white ,fontSize: 18,fontWeight: FontWeight.w500),)
   
   ,style: TextButton.styleFrom(backgroundColor:Color.fromARGB(255, 6, 69, 152)
   ,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8) )
    ),
   ),)
   ])])));
             });
        
                                        },
                                       child: Row(
                                        
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text(
                                              'أضف طالب جديد',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color.fromARGB(
                                                      255, 6, 69, 152)),
                                            ),
                                          
                                         Image.asset("assets/add-square.png",
                                                width: 20, height: 20)
                                  ]))),
                                    
                                                            Container(width: 797,
                                                            
                                                            child: Row(
                                                              
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                           
                                    Container(
                                                              width: 266,
                                                              height: 44,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                spacing: 12,
                                                                children: [
                                                                  Container(
                                                                    width: 266,
                                                                    child:
                                                                        TextField(
                                                                      textDirection: ui
                                                                          .TextDirection
                                                                          .rtl,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        enabledBorder:
                                                                            OutlineInputBorder(borderSide: 
                                                                            BorderSide(width: 0.5, color: 
                                                                            const Color.
                                                                            fromARGB(255, 187, 163, 163))),
                                                                        fillColor: Color.fromARGB(
                                                                            255,
                                                                            245,
                                                                            245,
                                                                            245),
                                                                        suffixIcon:
                                                                            Icon(Icons.search),
                                                                        hintText:
                                                                            'ابحث عن اسم , رقم , ايميل الطالب',
                                                                        border:
                                                                            InputBorder.none,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                    ),
                                                                  )
                                                                  //   TextField(

                                                                  //     decoration: InputDecoration(
                                                                  //       hintText: 'ابحث عن اسم الامتحان او الدرس'
                                                                  //       ,hintStyle:TextStyle(fontWeight: FontWeight
                                                                  //       .w400,fontSize: 16,color: Color.fromARGB
                                                                  //       (255, 140, 140, 140)) ,icon: Image.asset('')
                                                                  //     ),
                                                                  //   )
                                                                ],
                                                              ),
                                                            ),   
                                                              Text('(15) الطلاب',style: TextStyle(
                                                                
                                                                fontWeight: FontWeight.w500,fontSize: 18),)
                                                            ],),
                                                            )
                                  ],
                                ),
                              ),
                          
                              Container(
                                width: 984,
                                height: 95,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Container(
                                      //     height: 95,
                                      //     // padding: EdgeInsets.fromLTRB(
                                      //     //     24, 12, 24, 12),
                                      //     width: 100,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.only(
                                      //           topRight: Radius.circular(8),
                                      //           bottomRight:
                                      //               Radius.circular(8)),
                                      //     ),
                                      //     child: Row(
                                      //       spacing: 12,
                                      //       children: [Text('المستوي')],
                                      //     )),
                                      Container(
                                          height: 95,
                                          // padding: EdgeInsets.fromLTRB(
                                          //     24, 12, 24, 12),
                                          width: 380,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                            spacing: 12,
                                            children: [Text('البريد الالكتروني',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)],
                                          )),
                                      Container(
                                          height: 95,
                                          // padding: EdgeInsets.fromLTRB(
                                          //     24, 12, 24, 12),
                                          width: 145,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            spacing: 12,
                                            children: [Text('ولي الامر (الاب)',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)],
                                          )),
                                      Container(
                                          height: 95,
                                          // padding: EdgeInsets.fromLTRB(
                                          //     24, 12, 24, 12),
                                          width: 143,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            spacing: 12,
                                            children: [Text('ولي الامر (الام)',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)],
                                          )),
                                      Container(
                                          height: 95,
                                          // padding: EdgeInsets.fromLTRB(
                                          //     24, 12, 24, 12),
                                          width: 187,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            spacing: 12,
                                            children: [Text('أسم الطالب',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)],
                                          )),
                                      // Container(
                                      //     height: 95,
                                      //     padding: EdgeInsets.fromLTRB(
                                      //         24, 12, 24, 12),
                                      //     width: 123,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.only(
                                      //           topRight: Radius.circular(8),
                                      //           bottomRight:
                                      //               Radius.circular(8)),
                                      //     ),
                                          // child:
                                    
                                      Container(
                                          height: 95,
                                          // padding: EdgeInsets.fromLTRB(
                                          //     24, 12, 24, 12),
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8)),
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            spacing: 12,
                                            children: [Text('الاكواد',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)],
                                          )),//)
                                    ]),
                              ),
//  ...List.generate(controller.stu.student?.length ?? 0,(index){
                      //  return
                              Container(
                                width: 984,
                                height: 72,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        offset: Offset(0, 3),
                                        blurRadius: 13,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                spacing: 12,  children: [
                                
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                        
                                      
// Container(width: 127 ,child:Container( width: 117,height: 50
// , child:  TextButton(  style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
// ),
// side: BorderSide(width: 1,color: Color.fromARGB(255, 6, 69, 152)),padding: EdgeInsets.all(16)
// ), child:Text('شوف التفاصيل' ,style: TextStyle(color:Color.fromARGB(255, 6, 69, 152) ),) ,onPressed: (){},))),
// Container(
  
//   width: 100,height: 72 ,child:Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [ Text('ناجح',style: TextStyle(color: Colors.green),),])),

//                                     Container( width: 205,decoration: BoxDecoration(color: Colors.white)
// ,height: 72,child: Row(
  
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//   Text('%90'),
//  new LinearPercentIndicator(
//                     width: 100.0,
//                     lineHeight: 8.0,barRadius: Radius.circular(16),
//                     percent: 0.9
//                     ,alignment:MainAxisAlignment.start,isRTL: true,
//                     progressColor: Color.fromARGB(230, 6, 69, 152)
//                   ),

// ],),),
//  Container(child: ,),




  Container( width: 380, child:Row(
                          
mainAxisAlignment: MainAxisAlignment.end,
children: [                           

    // Text('${controller.stu.student?[index]['email']??"n/a"}')


]
                               
                                
   ) ),

Container(
  width: 145,height: 72,
  child: Row(children: [

Container(
  width: 145,height: 72,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [

// ...List.generate(controller.coursemanager.length,(index){
// return

Container(
width: 145,height: 72,
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
  Text('اسم العميل')
// ,Text('+(02)${controller.coursemanager[index]. students?[index]['email']??"n/a"}',style: TextStyle(  color: Colors.grey ),)
],),
)
// })

])),
])),
Container(
  width: 145,height: 72,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [

// ...List.generate(controller.coursemanager.length,(index){
 Container(
width: 145,height: 72,
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [

  // Text('${controller.coursemanager[index].students?[index]['parent1']}'),
Text('+(02)1125134370',style: TextStyle(  color: Colors.grey ),)
],),
)
// })
])),

]),
                                                                   Container( width: 187,height: 72,
                
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                decoration: BoxDecoration(color:Colors.white)
                ,child:Container(width: 139,height: 40,child:  
                Row(
                crossAxisAlignment: CrossAxisAlignment.end,  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
//  Container(width: 91,height: 40,
                      // child:
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                      //  Text('${controller.stu.student?[index]['name']}',textAlign: TextAlign.right
                      //  ,style: TextStyle(fontFamily: 'Teshrin AR+LT'
                      //  ,fontWeight:FontWeight.w500,
                      //  fontSize: 14
                      //  ,height:17.5/14 
                       
                      //  ),
                       
                      //  )
                      //  ,
                       SizedBox(height: 8,),
                  // Text('+(02)${controller.coursemanager[index].students?[index]['phoneNum']}',style: TextStyle(
                  //        color: Colors.grey 
                  //         ,fontSize: 12,fontFamily: 'Teshrin AR+LT',
                  //       fontWeight: FontWeight.w500 
                  //       ,height: 15/14
                  //       ))
                        ])
                      // ],)) 
                ,SizedBox(width:8),
                //  Container(
                //         width: 40,
                //         height: 40,
                //         child: CircleAvatar(
                          
                //           radius: 24,
                //           backgroundImage: NetworkImage('${Applinks.baseurl}/${controller.stu.student?[index]['img'].toString()}'),
                //         ),
                //       ),
                   
                   
                   
                     ],)
                ,),),
                                   Container(
                                      width: 100,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                      ),
                                    // padding: EdgeInsets.fromLTRB(24, 18, 24, 18),
                                child:Container(height: 72, 
                                child:Row(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [  
                                    // Text('${controller.stu.student?[index]['code']}')
                                    ])),
                                    )
                                    ,
                                  
                                
                                  ],
                                ),
// );}
 )
                             

                            ],
                          ),
                        ),
// Container(
//   width: MediaQuery.of(context).size.width, // full width
//   height: 67,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.only(
//       bottomLeft: Radius.circular(16),
//       bottomRight: Radius.circular(16),
//     ),
//   ),
//                     child: 
// _buildPagination(controller))
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
            controller.students2.map((f)=>f.id.toString());
    // controller.currentPage = page;
          //  var id= controller.students2.map((f)=>f.id.toString());
          // controller .Studentsbycourse(context,course.id.toString(),page:controller.currentPage);
              // controller.studentexam(controller.currentPage);
              print( controller.currentPage);
              controller.update();
            }
          },
          child: Container(
            width: 95,
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset('icons/arrow-left.png', width: 20, height: 20,color:controller.currentPage <
                 controller.totalPages  ?Colors.black 
                  : Colors.blue,) ,  const SizedBox(width: 4), Text(
                  'السابق',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,color: controller.currentPage < controller.totalPages
               ? Colors.black
                  :Colors.blue ,
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
            children: _buildPageNumbers(controller,course,context),
          ),
        ),

        // زر السابق
        GestureDetector(
          onTap: () {
            if (controller.currentPage < controller.totalPages) {
              controller.currentPage++;
          // print('students44${ controller.students2.map((f)=>f.id.toString())}' );
          
        // var id= controller.students2.map((f)=>f.id.toString());
        // var id = controller.students2.map((f)=>f.id.toString());
        print(course.id);
        print(controller.currentPage);
//  controller .Studentsbycourse(context, course.id.toString(),page:controller.currentPage);
          // controller .fetchStudent('$id',page:controller.currentPage);
              // controller.studentexam(controller.currentPage);
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
                ),    const SizedBox(width: 4), 
                 Image.asset('icons/Icon.png', width: 20, height: 20,
                 color: controller.currentPage < controller.totalPages
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
                  )
                ]),
              ))
            ],
          );
        },
      ),
    );
  }

}

String dropdownValue = 'ادخل السنه الدراسيه';

List<String> list = ['ادخل السنه الدراسيه', 'Item 2', 'Item 3'];
Widget buildDropdownContainer(double maxWidth) {
  return Container(
    width: maxWidth * 0.40,
    constraints: BoxConstraints(minWidth: 453),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('السنه الدراسيه'),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 125, 140, 158),
              style: BorderStyle.solid,
              // width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              onChanged: (String? newValue) {
                // Handle state management in the actual implementation
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_drop_down),
                      Flexible(
                        child: Text(
                          value,
                          textDirection: ui.TextDirection.rtl,
                          style: TextStyle(),
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}
List<Widget> _buildPageNumbers(HomeController controller,Course course,context) {
  final currentPage = controller.currentPage;
  final totalPages = controller.totalPages;
  final List<Widget> pages = [];

  void addPage(int page) {
    pages.add(
      GestureDetector(
        onTap: () {
          controller.currentPage = page;
          //  var id= controller.students2.map((f)=>f.id.toString());
        //  controller .Studentsbycourse(context,course.id.toString(),page:controller.currentPage);
              // controller.studentexam(controller.currentPage);
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

//       Widget _buildPagination(HomeController controller) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       // Previous button
//       GestureDetector(
//         onTap: () {
//           if (controller.currentPage > 1) {
//             controller.currentPage--;
//             controller.controlcenter(controller.currentPage,controller.coursemanager.map((toElement)=>{toElement.students?.map((toElement)=>{toElement['id']})}).toString());
//             // controller.controlcenter(controller.currentPage,'${controller.coursemanager[index].students?[index]['id']}');
           
//             controller.update();
//           }
//         },
//         child: Container(
//           margin: const EdgeInsets.all(4),
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           decoration: BoxDecoration(
//             color: controller.currentPage > 1 ? Colors.blue : Colors.grey.shade300,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Icon(
//             Icons.arrow_back,
//             color: controller.currentPage > 1 ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
      
//       // Page numbers
//       ...List.generate(controller.totalPages, (index) {
//         final pageIndex = index + 1;
//         return GestureDetector(
//           onTap: () {
//             controller.currentPage = pageIndex;
//             controller.controlcenter(controller.currentPage,'${controller.coursemanager[index].students![index]['id']}');
// // print('mm${controller.coursemanager[index].students?[index]['id']}');
//     print('111111');
//             controller.update();
//           },
//           child: Container(
//             margin: const EdgeInsets.all(4),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: pageIndex == controller.currentPage
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

//       // Next button
      
//       GestureDetector(
//         onTap: () {
//           if (controller.currentPage < controller.totalPages) {
//             controller.currentPage++;
//             controller.controlcenter(controller.currentPage,
//             controller.coursemanager.map((toElement)=>{toElement.students!.map((toElement)=>{toElement['id'].toString()})}).toString()
//             );

//             // print("0000000${  controller.currentPage}${                 controller.coursemanager.map((toElement)=>{toElement.students!.map((toElement)=>{toElement['id']})}).toString()})}");
//               controller.update();
//           }},
        
//         child: Container(
//           margin: const EdgeInsets.all(4),
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           decoration: BoxDecoration(
//             color: controller.currentPage < controller.totalPages ? Colors.blue : Colors.grey.shade300,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Icon(
//             Icons.arrow_forward,
//             color: controller.currentPage < controller.totalPages ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     ],
//   );
// }
   