import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/Applinks.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class show_Dialog extends StatefulWidget {
  const show_Dialog({super.key});

  @override
  State<show_Dialog> createState() => _show_DialogState();
}

class _show_DialogState extends State<show_Dialog> {
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.gloabalsection(//context
    );
  }

  @override
  Widget build(BuildContext context) {
      TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController watchController = TextEditingController();
 
  // Future uploadAll() async {
  // try {
  //   if (controller. pickedImage == null ||controller. pickedVideo == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Pick image and video first!")),
  //     );
  //     return;
  //   }

  //   var uri = Uri.parse("${Applinks.baseurl}/courses/upload-all");

  //   var request = http.MultipartRequest("POST", uri);

  //   // TEXT FIELDS
  //   request.fields['name'] = nameController.text;
  //   request.fields['price'] = priceController.text;
  //   request.fields['viewingWatching'] = watchController.text;

  //   // IMAGE
  //   request.files.add(
  //     await http.MultipartFile.fromPath(
  //       'file',
  //   controller.    pickedImage!.path,
  //       filename: basename(controller. pickedImage!.path),
  //     ),
  //   );

  //   // VIDEO
  //   request.files.add(
  //     await http.MultipartFile.fromPath(
  //       'video',
  //   controller.    pickedVideo!.path,
  //       filename: basename(controller. pickedVideo!.path),
  //     ),
  //   );

  //   // SEND
  //   var response = await request.send();

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     String body = await response.stream.bytesToString();
  //     print("SUCCESS: $body");

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Upload Success")),
  //     );
  //   } else {
  //     String body = await response.stream.bytesToString();
  //     print("FAILED: $body");

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Upload Failed")),
  //     );
  //   }
  // } catch (e) {
  //   print(e);
  // }  
  // }
    return Positioned(
   
      child: LayoutBuilder(
        builder: (context, constraints) {
          double dialogWidth = constraints.maxWidth > 1032 ? 1032 : constraints.maxWidth * 0.9;
          double textFieldWidth = dialogWidth * 0.45;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Dialog(
                  backgroundColor: Colors.white,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(18, 18, 18, 40),
                    width: dialogWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset('assets/close-circl.png', height: 24, width: 24),
                            ),
                          ],
                        ),
                        Text(
                          'تفصيل المحاضره',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 6, 69, 152),
                            fontSize: 32,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Container(
                          width: dialogWidth * 0.96,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: textFieldWidth,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'سعر المحاضره',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                                        ),
                                        TextField(
                                          controller: controller.price,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '100',
                                            hintTextDirection: TextDirection.rtl,
                                          ),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'صلاحيه مشاهده المحاضره',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                                        ),
                                        TextField(
                                          controller: controller.viewingWatching,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '100',
                                            hintTextDirection: TextDirection.rtl,
                                          ),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: textFieldWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'اسم المحاضره',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                                    ),
                                    TextField(
                                      controller: controller.name,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color:
                                           Color.fromARGB(255, 195, 202, 210)),
                                        ),
                                        hintText: '01125134370',
                                        hintTextDirection: TextDirection.rtl,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      width: textFieldWidth,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'توصيف المحاضره',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                            width: textFieldWidth,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(width: 1, color: Color.fromARGB(255, 195, 202, 210)),
                                            ),
                                            padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text('بلاغه•'),
                                                Text('نصوص•'),
                                                Text('نحو•'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: dialogWidth * 0.96,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'اختار شكل الكارت',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 6, 69, 152)),
                                  ),
                                  Text(
                                    'اختار شكل كارت اللي يناسب استخدامك في العمل المحاضرات بكل سهولة ودقة!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 80, 124, 181)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Container(
                                child:  Row(spacing: 12,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: 
                                      Image.asset('assets/Component 175.png', width: 74.54, height: 110),
                                      onTap: //controller.pickImage
                                      () {
                                        // controller.gloabalsection();
                                        // List.generate(controller.allsections.length, (index) {
                                        //   print('${Applinks.baseurl}/${controller.allsections[index].cardimg}');
                                        // });
                                        // controller.pickAndUploadImage2();
                                      },
                                    ),
                                    ...List.generate(controller.allsections.length, (index) {
                                      return
                                          InkWell(child: 
                                          Image.network(
                                            '${Applinks.baseurl}/${controller.allsections[index].cardimg}',
                                            width: 74.54,
                                            height: 110,
                                              ) ,
                                          
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 193,
                                    height: 40,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        backgroundColor: Color.fromARGB(255, 6, 69, 152),
                                      ),
                                      onPressed: //uploadAll,
                                      () async {
                                      // await  controller.gloabalsection();
                                      //   await controller.uploadcard2(context);
                                      //   await controller.allpaginsections(page: 1);
                                      },
                                      child: Text(
                                        'اضافة المحاضره',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 193,
                                    height: 40,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        backgroundColor: Color.fromARGB(255, 6, 69, 152),
                                      ),
                                      onPressed:// uploadAll
                                      () async {
                                      // await  controller.gloabalsection();
                                      //   await controller.uploadcard2(context);
                                      //   await controller.allpaginsections(page: 1);
                                      }//,
                                      ,
                                      child: Text(
                                        'سابق',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}