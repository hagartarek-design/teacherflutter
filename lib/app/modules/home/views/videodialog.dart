import 'dart:io';
import 'dart:typed_data';
import 'package:flutterwallet/app/modules/home/Applinks.dart';
import 'package:flutterwallet/app/modules/home/controllers/fileuploader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadLectureDialog extends StatefulWidget {
  const UploadLectureDialog({super.key});

  @override
  State<UploadLectureDialog> createState() => _UploadLectureDialogState();
}

class _UploadLectureDialogState extends State<UploadLectureDialog> {
// class _UploadLectureDialogState extends State<UploadLectureDialog> {
  final HomeController controller = HomeController();
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
//  HomeController controller =Get.put(HomeController());
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
  String result='';
      String? selectedValue;
      
//   File? pickedImage;
//   File? pickedVideo;

//   TextEditingController nameController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController watchController = TextEditingController();
// Future pickVideo() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles();
//   if (result != null) {
//     setState(() {
//       pickedVideo = File(result.files.single.path!);
//     });
//   }
// }
// final HomeController controller = HomeController();

   TextEditingController nameCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController watchCtrl = TextEditingController();

  // --- IMAGE ---
  File? pickedImage;
  Uint8List? pickedImageBytes;
  String? pickedImageName;

  // --- VIDEO ---
  File? pickedVideo;
  Uint8List? pickedVideoBytes;
  String? pickedVideoName;


  // --- PICK IMAGE ---
  Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null) {
      if (kIsWeb) {
        pickedImageBytes = result.files.single.bytes;
        pickedImageName = result.files.single.name;
      } else {
        pickedImage = File(result.files.single.path!);
      }
      setState(() {});
    }
  }

  // --- PICK VIDEO ---
  Future pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      withData: true,
    );

    if (result != null) {
      if (kIsWeb) {
        pickedVideoBytes = result.files.single.bytes;
        pickedVideoName = result.files.single.name;
   
      } else {
        pickedVideo = File(result.files.single.path!);
      }
      setState(() {});
    }
  }
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("token");
}
  // --- UPLOAD ---
  @override
  Widget build(BuildContext context) {
Future uploadAll() async {
  try {
if ((pickedImageBytes == null && pickedImage == null) ||
    (pickedVideoBytes == null && pickedVideo == null)) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Pick image and video first!")),
  );
  
    return;
  }

  final token = await getToken();
  if (token == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login missing!")),
    );
    return;
  }

  final uri = Uri.parse("${Applinks.baseurl}/courses/upload-all");
  final request = http.MultipartRequest("POST", uri);

  request.headers['Authorization'] = "Bearer $token";

  request.fields['name'] = nameCtrl.text;
  request.fields['price'] = priceCtrl.text;
  request.fields['viewingWatching'] = watchCtrl.text;

// IMAGE
if (kIsWeb) {
  request.files.add(
    http.MultipartFile.fromBytes(
      'file',
      pickedImageBytes!,
      filename: pickedImageName ?? 'image.jpg',
    ),
  );
} else {
  request.files.add(
    await http.MultipartFile.fromPath('file', pickedImage!.path),
  );
}

// VIDEO
if (kIsWeb) {
  request.files.add(
    http.MultipartFile.fromBytes(
      'video',
      pickedVideoBytes!,
      filename: pickedVideoName ?? 'video.mp4',
    ),
  );
} else {
  request.files.add(
    await http.MultipartFile.fromPath('video', pickedVideo!.path),
  );
}


  showDialog(




    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  var resp = await request.send();
  Navigator.pop(context);

  final body = await resp.stream.bytesToString();
  print("SERVER RESPONSE: $body");

  if (resp.statusCode == 200 || resp.statusCode == 201) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Uploaded Success")));
  } else {
  //  final data=request.fields['message'];
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("you have no access to this endpoint")));
  }   
  } catch (e) {
   print('nnnn${e}'); 
  }
 
}

return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 996,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
            _buildButtonmain(   icon:          
                       Image.asset('assets/close-circl.png', width: 24, height: 24),

                      route: '/DashboardScreen'
                      ,  isActive: Get.currentRoute == '/DashboardScreen',
                      ),
              ],
            ),

            const SizedBox(height: 10),
Container(width: 1000,child: 
            // TITLE
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "إضافة المحاضرة جديد",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 6, 69, 152),
                  ),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 8),
                Text(
                  "قم بإضافة محاضرة جديدة عبر رفع ملف الفيديو",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 140, 140, 140),
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),),

            const SizedBox(height: 30),

            Stack(
              children: [
              SizedBox(
  height: 270, 
  width: double.infinity,
  child: Stack(
    children: [
      DropzoneView(
        operation: DragOperation.copy,
        mime: ['video/*'],
        onCreated: (ctrl) => controller.dropzone = ctrl,
        onDrop: (ev) async {
          final bytes = await controller.dropzone.getFileData(ev);
          final name = await controller.dropzone.getFilename(ev);
          final file = PlatformFile(
            name: name ,
            bytes: bytes,
            size: bytes.length,
          );
          Fileuploader files=Fileuploader(); 
          files.uploadVideoWebSafe(file);
        },
      ),

      DottedBorder(
        color: Color.fromARGB(255, 6, 69, 152),
        radius: Radius.circular(16),
        strokeWidth: 2,
        dashPattern: [8, 6],
        borderType: BorderType.RRect,
        child: Container(
          width: double.infinity,
          height: double.infinity, 
          padding: EdgeInsets.all(32),
          child: Column(
                      children: [
                        Image.asset('assets/Frame.png',
                            width: 54, height: 54),
                        const SizedBox(height: 16),
                        const Text(
                          "اسحب وأسقط فيديو هنا أو اضغط لاختيار ملف للرفع",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 6, 69, 152),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "لأفضل أداء يرجى رفع MP4 فقط",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        // PICK BUTTON
                        SizedBox(
                          width: 133,
                          height: 40,
                          child: TextButton(
                            onPressed: pickVideo,
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 6, 69, 152)),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "تحميل الفيديو",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 6, 69, 152),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Image.asset('assets/document-download.png',
                                    width: 16, height: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),)]),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context){   
//                       TextEditingController nameController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController watchController = TextEditingController();

// String?photoUrl='';
// String token='';
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
                                      onTap: pickImage
                                      // () {
                                        // controller.gloabalsection();
                                        // List.generate(controller.allsections.length, (index) {
                                        //   print('${Applinks.baseurl}/${controller.allsections[index].cardimg}');
                                        // });
                                        // controller.pickAndUploadImage2();
                                      // },
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
                                      onPressed: uploadAll,
                                      // () async {
                                      // await  controller.gloabalsection();
                                      //   await controller.uploadcard2(context);
                                      //   await controller.allpaginsections(page: 1);
                                      // },
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
                                        shape: RoundedRectangleBorder(borderRadius: 
                                        BorderRadius.circular(8)),
                                        backgroundColor: Color.fromARGB(255, 6, 69, 152),
                                      ),
                                      onPressed: //uploadAll
                                      () async {
                                        Navigator.pop(context);
                                      // await  controller.gloabalsection();
                                      //   await controller.uploadcard2(context);
                                      //   await controller.allpaginsections(page: 1);
                                      },
                                      // ,
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
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0144AC),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("التالي",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: (){    
                    Get.back();
        controller.smartNavigate('/DashboardScreen');
        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0144AC),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("إلغاء",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}
