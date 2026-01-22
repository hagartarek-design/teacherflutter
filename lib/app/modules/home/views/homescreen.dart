import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/Applinks.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/dropdown.dart';
import 'package:flutterwallet/app/modules/home/views/mypage.dart';
import 'package:get/get.dart';import 'dart:ui';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class Homescreen extends StatelessWidget {
  final HomeController controller = HomeController();

  // final String dropdownValue = 'Option 1';
  // final List<String> list = ['Option 1', 'Option 2', 'Option 3'];
String selectedFile = '';

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[900]),
              child: Center(
                child: Text(
                  'المنصة التعليمية',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 96,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: Mypage(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(

                              color: Colors.white,
borderRadius: BorderRadius.circular(16),
                              ),
                              width: screenWidth * 0.9,
                              constraints: BoxConstraints (maxWidth: 1032), 
                              height: 374,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [  SizedBox(width: 26,), 
                                          Flexible(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                             SizedBox(width: 244,height: 244,child: 
                                          //  ValueListenableBuilder<String?>(
  // valueListenable:,
  // builder: (context, url, child) {
    // print('url:$url');
    //  return 
        CircleAvatar(
                radius: 50,
               backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
    backgroundImage: controller.users.image != null 
  ? NetworkImage('http://localhost:3300/${controller.users.image}')
  : null,
child: controller.users.image == null 
  ? Icon(Icons.person, size: 50, color: Colors.grey[600]) 
  : null, 
      // child: url == null ? Icon(Icons.person, size: 50, color: Colors.grey[600]) : null,
    
         // Default image
              )),
                                                SizedBox(height: 16),
                                                Container(
                                                  width: constraints.maxWidth * 0.3,
                                                  height: 40,
                                                //   padding: EdgeInsets.all(8),
                                                //   decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.circular(8),
                                                //     border: Border.all(width: 1, color: Color.fromARGB(255, 6, 69, 152)),
                                                //   ),
                                                //   // child: Center(
                                                    child:
                                                     TextButton(
                                                      
                                                      style: ButtonStyle(
                                                         padding:MaterialStateProperty.all<EdgeInsets>( EdgeInsets.
                                                         fromLTRB(0,15 ,0, 15)
                                                         ),
                                                      backgroundColor:
                                                      MaterialStateProperty.all<Color>
                                                     (Colors.white),
                                                    shape:MaterialStateProperty.all
                          <RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                                                       side:BorderSide(color: Color.fromARGB(255, 6, 69, 152), width: 1),
                            borderRadius: BorderRadius.circular(8),)),
                                                    ),
                                                      onPressed:(){
                                                        controller.  pickAndUploadImage();
                                                      controller.users_info();

                                                      // controller.update()
// // _selectFile();  
//         // String g= '${Applinks.baseurl}/${controller.fullUrl}';
// await controller.pickImage();
// // print( g);
//                 await controller.uploadImage();
// controller.users_info();},
//                                                       }
                                                      },
child: Text(
                                                      'تغير الصورة الشخصية',
                                                      style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)),

                                                      )
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: constraints.maxWidth * 0.1),
                                          Flexible(
                                            flex: 2,
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                // border: Border.all(color: Color.fromARGB(255, 6, 69, 152)),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                              
                                                  SizedBox(height: 10),
                                               Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [


                                                    ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                      MaterialStateProperty.all<Color>
                                                     (Colors.white),
                                                    shape:MaterialStateProperty.all
                          <RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                                                       side:BorderSide(color: Color.fromARGB(255, 6, 69, 152), width: 1),
                            borderRadius: BorderRadius.circular(8),)),
                                                    ),
                                                    onPressed: () {
                                                      controller.uploadInfo();
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('تعديل'),
                                                        SizedBox(width: 8),
                                                        Image.asset('pincel.png', width: 16, height: 16),
                                                      ],
                                                    ),
                                                  ),
                                                Text(
                                                    'معلومتك الشخصية',
                                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                                  ), ],) ,
                                                  SizedBox(height: 20),
                                                  _buildTextField('اسم المدرس بالكامل', 'ادخل اسم المدرس بالكامل',controller.firstnamecontroller),
                                                  SizedBox(height: 16),
                                                  _buildTextField('البريد الإلكتروني', 'ادخل بريدك الإلكتروني',controller.emailController),
                                                  SizedBox(height: 16),
                                                  _buildTextField('رقم الهاتف', 'ادخل رقم الهاتف',controller.phonecontroller),

                                                  
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                         
                                    ],
                                  );
                                },
                              ),
                            ),
                //  
                SizedBox(height: 16,),
           

    

                    ],
                  ),
                ),


Container( decoration: BoxDecoration(color: Colors.white
,borderRadius: BorderRadius.circular(16)
),height: 360,

                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 10),

  width:      screenWidth * 0.9, constraints: BoxConstraints (maxWidth: 1032), child: 
                 Container(
                  // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 10),
                  color: Colors.white,
      width:      screenWidth * 0.9,
      constraints: BoxConstraints(maxWidth: 938),
      child: Column(
mainAxisAlignment: MainAxisAlignment.center,

        children: [
        
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(

                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [   
              Container(
                // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 10),
                
      //             color: Colors.white,
        width:      screenWidth * 0.9,
      constraints: BoxConstraints(maxWidth: 938),  
                
           child:   Text('معلومتك المهنية ',textAlign: TextAlign.end),)
          ]),
                  // First Dropdown
                  buildDropdownContainer(constraints.maxWidth),
                  // Second Dropdown
                  buildDropdownContainer(constraints.maxWidth),
                ],
              );
            },
          ),
          SizedBox(height: 24),
          Container(
            color: Colors.white,
             width:      screenWidth * 0.9,
      constraints: BoxConstraints(maxWidth: 938),  
            // width: 109,
                // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 10),

            height: 72,
            child:
             Row(
              // textDirection :ui.TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                  // child:
                  
                   SizedBox(
                    height: 50,width: 109,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // elevation: e
                        // ,
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 166, 176, 188)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('حفظ', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                // ),
              ],
            ),
          ),
        ],
      ),
    )
                     )   ,
                     SizedBox(height: 24,)
                                              ,        SizedBox(height: 20,),
                     
                      Container(
                        
                        width: 1032,height: 729
                                                  ,decoration: BoxDecoration(
                                                    color: Colors.white
                                                  ,
                                                    borderRadius:BorderRadius.circular(16) 
                                                  )
                                                  , 
                                                  
                                                  child:Container(  
                                              





                                                    child: Column(



                                                      // mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        
                                                        SizedBox(height: 45,),
                                                  Container(
                                                      //  padding:EdgeInsets.fromLTRB(221, 975, 221, 975),
                                                      
                                                //  color: Colors.blue, 
                                                    child:     Container(
                                                      
                                                        width: 984,
                                                 height: 400,  padding: EdgeInsets.all(8),
                                                      child:Column(children: [
                                                        
                                                         Column(
                                                        children: [ 
                                                          
                                                            Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                   
                                                            
                        
                                                                       
                        ElevatedButton(onPressed: (){
                    controller.  pickAndUploadImage();
                                                      controller.users_info();                                                                              
                       },style: ButtonStyle(
                          shape: MaterialStateProperty.
                          all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      
                              backgroundColor:MaterialStatePropertyAll<Color>(
                                                        
                         Color.fromARGB(255, 6, 69, 152)),

                 ), child:
                 Row(
                  children: [ 
                  Text('اضف',style: TextStyle(color: Colors.white),),
                          SizedBox(width: 8,),  Image.asset('assets/add-square.png',width: 20, height: 20,)
                                                     
                                                     ]))
                                                    , Text('صور رئيسيه')
                                                  ,  ],)
                                     ,SizedBox(height: 20,)    
                                     ,Container(
                                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(children: [
                            Row( children: [

                              Column(children: [
                            Container( width: 184,height: 24,child:Container(
                              width: 24,height: 24,
                            child:
                           Row(children:[
                              Image.asset('assets/close-circl.png',height: 24,width: 24,),])  ) ),
                        //  Padding(padding: )   ),
Image.asset('assets/Frame 1597882589.png')
                            ]),
                             ...List.generate(
                    controller.images.length,
                    (index){
                      return      Column(children: [
                            Container( width: 184,height: 24,child:Container(
                              width: 24,height: 24,
                            child:
                           Row(children:[
                            TextButton(onPressed: (){
                              // print('${controller.images[index].id}');
                              // controller.findoneimg('${controller.images[index].id}');
                              controller.deleteimage(controller.images[index].id.toString());
                              controller.allimages();
                          }, child:  Image.asset('assets/close-circl.png',height: 24,width: 24,),)
                             ])  ) ),
                        //  Padding(padding: )   ),
                        
                    Row(children: [
Image.network(
                        'http://localhost:3300/${controller.images[index].url}')])
        ]);})
//                             , ...List.generate(
//                     controller.images.length,
//                     (index){  return  Column( children: [
//                           Container(width: 184,height: 24,child:Container(
//                               width: 24,height: 24,
//                             child:
//                            Row(children:[
                       
//                        Image.network(
//                         'http://localhost:3300/${controller.images[index].url}',
//                         width: 24,
//                         height: 24,
//                         fit: BoxFit.cover,
                   
//                   ),
//                               ])  ) )
//                         //  Padding(padding: )   ),
// // Image.asset('assets/Frame 1597882589.png')
//        ]);
//         })
        ])
                                 ],)
                                                         ]   ) 
                                                                  )   ])
                                                     ,   
                                                         Column(
                                                        children: [ 
                                                          
                                                            Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                   
                                                            
                        
                                                                       
                        ElevatedButton(onPressed:() {  controller.pickVideoWeb()  ;controller.uploadVideo();  }                            
                       ,style: ButtonStyle(
                          shape: MaterialStateProperty.
                          all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      
                              backgroundColor:MaterialStatePropertyAll<Color>(
                                                        
                         Color.fromARGB(255, 6, 69, 152)),

                 ), child:
                 Row(
                  children: [ 
                  Text('اضف',style: TextStyle(color: Colors.white),),
                          SizedBox(width: 8,),  Image.asset('assets/add-square.png',width: 20, height: 20,)
                                                     
                                                     ]))
                                                    , Text('الفيديو التعريفي')
                                                  ,  ],)
                                     ,SizedBox(height: 20,)    
                                     ,Container(
                                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(children: [
                            Container(width: 184,height: 24,child:Container(width: 24,height: 24,
                            child:Row(children:[Image.asset('assets/close-circl.png',height: 24,width: 24,),])  ) ),
                        //  Padding(padding: )   ),
Image.asset('assets/Frame 1597882589.png')

                                 ],)
                                                         ]   ) 
                                                                  )   ])
                                                                  
                                                                  ])
                                                                  
                                                                  )
                      
                     )
                      ],
                      ) ,))
                       ]),
           )) ],
          );
        },
      ),
    );
  }

  Widget _buildTextField(String label, String hint,TextEditingController controllers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 4),
        TextField(
          controller: controllers,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
  String dropdownValue = 'ادخل السنه الدراسيه';

  List<String> list = ['ادخل السنه الدراسيه', 'Item 2', 'Item 3'];
 Widget buildDropdownContainer(double maxWidth) {
    return Container(
      width: maxWidth * 0.40,
      constraints: BoxConstraints( minWidth: 453),
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