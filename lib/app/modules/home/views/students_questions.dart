import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/studentQuestion2.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';

class StudentsQuestions extends StatelessWidget {

   StudentsQuestions({super.key,});

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;


  final ValueNotifier<int> _selectedValue = ValueNotifier<int>(-1);
  String? selectedValue4='Option 1';


    
  
    bool isDesktop = screenWidth > 1200;
    bool isTablet = screenWidth > 768 && screenWidth <= 1200;
    bool isMobile = screenWidth <= 768;

    return  Scaffold(
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
            
          body:GetBuilder<HomeController>(init:HomeController() 
    ,builder: (controller){
      return 
              Expanded(child:
               Row(
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

       Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [


                  Container(
       padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      // padding: EdgeInsets.fromLTRB(504, 120, 0, 0),
        margin: EdgeInsets.only(
                        top: 60,
                        left: 64,
                        bottom: 40,
                        right: 40,
                      ),
      width: 1032,decoration: BoxDecoration(

      color: Colors.white
,borderRadius:BorderRadius.circular(16)



     ),
     
     child:
Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [


Container(
 
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
 
  children: [
    if (screenWidth > 600)
                Expanded(
                  flex: screenWidth > 800 ? 6 : 4,
                  child:
                      Expanded(

                        // flex: 2,
                        child:Row(mainAxisAlignment: MainAxisAlignment.start,
                         children: [ Container(
                          height: 48,width: 326,
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
  ])),),
Text('اساله الطلاب',textAlign: TextAlign.right,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600),)
 ],),

  ),
  SizedBox(height: 8,),
  Container(
   decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
           boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),
              ],
        
        ),
        // ,height: 94, 

  padding: EdgeInsets.fromLTRB(24, 25, 24,25),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text('')
,
    Text('تاريخ عمل السؤال'),
    Text('اسم الدرس'),
    Text('الاكواد'),
    Text('اسم الطالب'),
   


  ],),)   
  ,
  Row(children: [
    Container(
      width: 1008,
      padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [


        Row(
        
        children: [
        Container(height: 20,
        child:Row(children: [
          Image.asset('icons/arrowleft.png',height: 24,width: 24,),SizedBox(width: 24,),
         Image.asset('icons/arrowright.png',height: 24,width: 24,),SizedBox(width: 24,),
        ],)
        ),
        Image.asset('icons/Vector 37.png',height: 24,),SizedBox(width: 24,),

       Text('210 من 1-50',style: TextStyle(fontWeight: FontWeight.w500,
       fontSize: 16
       ),textAlign: TextAlign.center,),
SizedBox(width:24 ,),
         Image.asset('icons/Vector 37.png',height: 24,),SizedBox(width: 24,),

        ]),
      Row(
        
        children: [
        Image.asset('icons/Vector 37.png',height: 24,),SizedBox(width: 24,),
        Image.asset('icons/server.png',height: 24,width: 24,),SizedBox(width: 24,),
   InkWell(
    onTap: (){
      // print('myques${controller.questions.map((e)=>e.students?.map((e)=>e['id']).join()).join()}');
      // print('mytext${controller.questions.map((e)=>e.text).join()}');
      ;},
    child:  Image.asset('icons/book-open.png',height: 24,width: 24,),),     SizedBox(width: 24,),
         Image.asset('icons/delete.png',height: 24,width: 24,),SizedBox(width: 24,),

         Image.asset('icons/Vector 37.png',height: 24,),SizedBox(width: 24,),
        Container(
       child: Row(children: [ 
          DropdownButton<String>(
      value: selectedValue4,
      icon: Image.asset('icons/arrow-down2.png'),
      items: [
        DropdownMenuItem(
          value: 'Option 1',
          child: SizedBox.shrink(), 
        ),
        DropdownMenuItem(
          value: 'Option 2',
          child: SizedBox.shrink(), 
        ),
        DropdownMenuItem(
          value: 'Option 3',
          child: SizedBox.shrink(), 
        ),
      ],
      onChanged: (String? newValue) {
     
          selectedValue4 = newValue;
     
      },
    ),SizedBox(width: 12,),
      ValueListenableBuilder<int>(
              valueListenable: _selectedValue,
              builder: (context, selectedValue, child) {
                return Radio<int>(
            fillColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 177, 199, 226)  ),   
               value: 0,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    _selectedValue.value = value!;
                  },
                  activeColor: selectedValue == 0 ? Colors.blue : Colors.grey,
                
                );
              },
            ),
           
 ],
        
      
    
       ))
  
  ,

  ])
  

  ]))])
  
  ,
...List.generate(
  controller.questions.length,
  // controller.questions.fold(0, (sum, question) => sum + (question.students?.length ?? 0)),
(index) {
    // int accumulated = 0;
    // int questionIndex = 0;
    // int studentIndex = 0;
    
    // for (var i = 0; i < controller.questions.length; i++) {
    //   final studentCount = controller.questions[i].students?.length ?? 0;
    //   if (index < accumulated + studentCount) {
    //     questionIndex = i;
    //     studentIndex = index - accumulated;
    //     break;
    //   }
    //   accumulated += studentCount;
    // }
    
    // final question = controller.questions[questionIndex];
    // final student = question.students?[studentIndex];
  return 
 Container(padding:   EdgeInsets.fromLTRB(24, 25, 24, 25)
, decoration: BoxDecoration( 
  color: Colors.white,
   boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),
              ],),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
               PopupMenuButton<String>(
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
              child: Text('اغلق السؤال'),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Text('مسح السؤال'),
              onTap: (){

              },
            ),
          ],
           child: Image.asset('icons/Group 37966.png',width: 26,height: 6,), ), 
                   Row(
            children: [
         
            Container(width: 73,child:  
             Text(textAlign: TextAlign.center,
                '${controller.courseDatas.course_info?.map((e)=>e['course']['month_by_year'])}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
             fontFamily: 'Teshrin AR+LT',
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ))
            ,Image.asset('assets/calendar.png',width: 20,height: 20,),
         
            ],
          ), 
 
                Text('${controller.questions[index].lesson?.map((e)=>e['name']).join()??'n/a'}',style: TextStyle(fontWeight: 
                 FontWeight.w400,fontSize: 16,),textAlign: TextAlign.right,),
                Text('1234567',style: TextStyle(fontWeight: FontWeight.w500,
                fontSize: 14),textAlign: TextAlign.center,),
               InkWell(
                onTap: (){
           final studentId=       controller.questions[index].students?.map((e)=>e['id']).join();
          // Navigator.push(
          //   context, 
          //   MaterialPageRoute(builder: (context) => studentQuestion2(studentsId: studentId,))
          // );      
       final text=   controller.questions.map((e)=>e.text).join();
          Get.to(studentQuestion2(studentsId: studentId,text: text,)) ;   
                },
                child: 
                    Row(
                      
                      children: [  Container(height: 40,child:  
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                      Column(
                        
                        children: [
                       Text(
                        '${ controller.questions[index].students?.map((e)=>e['name']).join()??'N/A'}'
                       ,textAlign: TextAlign.right
                       ,style: TextStyle(fontFamily: 'Teshrin AR+LT'
                       ,fontWeight:FontWeight.w500,
                       fontSize: 14
                       ,height:17.5/14 
                       
                       ),
                       
                       )
                       ,
                       SizedBox(height: 8,),
                    Text(
                      '+(02)${ controller.questions[index].students?.map((e)=>e['phoneNum']).join()??'N/A'}'
                    ,style: TextStyle(
                          color: Colors.grey 
                          ,fontSize: 12,fontFamily: 'Teshrin AR+LT',
                        fontWeight: FontWeight.w500 



                        ,height: 15/14
                        ),)
                        ]),
                      // ],)) 
                // ,SizedBox(width:8),
                 Container(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          
                          radius: 24,
                          backgroundImage: AssetImage('assets/image 2.png'),
                        ),
                      ),
                   
                   
                   
                     ],)
                ,),
   ValueListenableBuilder<int>(
    valueListenable: _selectedValue,
    builder: (context, selectedValue, child) {
      return Radio<int>(
        fillColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 177, 199, 226)),
        value: 0,
        groupValue: selectedValue,
        onChanged: (int? value) {
          _selectedValue.value = value!;
      final studentId=     controller.questions[index].students?.map((e)=>e['id']).join();
      print(studentId);
      final text=controller.questions.map((e)=>e.text).join();
      Get.to(studentQuestion2(studentsId: studentId,text:text));
          // Navigator.push(
          //   context, 
          //   MaterialPageRoute(builder: (context) => studentQuestion2(studentsId: studentId))
          // );
        },
        activeColor: selectedValue == 0 ? Colors.blue : Colors.grey,
      );
    },
  ),
        ],
  
      ))]));
  
 
 }
 )
 ,
 SizedBox(height: 200,),
 Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
           GestureDetector(
          onTap: () {
            if (controller.currentPage > 1) {
              controller.currentPage--;
                  // controller.fetchQuestions(context,page:controller.currentPage);
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
            children: _buildPageNumbers(controller,context),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (controller.currentPage < controller.totalPages) {
              controller.currentPage++;
          // controller.fetchQuestions(context,page:controller.currentPage);
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
  
  ]))
                   
                          ])])))      ,
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
                )]));
     }));}
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
        controller.fetchQuestions(context,page:controller.currentPage);
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
