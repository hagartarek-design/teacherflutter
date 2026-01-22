// import 'dart:io';
import 'dart:async';
import 'dart:math';import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart'; 
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/modules/assignments.dart';
import 'package:flutterwallet/app/modules/home/modules/dailytable.dart';
import 'package:flutterwallet/app/modules/home/modules/lessons.dart';
import 'package:flutterwallet/app/modules/home/modules/questions.dart';
import 'package:flutterwallet/app/modules/home/modules/sections.dart';
import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
// import 'package:flutterwallet/app/modules/home/views/HomeViewscreen.dart';
import 'package:flutterwallet/app/modules/home/views/sections.dart';
import 'package:flutterwallet/app/modules/home/views/service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:jwt_decoder/jwt_decoder.dart'; 
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:file_picker/file_picker.dart';

// import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/modules/users_info.dart';
import 'package:flutterwallet/app/modules/home/views/login.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/widgets.dart';
import 'package:flutterwallet/app/google_auth.dart';
import 'package:flutterwallet/app/modules/home/modules/course_attend.dart';
import 'package:flutterwallet/app/modules/home/modules/course_info.dart';
import 'package:flutterwallet/app/modules/home/modules/exam.dart';
import 'package:flutterwallet/app/modules/home/modules/file.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet%20copy.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';
import 'package:flutterwallet/app/modules/home/views/students.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Applinks.dart';
import 'dart:html'as html;
import 'package:http/http.dart' as http;

import '../modules/students.dart';
class HomeController extends GetxController {
// List<dynamic> students1 = [];
//   List<dynamic> allStudents1 = [];
  // int currentPage = 1;
  // int totalPages = 1;
  int itemsPerPage = 10;
  int showDegreeafter = 0;
  int showdegreeEveryQues = 0;

  // void updateToggleValues(int after, int every) {
  //   showDegreeafter = after;
  //   showdegreeEveryQues = every;
  // }
  String? selectedGrade;
  String? selectedName;
  
  List<String> grades = ['السنة الدراسية الخامسة', 'السنة الدراسية السادسة', 'السنة الدراسية السابعة','السنة الدراسية الثامنة'];
  List<String> names = ['Math', 'physics','English','chemistery'];
  
List <Course>allStudents1=[];
  // Future<void> fetchStudentsByGroup(int groupId) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('${Applinks.baseurl}/courses/bystudent/$groupId'),
  //     );

  //     if (response.statusCode == 200) {
  //       allStudents1 = json.decode(response.body);
  //       coursemanager = allStudents1;
  //       totalPages = (allStudents1.length / itemsPerPage).ceil();
  //       update();
  //     } else {
  //       throw Exception('Failed to load students');
  //     }
  //   } catch (e) {
  //     print('Error fetching students: $e');
  //   }
  // }

  // Future<void> searchStudents({
  //   required int groupId,
  //   required String query,
  // }) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('${Applinks.baseurl}/courses/bystudent/$groupId?search=$query'),
  //     );

  //     if (response.statusCode == 200) {
  //       coursemanager = json.decode(response.body);
  //       update();
  //     } else {
  //       throw Exception('Failed to search students');
  //     }
  //   } catch (e) {
  //     print('Error searching students: $e');
  //   }
  // }

  // void controlcenter1(int page, String groupId) {
  //   currentPage = page;
  //   fetchStudentsByGroup(int.parse(groupId));
  //   update();
  // }

// final GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: ['email'], // Add other required scopes if needed
// );

//  signInWithGoogle() async {
//   try {
    
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn(); // ✅ Correct usage

//     if (googleUser == null) {
//       print("User canceled login");
//       return;
//     }

//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    
//     print("ID Token: ${googleAuth.idToken}");
//     print("Access Token: ${googleAuth.accessToken}");
//   } catch (error) {
//     print("Error: $error");
//   }
// }
  File? _videoFile;
  Uint8List? _videoBytes;
  String? _videoName;
  bool _isUploading = false;
  final picker = ImagePicker();
  // import 'package:file_picker/file_picker.dart';

Future<PlatformFile?> pickVideoWebSafe() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.video,
    withData: true, // VERY IMPORTANT for Flutter Web
  );

  if (result != null && result.files.single.bytes != null) {
    return result.files.single;
  }

  return null;
}

void pickAndUpload() async {
  final file = await pickVideoWebSafe();

  if (file != null) {
    await uploadVideoWebSafe(file);
  } else {
    print("No video selected");
  }
}


//  final  result;
// PickedFile()async{
// // import 'package:file_picker/file_picker.dart';

// final result = await FilePicker.platform.pickFiles(
//   type: FileType.custom,
//   allowedExtensions: ['jpg','png','mp4'],
// );

// final path = result!.files.single.path!;
// final file = File(path);

// // after picking
// pickedImage = File(resultImage.files.single.path!);
// pickedVideo = File(resultVideo.files.single.path!);
// }
  // Future<void> pickVideo() async {
  //   final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     // setState(() {
  //       _videoFile = File(pickedFile.path);
  //       _videoBytes = null; // Clear web data
  //       _videoName = basename(pickedFile.path);
  //     // });
  //     print('📁 Video picked (Mobile): $_videoName');
  //   } else {
  //     print('❌ No video selected');
  //   }
  // }

  Future<void> pickVideoWeb() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.bytes != null) {
      // setState(() {
        _videoFile = null; // Clear mobile data
        _videoBytes = result.files.single.bytes;
        _videoName = result.files.single.name;
      // });
      print('📁 Video picked (Web): $_videoName');
    } else {
      print('❌ No video selected (Web)');
    }
  }

  Future<void> uploadVideo() async {
    if (_videoFile == null && _videoBytes == null) {
      print('❌ Error: No video selected!');
      return;
    }

    // setState(() {
      _isUploading = true;
    // });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${Applinks.baseurl}/videos/video'),
      );
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      request.headers['Authorization'] = 'Bearer $token';

      String mimeType = lookupMimeType(_videoName ?? '') ?? 'video/mp4';

      if (kIsWeb && _videoBytes != null) {
        print('🔄 Uploading video (Web)');
        request.files.add(
          http.MultipartFile.fromBytes(
            'video',
            _videoBytes!,
            filename: _videoName,
            contentType: MediaType.parse(mimeType), // ✅ FIXED
          ),
        );
      } else if (_videoFile != null) {
        print('🔄 Uploading video (Mobile/Desktop)');
        request.files.add(
          await http.MultipartFile.fromPath(
            'video',
            _videoFile!.path,
            contentType: MediaType.parse(mimeType), // ✅ FIXED
          ),
        );
      } else {
        print('❌ Unexpected error: No valid video file.');
        return;
      }

      var response = await request.send();
      if (response.statusCode == 201 || response.statusCode == 200) {
        print('✅ Video uploaded successfully!');
      } else {
        print('❌ Video upload failed: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error uploading video: $e');
    } finally {
      // setState(() {
        _isUploading = false;
      // });
    }
  }
   final ValueNotifier<Uint8List?> imageBytes = ValueNotifier<Uint8List?>(null);
   final ValueNotifier<Uint8List?> imageBytes2 = ValueNotifier<Uint8List?>(null);
  final ValueNotifier<String?> fileName = ValueNotifier<String?>(null);
  final ValueNotifier<String?> fileNameexam = ValueNotifier<String?>(null);
  final ValueNotifier<String?> fullUrl = ValueNotifier<String?>(null);

  Future<void> pickAndUploadImage() async {
  html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  uploadInput.accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) async {
    final file = uploadInput.files!.first;
    final reader = html.FileReader();

    reader.readAsArrayBuffer(file);
    reader.onLoadEnd.listen((event) async {
      Uint8List? imageBytes = reader.result as Uint8List?;
      String? fileName = file.name;

      if (imageBytes != null) {
        print('Image selected: $fileName');
        await uploadImage(imageBytes, fileName);
      }
    });
  });
}

  Future<void> pickAndUploadImage2() async {
  html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  uploadInput.accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) async {
    final file = uploadInput.files!.first;
    final reader = html.FileReader();

    reader.readAsArrayBuffer(file);
    reader.onLoadEnd.listen((event) async {

     imageBytes.value = reader.result as Uint8List?;
   fileName.value = file.name;
      if (imageBytes != null) {
        print('Image selected: $fileName');
        // await uploadImage(imageBytes, fileName);
      }
    });
  });
}
//  int showdegreeEveryQues = 0;
// int showDegreeafter = 0;
TextEditingController exam_name = TextEditingController();
TextEditingController examprice = TextEditingController();
TextEditingController trials_number = TextEditingController();
TextEditingController durationmin = TextEditingController();
TextEditingController degree_success = TextEditingController();
TextEditingController totaldegree = TextEditingController();
//  int showDegreeafter = 0;
//   int showdegreeEveryQues = 0;

  // void updateShowDegreeAfter(int value) {
  //   showDegreeafter = value;
  //   update();
  // }

  // void updateShowDegreeEveryQues(int value) {
  //   showdegreeEveryQues = value;
  //   update();
  // }
  String formatDateForBackend(DateTime date) {
  return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}
  // String seedate='';
  // String startdate='';
// Future<void> uploadcard3online(BuildContext context,) async {
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     if (token == null) {
//       print('No token found');
//       return;
//     }

//     if (imageBytes2.value == null) {
//       print('No image selected');
//       return;
//     }

//     // Ensure startdate is properly formatted
//     String formattedStartDate = startdate.toString(); // Or format it as needed

//     dio.FormData formData = dio.FormData.fromMap({
//       "file": await dio.MultipartFile.fromBytes(
//         imageBytes2.value!,
//         filename: fileNameexam.value,
//       ),
//       "exam_name": exam_name.text,
//       "online": 1,
//       "examprice": examprice.text,
//       "trials_number": trials_number.text,
//       "durationmin": durationmin.text,
//       "totaldegree": totaldegree.text,
//       "degree_success": degree_success.text,
//       "showdegreeEveryQues": showdegreeEveryQues.toString(),
//       "showDegreeafter": showDegreeafter.toString(),
//       "seedate": seedate.toString(),
//       "startdate": formattedStartDate, // Use the formatted date
//     });

//     dio.Dio dioInstance = dio.Dio();
//     dioInstance.options.headers["Authorization"] = "Bearer $token";

//     dio.Response response = await dioInstance.post(
//       '${Applinks.baseurl}/exams/upload',
//       data: formData,
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print('start: $formattedStartDate');  
//       print('Uploading with settings:');
//       print('showDegreeafter: $showDegreeafter');
//       print('showdegreeEveryQues: $showdegreeEveryQues');
      
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
//       String imageUrl = response.data['imgcart'];
//       print('Image uploaded: $imageUrl');
//       update();
//     } else {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
//       print('Upload failed: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error uploading image: $e');
//   }
// }


// Future<void> uploadcard3offline(BuildContext context) async {
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     if (token == null) {
//       print('No token found');
//       return;
//     }

//     if (imageBytes2.value == null) {
//       print('No image selected');
//       return;
//     }

//     // Debug print all values before creating form data
//     print('Form values before submission:');
//     print('exam_name: ${exam_name.text}');
//     print('examprice: ${examprice.text}');
//     print('trials_number: ${trials_number.text}');
//     print('durationmin: ${durationmin.text}');
//     print('totaldegree: ${totaldegree.text}');
//     print('degree_success: ${degree_success.text}');
//     print('showdegreeEveryQues: $showdegreeEveryQues');
//     print('showDegreeafter: $showDegreeafter');

//     // Create form data with null checks
//     dio.FormData formData = dio.FormData.fromMap({
//       "file": await dio.MultipartFile.fromBytes(
//         imageBytes2.value!,
//         filename: fileNameexam.value ?? 'exam_file', // Provide default filename
//       ),
//       "exam_name": exam_name.text ?? '',
//       "online": '0', // Convert to string explicitly
//       "examprice": examprice.text ?? '0',
//       "trials_number": trials_number.text ?? '0',
//       "durationmin": durationmin.text ?? '0',
//       "totaldegree": totaldegree.text ?? '0',
//       "degree_success": degree_success.text ?? '0',
//       "showdegreeEveryQues": (showdegreeEveryQues ?? 0).toString(),
//       "showDegreeafter": (showDegreeafter ?? 0).toString(),
//     });

//     dio.Dio dioInstance = dio.Dio();
//     dioInstance.options.headers["Authorization"] = "Bearer $token";

//     // Print the complete form data before sending
//     print('FormData being sent:');
//     formData.fields.forEach((field) {
//       print('${field.key}: ${field.value}');
//     });
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));

//     dio.Response response = await dioInstance.post(
//       '${Applinks.baseurl}/exams/upload',
//       data: formData,
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print('Upload successful with settings:');
//       print('showDegreeafter: $showDegreeafter');
//       print('showdegreeEveryQues: $showdegreeEveryQues');
      
//       String imageUrl = response.data['imgcart'];
//       print('Image uploaded: $imageUrl');
//       update();
      
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Exam created successfully!'),
//           backgroundColor: Colors.green,
//         ),
//       );
      
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
//     } else {
//       print('Upload failed with status: ${response.statusCode}');
//       print('Response data: ${response.data}');
      
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to create exam. Please try again.'),
//           backgroundColor: Colors.red,
//         ),
//       );
      
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
//     }
//   } catch (e) {
//     print('Error uploading image: $e');
    
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   SnackBar(
//     //     content: Text('Error: ${e.toString()}'),
//     //     backgroundColor: Colors.red,
//     //   ),
//     // );
//   }
// }



Future<void> uploadcard3offline(BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print('No token found');
      return;
    }

    if (imageBytes2.value == null) {
      print('No image selected');
      return;
    }

    // Ensure startdate is properly formatted
    String formattedStartDate = startdate.toString(); // Or format it as needed

    dio.FormData formData = dio.FormData.fromMap({
      "file": await dio.MultipartFile.fromBytes(
        imageBytes2.value!,
        filename: fileNameexam.value,
      ),
      "exam_name": exam_name.text,
      "online": 0,
      "examprice": examprice.text,
      "trials_number": trials_number.text,
      "durationmin": durationmin.text,
      "totaldegree": totaldegree.text,
      "degree_success": degree_success.text,
      "showdegreeEveryQues": showdegreeEveryQues.toString(),
      "showDegreeafter": showDegreeafter.toString(),
      "seedate": seedate.toString(),
      "startdate": formattedStartDate, // Use the formatted date
    });

    dio.Dio dioInstance = dio.Dio();
    dioInstance.options.headers["Authorization"] = "Bearer $token";

    dio.Response response = await dioInstance.post(
      '${Applinks.baseurl}/exams/upload',
      data: formData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('start: $formattedStartDate');  
      print('Uploading with settings:');
      print('showDegreeafter: $showDegreeafter');
      print('showdegreeEveryQues: $showdegreeEveryQues');
      
      Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
      String imageUrl = response.data['imgcart'];
      print('Image uploaded: $imageUrl');
      update();
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
      print('Upload failed: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}

Future<void> pickAndUploadImage3() async {
  html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  uploadInput.accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) async {
    final files = uploadInput.files;
    if (files == null || files.isEmpty) return;
    
    final file = files.first;
    final reader = html.FileReader();

    reader.readAsArrayBuffer(file);
    reader.onLoadEnd.listen((event) async {
      if (reader.result != null) {
        imageBytes2.value = reader.result as Uint8List?;
        fileNameexam.value = file.name;
        print('Image selected: $fileNameexam');
      }
    });
  });
}
Future<void> uploadImage(Uint8List imageBytes, String fileName) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      return;
    }

    dio.FormData formData = dio.FormData.fromMap({
      "file": dio.MultipartFile.fromBytes(
        imageBytes,
        filename: fileName,
      ),
    });

    dio.Dio dioInstance = dio.Dio();
    dioInstance.options.headers["Authorization"] = "Bearer $token";

    dio.Response response = await dioInstance.patch(
      '${Applinks.baseurl}/users/upload',
      data: formData,
    );

    if (response.statusCode == 200) {
      String imageUrl = response.data['imagePath']; // Use full URL
      print('Image uploaded: $imageUrl');
update();
users_info();
allimages();
      fullUrl.value = imageUrl; // Update ValueNotifier
    } else {

    }
  } catch (e) {
  }
}

TextEditingController name =TextEditingController();
TextEditingController price =TextEditingController();
TextEditingController viewingWatching= TextEditingController();

Future<void> uploadcard2(BuildContext context) async {
try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print('No token found');
      return;
    }

    dio.FormData formData = dio.FormData.fromMap({
      "file": dio.MultipartFile.fromBytes(
        imageBytes.value!,
        filename: fileName.value,
      ),
      "name":name.text,
      "price":price.text,
      "viewingWatching":viewingWatching.text,
      // "description":description.text

    });

    dio.Dio dioInstance = dio.Dio();
    dioInstance.options.headers["Authorization"] = "Bearer $token";

    dio.Response response = await dioInstance.post(
      '${Applinks.baseurl}/users/upload',
      data: formData,
    );

    if (response.statusCode == 200) {
      
      String imageUrl = response.data['cardimg']; 
      print('Image uploaded: $imageUrl');
      gloabalsection();
      allpaginsections(page:currentPage);
update();
// users_info();
// allimages();
  Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => DashboardScreen()),
                                        );
      fullUrl.value = imageUrl; 
    } else {
        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => DashboardScreen()),
                                        );
      print('Upload failed: ${response.data}');
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}
  //  File? pickedImage;
// File? pickedVideo;
String?photoUrl='';
// String token='';
// Future pickImage()async {
//   FilePickerResult?result=await FilePicker.platform.pickFiles(type: FileType.image);
//   if(result !=null){
//     // setState(() {
//       pickedImage=File(result.files.single.path!);
//     // });
//   }

// }
// Future pickVideo()async{
//   FilePickerResult?result =await FilePicker.platform.pickFiles();
//   if(result!=null){
//     // setState(() {
      
//       pickedVideo=File(result.files.single.path!);
//     // });
//   }
// }
//  Timer? _refreshTimer;

  // void startAutoRefresh(String token) {
  //   stopAutoRefresh();

  //   final expiry = JwtDecoder.getExpirationDate(token);
  //   final remaining = expiry.difference(DateTime.now());

  //   // نجدد قبل الانتهاء بدقيقة
  //   final refreshTime = remaining - const Duration(minutes: 1);

  //   if (refreshTime.isNegative) {
  //     refreshToken();
  //   } else {
  //     _refreshTimer = Timer(refreshTime, refreshToken);
  //   }
  // }

  // Future<void> refreshToken() async {
  //   try {
  //     final tokens = await getTokens();
  //     final res = await Dio().post(
  //       'http://localhost:3300/auth/refreshtoken',
  //       data: {'refreshtoken': tokens!['refreshtoken']},
  //     );

  //     await saveTokens(
  //       res.data['token'],
  //       tokens['refreshtoken'],
  //       tokens['userId'],
  //     );

  //     startAutoRefresh(res.data['token']);
  //   } catch (e) {
  //     logout();
  //   }
  // }

  // void stopAutoRefresh() {
  //   _refreshTimer?.cancel();
  // }

  // Future<void> logout() async {
  //   stopAutoRefresh();
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  //   Get.offAllNamed('/HomeView');
  // }

// Future<String> getInitialRoute() async {
//   final tokens = await getTokens();
//   if (tokens == null) return '/HomeView';

//   final accessToken = tokens['token'];
//   final refreshtoken = tokens['refreshtoken'];

//   if (JwtDecoder.isExpired(accessToken)) {
//     try {
//       final res = await Dio().post(
//         'http://localhost:3300/auth/refreshtoken',
//         data: {'refreshtoken': refreshtoken},
//       );
//       await saveTokens(res.data['token'], refreshtoken, tokens['userId']);
//       return '/Mainscreen';
//     } catch (_) {
//       return '/HomeView';
//     }
//   } else {
//     return '/Mainscreen';
//   }
// }

Timer?_logoutTimer;
void startTokenTimer (String token){
  _logoutTimer?.cancel();
  final expirationDate=JwtDecoder.getExpirationDate(token);
  final reHomeViewingTime=expirationDate.difference(DateTime.now());
  if(reHomeViewingTime.isNegative){
    logout();
  }else{
    _logoutTimer=Timer(reHomeViewingTime, logout);
  }
}
// Future<void>logout() async {
//   _logoutTimer?.cancel();
//   final prefs=await SharedPreferences.getInstance();
//   await prefs.clear();
//   Get .offAllNamed('/HomeView');

// }
//  Future<bool> signInWithGoogle(context) async {
//   try {
    
//     GoogleAuthProvider googleProvider = GoogleAuthProvider();

//     UserCredential userCredential = await auth.signInWithPopup(googleProvider);

//     String? idToken = await userCredential.user?.getIdToken();
//     print("✅ ID Token: $idToken");

//     final response = await http.post(
//       Uri.parse('http://localhost:3300/auth/google-login'), 
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'idToken': idToken}),
//     );

//     if (response.statusCode == 200||response.statusCode==201)  {
//       final responseBody = jsonDecode(response.body);
//       print("🎉 Logged in successfully: ${responseBody['token']}");
    
//       final data = jsonDecode(response.body);
//       final prefs = await SharedPreferences.getInstance();
//         final token = data['token'];
//     final refreshToken = data['refreshtoken'];
//     final userId = data['userId'];

//    await saveTokens(token, refreshToken, userId);

// // final authController = Get.put(AuthController());
// startTokenTimer(token);

// Get.offAllNamed('/Mainscreen');

//     return true;
    
//     // refreshtoken=data['refreshtoken'];  
//     // token=data['token'];  
//     // userId=data['userId'];
      
//     //   await prefs.setString('token', data['token']);
//     //   await prefs.setString('refreshtoken', data['refreshtoken']);
//       // await prefs.setString('userId', data['userId']);
//       return true;
    
    
//     } else {
//       print("❌ Server error: ${response.statusCode}");
//       return false;
//     }
//   } catch (e) {
//     print("❌ Sign-in error: $e");
//     return false;
//   }
// }
 final FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool> signInWithGoogle(context) async {
  try {
    
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    UserCredential userCredential = await auth.signInWithPopup(googleProvider);

    String? idToken = await userCredential.user?.getIdToken();
    print("✅ ID Token: $idToken");

    final response = await http.post(
      Uri.parse('http://localhost:3300/auth/google-login'), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idToken': idToken}),
    );

    if (response.statusCode == 200||response.statusCode==201)  {
      final responseBody = jsonDecode(response.body);
      print("🎉 Logged in successfully: ${responseBody['token']}");
    
      final data = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
        final token = data['token'];
    final refreshToken = data['refreshtoken'];
    final userId = data['userId'];

   await saveTokens(token, refreshToken, userId);

// final authController = Get.put(AuthController());
startTokenTimer(token);

Get.offAllNamed('/Mainscreen');


    return true;
    
    // refreshtoken=data['refreshtoken'];  
    // token=data['token'];  
    // userId=data['userId'];
      
    //   await prefs.setString('token', data['token']);
    //   await prefs.setString('refreshtoken', data['refreshtoken']);
      // await prefs.setString('userId', data['userId']);
      return true;
    
    
    } else {
      print("❌ Server error: ${response.statusCode}");
      return false;
    }
  } catch (e) {
    print("❌ Sign-in error: $e");
    return false;
  }
}
// Future<UserCredential?>  signInWithGoogle() async {
//   try {
//     final GoogleAuthProvider googleProvider = GoogleAuthProvider();

//     final UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithPopup(googleProvider);

//     final user = userCredential.user;

//     // get firebase id token
//     final firebaseIdToken = await user?.getIdToken();
//     print('Firebase token: $firebaseIdToken');

//     final response = await http.post(
//       Uri.parse('${Applinks.baseurl}/auth/google-login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'idToken': firebaseIdToken}),
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final data = jsonDecode(response.body);

//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', data['token']);
//       // await prefs.setString('token', data['token']);
//       await prefs.setString('refreshtoken', data['refreshtoken']);
//       await prefs.setInt('userId', data['userId']);
// token=data['token'];print(data);

//       print('Token saved: ${data['token']}');
//     } else {
//       print('Server error: ${response.statusCode}');
//     }

//     return userCredential;

//   } catch (e) {
//     print("Google Sign-In Web Error: $e");
//     return null;
//   }
// }






// Future<void> saveTokens(String accessToken, String refreshtoken, int userId) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString('token', accessToken);
//   await prefs.setString('refreshtoken', refreshtoken);
//   await prefs.setInt('userId', userId);
// }


// Future<Map<String, dynamic>?> getTokens() async {
//   final prefs = await SharedPreferences.getInstance();
//   final accessToken = prefs.getString('token');
//   final refreshtoken = prefs.getString('refreshtoken');
//   final userId = prefs.getInt('userId');
//   if (accessToken != null && refreshtoken != null && userId != null) {
//     return {
//       'token': accessToken,
//       'refreshtoken': refreshtoken,
//       'userId': userId,
//     };
//   }
//   return null;
// }















//  final FirebaseAuth auth = FirebaseAuth.instance;


  // Future<void> uploadImage() async {
  //   if (imageBytes.value == null) {
  //     print('No image selected');
  //     return;
  //   }

  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final token = prefs.getString('token');

  //     if (token == null) {
  //       print('No token found');
  //       return;
  //     }

  //     dio.FormData formData = dio.FormData.fromMap({
  //       "file": dio.MultipartFile.fromBytes(
  //         imageBytes.value!,
  //         filename: fileName.value,
  //       ),
  //     });

  //     dio.Dio dioInstance = dio.Dio();
  //     dioInstance.options.headers["Authorization"] = "Bearer $token";

  //     dio.Response response = await dioInstance.patch(
  //       '${Applinks.baseurl}/users/upload',
  //       data: formData,
  //     );

  //     if (response.statusCode == 200) {
  //       String baseUrl = '${Applinks.baseurl}';
  //       String img = response.data['imagePath'];
  //       fullUrl.value = '$baseUrl/$img';

  //       print('Image uploaded: ${fullUrl.value}');
  //     } else {
  //       print('Upload failed: ${response.data}');
  //     }
  //   } catch (e) {
  //     print('Error uploading image: $e');
  //   }
  // }
// TextEditingController description=TextEditingController();
// TextEditingController name=TextEditingController();
//  String? selectedName;
//  String? selectedGrade;
//
bool passwordVisible=false; 
  //  @override 
  //   void initState(){ 
  //     super.initState(); 
  //   }  
String?selectedtype2;//=' المحاضره الاوله'; 
String?selectedtype; 
// String? selectedName='physics';
//   String? selectedGrade='السنة الدراسية الاولى';
List <String>type=[];
  Map<String, dynamic>? courseData;
TextEditingController emailinput=TextEditingController();
TextEditingController passwordinput=TextEditingController();
List <String>month_by_year=[];
  // List<String> names = [];
  List<String> alleventDate = [];
String? selectedmonth_by_year;
  // List<String> grades = [];
  List<String> attendence = [];
  List<String> section = [];
Student    student=Student();
Future<void> fetchDropdownData() async {
  try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = Uri.parse('${Applinks.baseurl}/courses/all');
    final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> data = json.decode(response.body);

      // Extract 'name' and 'grade' values from the response
      // names = data.map((item) => item['name'].toString()).toList();
      // grades = data.map((item) => item['grade'].toString()).toList();
      attendence = data.map((item) => item['attendance'].toString()).toList();
    //   section = section = data
    // .map((item) => item['section'])
    // .expand((x) => x)
    // .map((e) => e['name'].toString())
    // .toList();

// print('sec2$section');
      type=data .map((item)=>item['type'].toString()).toList();
      month_by_year=data .map((item)=>item['month_by_year'].toString()).toList();
      
// print('response ${data}');
      // print("Names: $names");
      // print("Grades: $grades");
      

    } else {
      throw Exception('Failed to load dropdown data');
    }
  } catch (error) {
    print('Error: $error');
  }
}

Future<void> allevents() async {
  try {
     final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final url = Uri.parse('${Applinks.baseurl}/events/alldate');
  final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> data = json.decode(response.body);
      alleventDate = data.map((item) => item['eventDate'].toString()).toList();
    } else {
      throw Exception('Failed to load dropdown data');
    }
  } catch (error) {
    print('Error: $error');
  }
}

Future<FilePickerResult?> pickVideos() async {
  return await FilePicker.platform.pickFiles(
    type: FileType.video,
  );
}
// late final result;


Future<void> uploadVideoWebSafe(PlatformFile file) async {
  final uri = Uri.parse("${Applinks.baseurl}/courses/uploadlessonvideo");

  var request = http.MultipartRequest("POST", uri);

  request.files.add(
    http.MultipartFile.fromBytes(
      'file',                 // MUST MATCH FileInterceptor name
      file.bytes!,            // bytes instead of file path
      filename: file.name,    // keep original name
      contentType: http_parser.MediaType('video', 'mp4'),
    ),
  );

  var response = await request.send();

  if (response.statusCode == 200 || response.statusCode == 201) {
    print("Uploaded Successfully");
    print(await response.stream.bytesToString());
  } else {
    print("Failed: ${response.statusCode}");
  }
}
late DropzoneViewController dropzone;

void setDropzoneController(DropzoneViewController ctrl) {
  dropzone = ctrl;
}
// import 'package:file_picker/file_picker.dart';



Future<void> uploadAll({
  required File imageFile,
  required File videoFile,
  required String name,
  required String price,
  required String viewingWatching,
}) async {

  final url = Uri.parse("${Applinks.baseurl}/courses/upload-all");

  var request = http.MultipartRequest('POST', url);

  request.fields['name'] = name;
  request.fields['price'] = price;
  request.fields['viewingWatching'] = viewingWatching;

  request.files.add(
    await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      filename: basename(imageFile.path),
    ),
  );

  // --------------------------------------
  // 👉 Add video file -> field: "video"
  // --------------------------------------
  request.files.add(
    await http.MultipartFile.fromPath(
      'video',
      videoFile.path,
      filename: basename(videoFile.path),
    ),
  );

  // --------------------------------------
  // 👉 Send request
  // --------------------------------------
  final response = await request.send();

  if (response.statusCode == 201 || response.statusCode == 200) {
    print("Upload success");
    final respStr = await response.stream.bytesToString();
    print(respStr);
  } else {
    print("Upload failed: ${response.statusCode}");
    final respStr = await response.stream.bytesToString();
    print(respStr);
  }
}

Future<void> uploadLessonVideo(String filePath) async {
  
  try {
  final uri = Uri.parse("${Applinks.baseurl}/courses/uploadlessonvideo");

  var request = http.MultipartRequest("POST", uri);

  request.files.add(
    await http.MultipartFile.fromPath(
      "file",     // <-- MUST MATCH FileInterceptor('file')
      filePath,
    ),
  );

  var response = await request.send();

  if (response.statusCode == 201 || response.statusCode == 200) {
    print("Video uploaded successfully");
    final respStr = await response.stream.bytesToString();
    print(respStr);
  } else {
    print("Upload failed: ${response.statusCode}");
  }   
  } catch (e) {
   print('why no video${e}'); 
  }
 
}

// Global variable for course data
 Course courseDatas=Course();
 Event eventData=Event();

   Future<void> fetchcoursedata(String ?name, String? grade) async {
    final url = Uri.parse('${Applinks.baseurl}/courses/name?name=$name&grade=$grade');

    try {
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        
      final data =await json.decode(response.body);
      
        courseDatas =await Course.fromJson(data);
    section = courseDatas.section!
    // .expand((x) => x)        
    .map((e) => e['name'] .toString() ).toList() ; 
    // .toList();
    print('newsection$section');
        update();
 print('o${data}');
      }  else {update();
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching coursessss : $e');
    } 
  }


  Images uniqueimg=Images();
   Future<void> findoneimg(String id) async {
    final url = Uri.parse('${Applinks.baseurl}/users/uniqueImg/$id');
    try {
      
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        
        final data =await json.decode(response.body);
        uniqueimg =await Images.fromJson(data);
        update();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching coursessss : $e');
print('let${uniqueimg.id}');

    }
  }

//   Course uniquecourse=Course();
//    Future<void> (String id) async {
//     final url = Uri.parse('${Applinks.baseurl}/courses/findoneuser/$id');
//     try {
      
//        final prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('token');
//       final response = await http.get(url,headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       });

//       if (response.statusCode == 200) {
        
//         final data =await json.decode(response.body);
//         uniquecourse =await Course.fromJson(data);
//         update();print('object:::${response.body}');
//       } else {
//       }
//     } catch (e) {
//       print('Error fetching coursessss : $e');
// print('let${uniqueimg.id}');

//     }
//   }

Future<void> fetchStudent(String userId, {int? page, }) async {

 try{ 
  final Uri uri = Uri.http(
    'localhost:3300', '/students/findoneuser/$userId',
    {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    },
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final json =await jsonDecode(response.body);
    student = Student.fromJson(json);
    print('Student loaded: ${student!.name}');
    print('Student loadedid: ${student!.id}');
    print('Student loaded: ${page.toString()}');
    update();
  } else {

    print('Student loaded: ${page.toString()}');
    print('Failed to fetch student: ${response.statusCode}');
  }}catch(e){print(e);}
 }

Course stu=Course();
Future<void> Studentsbycourse(String id, {int? page,  }) async {
  try {
    final Uri uri = Uri.http(
      'localhost:3300', 
      '/courses/onecourse',
      {
        'id': id,
        if (page != null) 'page': page.toString(),
        if (limit != null) 'limit': limit.toString(),
      },
    );
    
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    if (token == null) {
      print('No authentication token found');
      return;
    }

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      stu = Course.fromJson(jsonData);
      print('Course loaded successfully: ${stu?.toString()}');
      print('Response body: ${response.body}');
      update();
    } else {
      print('Failed to fetch course. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error in Studentsbycourse: $e');
    if (e is SocketException) {
      print('Network error - please check your connection');
    }
  }
}
Course onecourse =Course();
Future<void> fetchcourse(int id, {int? page, }) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3300', '/courses/findoneuser/$id',
    {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    },
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final json =await jsonDecode(response.body);
    onecourse = Course.fromJson(json);
    print('loaded: ${response.body}');
    print('loaded: ${student!.id}');
    print('loaded: ${page.toString()}');
    update();
  } else {

    print('loadedpage: ${page.toString()}');
    print('Failed to fetch student: ${response.statusCode}');
  }}catch(e){print(e);}
}

List<Questions> questions=[];
Future<void> fetchQuestions( {int? page, }) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3300', '/userquestion',
    {
      if (page != null)  'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    },
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // final json =await jsonDecode(response.body);
    // questions = Questions.fromJson(json);
    final let=json.decode(response.body);
     final List <dynamic>data=let['questions'];
      questions=data.map((item)=>Questions.fromJson(item)).toList();
    print('questions loaded: ${response.body!}');
    
    // print('questions loaded: ${questions!.id}');
    // print('questions loaded: ${page.toString()}');
    update();
  } else {

    print('questions loaded: ${page.toString()}');
    print('Failed to fetch questions: ${response.statusCode}');
  }}catch(e){print('que${e}');}
}
List<Student> students=[];
Future<void> fetchstud( {int? page,required  Id }) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3300', '/students/student/$Id',
    {
      if (page != null)  'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    },
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // final json =await jsonDecode(response.body);
    // questions = Questions.fromJson(json);
    
     final data=json.decode(response.body);
   final datas = json.decode(response.body);
  //  print('meme${data['percent']}');
      students=data.map((item)=>Student.fromJson(item)).toList();
    print('questions loaded: ${response.body!}');
    // print('questions loaded: ${questions!.id}');
    // print('questions loaded: ${page.toString()}');
    update();
  } else {

    print('questions loaded: ${page.toString()}');
    print('Failed to fetch questions: ${response.statusCode}');
  }}catch(e){print('que${e}');}
}

List<Assignments>assignment=[];
Future<void> fetchAssignments( {int? page, }) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3300', '/assignments/paginate',
    {
      if (page != null)  'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    },
  );
    
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // final json =await jsonDecode(response.body);
    // questions = Questions.fromJson(json);
     final List <dynamic>data=json.decode(response.body);
      assignment=data.map((item)=>Assignments.fromJson(item)).toList();
    print('assignment loaded: ${response.body!}');
    // print('assignment loaded: ${assignment!.id}');
    // print('assignment loaded: ${page.toString()}');
    update();
  } else {

    print('assignment loaded: ${page.toString()}');
    print('Failed to fetch assignment: ${response.statusCode}');
  }}catch(e){print('que${e}');}
}


Lessons lessons=Lessons();

Future<void> lessonquestions(String userId, {int? page, }) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3300', '/lesson/lessonquestions/$userId',
    {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
    },
  );
    
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final json =await jsonDecode(response.body);
    lessons = Lessons.fromJson(json);
    print('Student loaded: ${lessons!.name}');
    // print('Student loaded: ${page.toString()}');
    update();
  } else {

    // print('Student loaded: ${page.toString()}');
    print('Failed to fetch student: ${response.statusCode}');
  }}catch(e){print(e);}
}
void searchExams(String examName) {
  List.generate(students2.length,  (index) {
examName.isEmpty?
  findonestudent(
    '${students2[index].id}',
  
  ):
 

  findonestudent(
    '${students2[index].id}',
    exam_name: examName,
  );});
}
  Student       uniquestud=Student();
   Future<void> findonestudent(String id,{int?attendence,String ? exam_name}) async {
    final url = Uri.parse('${Applinks.baseurl}/students/findoneuser/$id?attendence=$attendence?exam_name=$exam_name');
    try {
      
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        
        final data =await json.decode(response.body);
        student =await Student.fromJson(data);
        update();
        // print('object:::${response.body}');
      } else {
      }
    } catch (e) {
//       print('Error fetching coursessss : $e');
// print('let${uniqueimg.id}');

    }
  }
  
  Course       uniquecourse=Course();
//    Future<void> findonecourse({String ?id}) async {
//     final url = Uri.parse('${Applinks.baseurl}/courses/findoneuser/$id');
//     try {
      
//        final prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('token');
//       final response = await http.get(url,headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       });

//       if (response.statusCode == 200) {
        
//         final data =await json.decode(response.body);
//         uniquecourse = Course.fromJson(data);
//         print('ide${uniquecourse.id}');
//         update();
//         print('object:::${response.body}');
//       } else {
//       }
//     } catch (e) {
// //       print('Error fetching coursessss : $e');
// print('let${uniqueimg.id}');

//     }
//   }

Course  courses=Course();
   Future<void> fetchcoursedata2(String? type) async {
  final url = Uri.parse('${Applinks.baseurl}/courses/type?type=$type');

  try {
     final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      courses = Course.fromJson(data);
   print('my persentages${courses.viewedPercentagesList}')   ;
  
update();

//  courses.percentages;
//  print ('percentages${courses.percentages.toString()}');
      // Map the course_attend data
    
      // print (courses['']);
      List<Map<String, dynamic>> attendanceData = courses.course_attend!
          .map((attend) => {
                'month': attend['month'],
                'seen_amount': double.parse(attend['seen_amount']),
                'pay_amount': double.parse(attend['pay_amount'])
              })
          .toList();

      update();
      // print('Attendance Data: $attendanceData');
    } else {
      // print('Error: ${response.statusCode}');
    }
  } catch (e) {
    // print('Error fetching course data: $e');
  }
}

Course coursebytype=Course();
   Future<void> fetchcoursedata4(String? type) async {
  final url = Uri.parse('${Applinks.baseurl}/courses/bytype?type=$type');

  try {
     final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
    final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

    if (response.statusCode == 200) {
  
      final data = json.decode(response.body);
      coursebytype = Course.fromJson(data);
update();
      // Map the course_attend data
      List<Map<String, dynamic>> attendanceData = coursebytype.course_attend!
          .map((attend) => {
                'month': attend['month'],
                'seen_amount': double.parse(attend['seen_amount']),
                'pay_amount': double.parse(attend['pay_amount'])
              })
          .toList();

      update();
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching course data: $e');
  }
}




    Future<void> fetchcoursedata3(String? month_by_year) async {
  final url = Uri.parse('${Applinks.baseurl}/courses/month_by_year?month_by_year=$month_by_year');

  try {
     final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
    final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      courses = Course.fromJson(data);
update();
      // Map the course_attend data
      List<Map<String, dynamic>> attendanceData = courses.course_attend!
          .map((attend) => {
                'month': attend['month'],
                'seen_amount': double.parse(attend['seen_amount']),
                'pay_amount': double.parse(attend['pay_amount'])
              })
          .toList();

      update();
    } else {
      // print('Error: ${response.statusCode}');
    }
  } catch (e) {
    // print('Error fetching course data: $e');
  }
}




//    Future<void> fetchcoursedata3(String? type) async {
//   final url = Uri.parse('${Applinks.baseurl}/courses/type?type=$type');

//   try {
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       courses = Course.fromJson(data);
// update();
//       // Map the course_attend data
//       List<Map<String, dynamic>> attendanceData = courses.course_attend!
//           .map((attend) => {
//                 'month': attend['month'],
//                 'seen_amount': double.parse(attend['seen_amount']),
//                 'pay_amount': double.parse(attend['pay_amount'])
//               })
//           .toList();

//       update();
//       print('Attendance Data: $attendanceData');
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error fetching course data: $e');
//   }
// }


  //  Future<void> eventDate(String ?eventDate, ) async {
  //   final url = Uri.parse('${Applinks.baseurl}/events/date?eventdate=$eventDate');

  //   try {
  //     final response = await http.get(url);

  //     if (
  //       response.statusCode == 200
  //       ||response.statusCode == 201
  //     ) {
        
  //       final data =await json.decode(response.body);
  //       eventData =await Event.fromJson(data);
  //       update();
  //       print('eventres:${data}');
  //     } else {
  //       print('Error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching course data: $e');
  //   }
  // }



// Future <void> fetchcoursedata (String name ,String grade)async{

//   final url =Uri.parse('${Applinks.baseurl}/courses/name?name=$name&grade=$grade');
//   final response=await http.get(url);
//   if(response.statusCode==200||response.statusCode==201){

//    courseData= await json.decode(response.body);
//    print ('mmmmmmmm');
//    print('m${courseData}');
//   }else{
//    print('ll$courseData');
// courseData= await json.decode(response.body);
//    print ('mmmmmmmm');
//    print('m${courseData}');
   
//   }
// }
//   // Map<String, dynamic>? courseData;
String val='';
  final count = 0.obs;
  
  
  
  @override
var controllers = <TextEditingController>[].obs;

// List<TextEditingController> controllers = [].obs;


  void onInit() {
    fetchAssignments();
    exampagination(page: 3);
    controllers.add(TextEditingController());
    fetchQuestions();
    getLessons();
    // controlall(coursemanager.map((id)=>id.id).toString());
    List.generate(students.length,
  (index){return  findonestudent('${students[index].id}');});
    List.generate(students.length,
  (index){return  fetchStudent('${students[index].id}');});
     allpaginsections(page:currentPage);
     gloabalsection();
    // findoneimg(uniqueimg.toString());
    users_info();
    allcourseinfo();
    // loginUser('haglwml@gmail.com','12345');
    coursemanage();
    course_reserv();
    course_info();
    allstudents();
    studentexam(1);
    // allpagin(1,1);
    allnopagin();
    super.onInit();
    fetchcoursedata2('');
    allevents();fetchDropdownData();
    // getallcourse();
    // getallSystems();
    // fetchData('Egyptian System-Arabc' );
    // getallSystemss('Egyptian system');
    // fetchDropdownData();
    eventDate('2025-01-07');
fetchcoursedata('physics','السنة الدراسية الاولى');
  }

String formatDate(DateTime date) {
  return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}

Future<void> eventDate(String? eventDate) async {
  final url = Uri.parse('${Applinks.baseurl}/events/date?eventdate=$eventDate');
  
  try {
     final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
    final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);

      // Check if the response has valid data
      if (data != null && data.isNotEmpty) {
        eventData = Event.fromJson(data);
      } else {
   Text('no events');
      }

      update();
    } else {
      // print('Error: ${response.statusCode}');
    }
  } catch (e) {
    Text('no events');
    // print('Error fetching event data: $e');
    eventData = Event(title: 'there is no events');
    eventData = Event(description: 'there is no events'); 
    update();
  }

}


userInfo users=userInfo();
String img='';
String img2='';
Future<void> users_info() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token'); // Retrieve token

  if (token == null || token.isEmpty) {
    // print('Error: No token found');
    return;
  }

  final url = Uri.parse('${Applinks.baseurl}/users/userInfo');

  try {
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201||response.statusCode!=null) {
      final data = jsonDecode(response.body); // Decode JSON response
      users = userInfo.fromJson(data); // Parse data into userInfo model

      update(); // Notify state update if using GetX
img='http://localhost:3300/${users.image.toString().replaceAll(r'\', '/')}';
img2=users.image.toString();
      // print('User Image: ${users.image.toString()}');
      // print('User Images: ${img}');
    } else {
      // print('Error: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    // print('Error fetching user data: $e');
    update();
  }
}



  @override
  void initState() {
    allevents();
      passwordVisible=true; 

    fetchDropdownData();
  }



  // List<Bundle>allbundle=[];
Future <void> putcourse(String id, String name,String description) async{
  try{
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'name':name,"description":description});
var url ='${Applinks.baseurl}/bundles/$id';
final response=await http .put(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
//  print(response.statusCode); 
 update();
 response.body;
 update();
//  getallcourse();
}
else{
  // print('hhhhhhhhh');
}
}catch(e){
  print(e);
}
}

Future <void> addcourse( String name,String description) async{
  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'name':name,"description":description});
var url ='${Applinks.baseurl}/bundles';
final response=await http .post(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
//  print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{print('hhhhhhhhh');}
}catch(e){
  // print(e);
}
}
 
TextEditingController nametext=TextEditingController();
TextEditingController teacher_answertext=TextEditingController();
Future <void> add( String lessonId) async{
  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'name':nametext.text,"teacher_answer":teacher_answertext.text,
    "chooses":controllers.map((c) => c.text).toList() ,"lessonId":lessonId});
var url ='${Applinks.baseurl}/userquestion/teacher_choose/question';
final response=await http .post(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{print('hhhhhhhhh');
print(response.statusCode);
}
}catch(e){
  print(e);
}
}
 TextEditingController wrightwrongname=TextEditingController();
 TextEditingController wrightwrongteacher_answer=TextEditingController();
Future <void> wrightWrong( String lessonId) async{

  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'name':wrightwrongname.text,"teacher_answer":wrightwrongteacher_answer.text
   ,"lessonId":lessonId});
var url ='${Applinks.baseurl}/userquestion/teacher_yesno/question';
final response=await http .post(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{print('hhhhhhhhh');
print(response.statusCode);
}
}catch(e){
  print(e);
}
}
TextEditingController completename=TextEditingController();
TextEditingController completeteacher=TextEditingController();
Future <void> completeQuestion( String lessonId) async{

  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'name':completename.text,"teacher_answer":completeteacher.text
   ,"lessonId":lessonId});
var url ='${Applinks.baseurl}/userquestion/teachercomplete/question';
final response=await http .post(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{print('hhhhhhhhh');
print(response.statusCode);
}
}catch(e){
  print(e);
}
}
TextEditingController textname=TextEditingController();
TextEditingController textteacher=TextEditingController();
Future <void> textQuestion( String lessonId) async{

  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'name':textname.text,"teacher_answer":textteacher.text
   ,"lessonId":lessonId});
var url ='${Applinks.baseurl}/userquestion/teacher_text/question';
final response=await http .post(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{print('hhhhhhhhh');
print(response.statusCode);
}
}catch(e){
  print(e);
}
}
 
 TextEditingController teacher_answer=TextEditingController();
Future <void> addanswer(int id) async{
  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'teacher_answer':teacher_answer.text,});
var url ='${Applinks.baseurl}/userquestion/$id';
final response=await http .post(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
//  print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{print('hhhhhhhhh');}
}catch(e){
  // print(e);
}
}

Future <void> addLessonType( String type,String question,String answer) async{
  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'type':type,'question':question});
var url ='${Applinks.baseurl}/lesson';
final response=await http .post(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
//  print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{print('hhhhhhhhh');}
}catch(e){
  // print(e);
}
}


// Future <void> addsection( String name,String price,) async{
//   try{
    
//       final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     var body=json.encode({'name':name,"description":description});
// var url ='${Applinks.baseurl}/bundles';
// final response=await http .post(Uri.parse(url),body:body
// ,headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       }
// );

// if(response.statusCode==201||response.statusCode==200){
//  print(response.statusCode); 
//  update();
//  response.body;
// //  getallcourse();
// }
// else{print('hhhhhhhhh');}
// }catch(e){
//   print(e);
// }
// }
TextEditingController oldPasswordcontroller=TextEditingController();
TextEditingController newPasswordcontroller=TextEditingController();
Future <void> updatePasword( ) async{
  try{
    
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({'oldPassword':oldPasswordcontroller.text,"newPassword":newPasswordcontroller.text});
var url ='${Applinks.baseurl}/auth/change-password';
final response=await http.put(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{
  // print('hhhhhhhhh');

}
}catch(e){
  // print(e);
}
}
Future <void> deleteaccount( ) async{
  try{
    
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'oldPassword':oldPasswordcontroller.text,"newPassword":newPasswordcontroller.text});
var url ='${Applinks.baseurl}/users/freeze';
final response=await http .put(Uri.parse(url),//body:body
// ,
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
//  print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
}
else{
  // print('hhhhhhhhh');
  }
}catch(e){
  // print(e);
}
}
// Future <void> deletesection( String id) async{
//   try{
    
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     // var body=json.encode({'oldPassword':oldPasswordcontroller.text,"newPassword":newPasswordcontroller.text});
// var url ='${Applinks.baseurl}/sections/$id';
// final response=await http .put(Uri.parse(url),//body:body
// // ,
// headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       }
// );

// if(response.statusCode==201||response.statusCode==200){
// //  print(response.statusCode); 
//  update();
//  response.body;
// //  getallcourse();
// }
// else{
//   // print('hhhhhhhhh');
//   }
// }catch(e){
//   // print(e);
// }
// }

// Future <void> addtoke

void saveToken(String token) {
  final box = GetStorage();
  box.write('auth_token', token);
}















 final String baseUrl = "${Applinks.baseurl}/auth"; // غيّر هذا إلى عنوان API الحقيقي

  Future<bool> register(String email, String password) async {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"email": email, "password": password}),
    );

    return response.statusCode == 201;
  }
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController firstnamecontroller=TextEditingController();

//   Future<bool> updateInfo( ) async {
//       final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     final response = await http.patch(
//       Uri.parse('${Applinks.baseurl}/users/updateInfo'),
// headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       },
//       body: jsonEncode({
//       "email": emailController.text,
//        "fullname": firstnamecontroller.text
//        ,"phone":phonecontroller.text}),
//     );

//     return response.statusCode == 201;
//   }

final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<bool> login(context) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": emailController.text, "password": passwordController.text}),
    );
  if(response.statusCode==401){ 
     ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("wrong password or email"),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () {
    
      },
    ),
  ),
);
    // print('object');
    
    return false;
  }
    if (response.statusCode == 200||response.statusCode==201) {
      final data = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      
      await prefs.setString('token', data['token']); // حفظ التوكن
      print(data);
      return true;
    }

   else{ 
    
    print('object');
    
    return false;
  }}

//   Future<bool> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     if (token == null) return false;
// // print(token+'pl');
//     final response = await http.post(
//       Uri.parse('$baseUrl/logout'),
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       },
//     );

//     if (response.statusCode == 200
//     ||response.statusCode==201
//     ||response.statusCode==204
//     ) {
//       // print(response.statusCode);
//       await prefs.remove('token'); // حذف التوكن عند تسجيل الخروج
//       return true;
//     }else
//  { 
//     // print('object');
//     return false;}
//   }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null ||prefs.getString('accessToken') != null;
  }











// Future<void> saveTokens(String accessToken, String refreshToken, int userId) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString('accessToken', accessToken);
//   await prefs.setString('refreshToken', refreshToken);
//   await prefs.setInt('userId', userId);
// }

// Future<Map<String, dynamic>?> getTokens() async {
//   final prefs = await SharedPreferences.getInstance();
//   final accessToken = prefs.getString('accessToken');
//   final refreshToken = prefs.getString('refreshToken');
//   final userId = prefs.getInt('userId');
//   if (accessToken != null && refreshToken != null && userId != null) {
//     return {
//       'accessToken': accessToken,
//       'refreshToken': refreshToken,
//       'userId': userId,
//     };
//   }
//   return null;
// }




Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}
// String token='' ;


Future<void> loginUser() async {
  final String url = '${Applinks.baseurl}/auth/login';

  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
      Uri.parse(url),
     headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({'email': emailinput.text, 'password': passwordinput.text}),
    );

    // print('Response Code: ${response.statusCode}');
    // print('Response Body: ${response.body}');

    if (response.statusCode == 200
    ||response.statusCode == 201
    ) {
      final data = jsonDecode(response.body);
     
      if (data.containsKey('token')) {
   String         token = data['token'];
        saveToken(token);
        // Get.offAll(MyWidget());
      isLoggedIn();
        // print('Login successful! Token: $token');
      } else {
        // print('Token not found in response');
      }
    } else {
      // print('Login failed: ${response.body}');
    }
  } catch (e) {
    // print('Error: $e');
  }
}

// Future<bool> isLoggedIn() async {
//   final prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString('token');
//   return token != null;
// }

     // final String? token = getToken(); 
//  Uint8List? imageBytes;
//   String? fileName;

  // Future<void> pickImage() async {
  //   html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  //   uploadInput.accept = 'image/*';
  //   uploadInput.click();

  //   uploadInput.onChange.listen((event) {
  //     final file = uploadInput.files!.first;
  //     final reader = html.FileReader();

  //     reader.readAsArrayBuffer(file);
  //     reader.onLoadEnd.listen((event) {
  //       // setState(() {
  //         imageBytes.value = reader.result as Uint8List?;
  //         fileName.value = file.name;
  //       // });
  //     });
  //   });
  // }
// String fullUrl='';
// // String img='';
//   Future<void> uploadImage() async {
//     if (imageBytes == null) return;

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');

//       if (token == null) {
//         print('No token found');
//         return;
//       }

//       dio.FormData formData = dio.FormData.fromMap({
//         "file": dio.MultipartFile.fromBytes(
//           imageBytes!,
//           filename: fileName,
//         ),
//       });

//       dio.Dio dioInstance = dio.Dio();
//       dioInstance.options.headers["Authorization"] = "Bearer $token";

//       dio.Response response = await dioInstance.patch(
//         '${Applinks.baseurl}/users/upload', // Replace with your backend URL
//         data: formData,
//       );

//       if (response.statusCode == 200) {
//       String baseUrl = '${Applinks.baseurl}';  // Replace with actual API URL
// String img = response.data['imagePath'];

//  fullUrl
//   = '$baseUrl/$img';
// print('Image URL: $fullUrl');

//         print('Upload successful: ${response.data['imagePath']}');
//       } else {
//         print('Upload failed: ${response.data}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// Future <void> addfile( String image,) async{
  
//   try{
    
//  String? token = await getToken();
//     var body=json.encode({'image':image});
// var url ='${Applinks.baseurl}/users/upload';
// // String token = await Candidate().getToken();

// final response=await http .patch(Uri.parse(url),body:body
//   ,headers: {
//           'Content-Type': 'application/json','Authorization':'Bearer ${token}'
//       // ,'Authorization':'Bearer ${token}'  
//       },
// );
// // String? token = response.headers['authorization'];

// if(response.statusCode==201||response.statusCode==200){
//  print(response.statusCode); 
//  update();
//  response.body;
// //  getallcourse();
// }
// else{print('hhhhhhhhh');

// print(response.statusCode);
// }
// }catch(e){
//   print(e);
// }
// }
  // Uint8List? imageBytes;
  // String? fileName;
  // String? fullUrl;

  // Future<void> pickImage() async {
  //   html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  //   uploadInput.accept = 'image/*';
  //   uploadInput.click();

  //   uploadInput.onChange.listen((event) {
  //     final file = uploadInput.files!.first;
  //     final reader = html.FileReader();

  //     reader.readAsArrayBuffer(file);
  //     reader.onLoadEnd.listen((event) {
  //       // setState(() {
  //         imageBytes = reader.result as Uint8List?;
  //         fileName = file.name;
  //       // });
  //       print('Image selected: $fileName');
  //     });
  //   });
  // }




  // Future<void> pickAndUploadImage() async {
  //   html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  //   uploadInput.accept = 'image/*';
  //   uploadInput.click();

  //   uploadInput.onChange.listen((event) async {
  //     final file = uploadInput.files!.first;
  //     final reader = html.FileReader();

  //     reader.readAsArrayBuffer(file);
  //     reader.onLoadEnd.listen((event) async {
  //       // setState(() {
  //         imageBytes = reader.result as Uint8List?;
  //         fileName = file.name;
  //       // });

  //       print('Image selected: $fileName');

  //       // Call upload function after image is picked
  //       await uploadImage();
  //     });
  //   });
  // }
  // Future<void> uploadImage() async {
  //   if (imageBytes == null) {
  //     print('No image selected');
  //     return;
  //   }

  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final token = prefs.getString('token');

  //     if (token == null) {
  //       print('No token found');
  //       return;
  //     }

  //     dio.FormData formData = dio.FormData.fromMap({
  //       "file": dio.MultipartFile.fromBytes(
  //         imageBytes!,
  //         filename: fileName,
  //       ),
  //     });

  //     dio.Dio dioInstance = dio.Dio();
  //     dioInstance.options.headers["Authorization"] = "Bearer $token";

  //     dio.Response response = await dioInstance.patch(
  //       '${Applinks.baseurl}/users/upload',
  //       data: formData,
  //     );

  //     if (response.statusCode == 200) {
  //       // setState(() {
  //         String baseUrl = '${Applinks.baseurl}';
  //         String img = response.data['imagePath'];
  //         fullUrl = '$baseUrl/$img';
  //       // });

  //       print('Image uploaded: $fullUrl');
  //     } else {
  //       print('Upload failed: ${response.data}');
  //     }
  //   } catch (e) {
  //     print('Error uploading image: $e');
  //   }
  // }

Future<void> addFile(String image) async {
  try {
    String? token = await getToken();
    if (token == null) {
      print('Token is null');
      return;
    }

    var body = json.encode({'image': image});
    var url = '${Applinks.baseurl}/users/upload';

    final response = await http.patch(
      Uri.parse(url),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('File added successfully: ${response.body}');
    } else {
      print('Failed to add file: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error adding file: $e');
  }
}

Future<void> uploadInfo() async {
  try {
  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var body = json.encode({
    'email': emailController.text,
    'fullname':firstnamecontroller.text,
    'phone':phonecontroller.text});
    var url = '${Applinks.baseurl}/users/updateInfo';

    final response = await http.patch(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('File added successfully: ${response.body}');
    } else {
      print('Failed to add file: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error adding file: $e');
  }
}

Future <void> deletecourse( String id) async{

  try{  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});


var url ='${Applinks.baseurl}/bundles/$id';
final response=await http .delete(Uri.parse(url),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200||response.statusCode==204){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
 update();
//  getallcourse();
}
else{print('hhhhhhhhh');
 response.body;
 print(response.statusCode);
 update();
}
}catch(e){
  print(e);
}
}

Future <void> deleteexam( String id) async{

  try{  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});
var url ='${Applinks.baseurl}/exams/$id';
final response=await http .delete(Uri.parse(url),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200||response.statusCode==204){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
 update();
//  getallcourse();
}
else{print('hhhhhhhhh');
 response.body;
 print(response.statusCode);
 update();
}
}catch(e){
  print(e);
}
}
Future <void> deletesection( String id) async{

  try{  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});
var url ='${Applinks.baseurl}/sections/$id';
final response=await http .delete(Uri.parse(url),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200||response.statusCode==204){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
 update();
//  getallcourse();
}
else{print('hhhhhhhhh');
 response.body;
 print(response.statusCode);
 update();
}
}catch(e){
  print(e);
}
}

Future <void> deleteLesson( String id) async{

  try{  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});
var url ='${Applinks.baseurl}/lesson/$id';
final response=await http .delete(Uri.parse(url),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200||response.statusCode==204){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
 update();
 
//  getallcourse();
}
else{print('hhhhhhhhh');
 response.body;
 print(response.statusCode);
 update();
}
}catch(e){
  print(e);
}
}



Future <void> deleteimage(String id) async{
  try{  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});
var url ='${Applinks.baseurl}/users/image/$id';
final response=await http .delete(Uri.parse(url),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200||response.statusCode==204){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
 update();
 print('image deleted');
//  getallcourse();
}
else{print('hhhhhhhhh');
 response.body;
 print(response.statusCode);
 update();
}
}catch(e){
  print(e);
}
}
Future <void> deletecourseinfo( String id) async{
  try{
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});
var url ='${Applinks.baseurl}/course-info/delete/$id';
final response=await http .delete(Uri.parse(url),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200||response.statusCode==204){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
 update();
//  getallcourse();
}
else{print('hhhhhhhhh');
 response.body;
 print(response.statusCode);
 update();
}
}catch(e){
  print(e);
}
}



 var selectedTypes = 'center'.obs;
  // void courseStudentType(String type) {
  //   // other logic
  // }
  
  // void allstudents() {
  
  //   // other logic
  // }

  var typeList = <String>[];
  String selectedType = 'المحاضره الاوله';
  var attendanceData = <Map<String, dynamic>>[];

  // Fetch course types for the dropdown
  Future<void> fetchDropdownData11() async {
    try {
        final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final url = Uri.parse('${Applinks.baseurl}/courses/all');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        typeList = data.map((item) => item['type'].toString()).toList();
      } else {
        throw Exception('Failed to load dropdown data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

    var isButtonWhite = false.obs;
  void toggleButtonColor() {
    isButtonWhite.value = !isButtonWhite.value;
  }


  List<CourseAttend> courseAttends = [];
  List<Exam> Exams = [];
  int currentPage = 1;
  int totalPages = 9; 
  // Update this based on API response
  final int ? limit = 2;
   List<CourseAttend> CourseAttends =[];

  var students2 = <Student>[].obs;
  // List<Student> allStudents = [];

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchStudents();
  // }
void fetchexams()async{
  
}
  void fetchStudents() async {
    students = await allstudents();
    students = students;
  }

  void searchStudents(String query) async {
    if (query.isEmpty) {
      students = students;
    } else {
      students = await searchStudentss(query);
    }
  }
  
   searchStudentss(String query) async {
   try {
     final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // if (token == null || token.isEmpty) {
    //   throw Exception('Auth token not found');
    // }

    final uri = Uri.parse(
      '${Applinks.baseurl}/students/search/by?search=$query',
    );

    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

final List list = data['student'] ?? [];

return list.map((e) => Student.fromJson(e)).toList();

      // final  data = jsonDecode(response.body);
      // return data['student'].map((e) => Student.fromJson(e)).toList();
    } else {
      print('Failed to load students (${response.statusCode})');
        // ,
      // );
    }
   } catch (e) {
     print(e);
   } 
  }
  // void findonestudent(String id) {
  //   print("Find student by id: $id");
  //   // logic here
  // }

// List <Course>
List percent=[];
   List percents=[];
Future  allstudents()async{
  try {  
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/students');
    final response=await http.get (url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      
    if(response.statusCode==200){
    selectedTypes.value = 'all';
      final data =json.decode(response.body);
      print('meme${data['percent']}');
   percents =
    List<double>.from(data['percent'].map((e) => (e ?? 0).toDouble()));

percent = data['percent'];
      update();
    }
    else{
      print('errorstudents${response.statusCode}');
    }
  } catch (e) {
    print('Errorrr${e}');
  }
}


Dailytable dailytables=Dailytable();
Future  dailytable({String? coursetabledate})async{
  try {final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/dailytable?coursetabledate=$coursetabledate');
    final response=await http.get (url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    if(response.statusCode==200){
    selectedTypes.value = 'all';
        final json =await jsonDecode(response.body);
    dailytables = Dailytable.fromJson(json);
      update();
    }
    else{
      print('errorstudents${response.statusCode}');
    }
  } catch (e) {
    print('Errorrr${e}');
  }
}





  // var students = <Student>[].obs;
  var allStudents = <Student>[]; // Backup of all students

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchStudents();
  // }
// controller.students
//   void fetchStudents() async {
//     allStudents = await ApiService.searchStudents();
//     students = allStudents;
//   }

//   void searchStudents(String query) async {
//     if (query.isEmpty) {
//       students = allStudents;
//     } else {
//       final filtered = allStudents.where((student) {
//         return student.name!.toLowerCase().contains(query.toLowerCase()) ||
//                student.email!.toLowerCase().contains(query.toLowerCase()) ||
//                student.phoneNum!.contains(query);
//       }).toList();
//       students= filtered;
//     }
//   }






Future <void> courseStudentType(String courseType)async{
  try {
    selectedTypes.value = courseType;

      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/students/coursetype/${courseType}');
    final response=await http.get (url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      
    if(response.statusCode==200){
    // final json =await jsonDecode(response.body);
    // student = Student.fromJson(json);
      // print('students${data}');
         final List<dynamic>data =json.decode(response.body);
      students=data.map((item)=>Student.fromJson(item)).toList();
      update();
    }
    else{
      print('errorstudents${response.statusCode}');
    }
  } catch (e) {
    print('Errorrr${e}');
  }
}


Future <void>addLesson()async{

  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});
var url ='${Applinks.baseurl}/lesson/addLesson';
final response=await http .post(Uri.parse(url),//body:body
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200){
//  print(response.statusCode); 
 update();
 response.body;
 print('${response.body}');
 update();
 getLessons();
//  getallcourse();
}
else{print('hhhhhhhhh');}
}catch(e){
  // print('eeor$e');
}
}


List<Lessons> lesson=[];
Future <void> getLessons()async{
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/lesson');
    final response=await http.get (url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      
    if(response.statusCode==200||response.statusCode==201){
      final List<dynamic>data =json.decode(response.body);
      lesson=data.map((item)=>Lessons.fromJson(item)).toList();
      print('students${data}');
      update();
    }
    else{
      print('eeeeee${response.statusCode}');
    }
  } catch (e) {
    print('eeeeee${e}');
  }
}


Future <void> getattendence(bool? attendence)async{
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/students/$attendence');
    final response=await http.get (url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      
    if(response.statusCode==200){
      final List<dynamic>data =json.decode(response.body);
      lesson=data.map((item)=>Lessons.fromJson(item)).toList();
      print('2eeeee${data}');
      update();
    }
    else{
      print('2eeeee${response.statusCode}');
    }
  } catch (e) {
    print('Errorrr${e}');
  }
}

List<Sections>allsections=[];
Future <void> gloabalsection()async{
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/sections/allsections');
    final response=await http.get (url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

    if(response.statusCode==200){
      final List<dynamic>data =await json.decode(response.body);
      allsections=data.map((item)=>Sections.fromJson(item)).toList();
      update();
      print('students${data}');
    }

    else{
      print('errorstudents${response.statusCode}');
    }
  } catch (e) {
    print('Errorrr${e}');
  }
}

List<CourseInfo> course_infoall=[];
Future <void> allcourseinfo()async{
  
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/course-info/all');
    final response=await http.get (url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    if(response.statusCode==200){
      final List<dynamic>data =json.decode(response.body);
      course_infoall=data.map((item)=>CourseInfo.fromJson(item)).toList();
      print('allcontain${data}');
    }
    else{
      print('errorstudents${response.statusCode}');
    }
  } catch (e) {
    print('Errorrr${e}');
  }
}
List <Course>coursemanager=[];
List <Course>coursemanages=[];
List <course_reservation>coursereserv=[];
// List <Course>course=[];

Future<void> coursemanage({int? id, int? page, }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // بناء رابط الاستعلام
    final queryParameters = <String, String>{};
    if (id != null) queryParameters['id'] = id.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${Applinks.baseurl}/courses/coursestudnum')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      update();
      final List<dynamic> data = json.decode(response.body);
      coursemanager = data.map((item) => Course.fromJson(item)).toList();
      print(response.body);
      update();
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception caught: $e');
  }
}

Future<void> idcoursestudents({int? id, int? page, }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // بناء رابط الاستعلام
    final queryParameters = <String, String>{};
    if (id != null) queryParameters['id'] = id.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${Applinks.baseurl}/students/paginationcour')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      update();
      final List<dynamic> data = json.decode(response.body);
      coursemanages= data.map((item) => Course.fromJson(item)).toList();
      print(response.body);
      update();
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception caught: $e');
  }
}

Future<void>course_reserv()async{
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/course-reservation');
    final response=await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    if(response.statusCode==200||response.statusCode==201){
     final  List<dynamic> data=json.decode(response.body);
      coursereserv=data.map((item)=>course_reservation.fromJson(item)).toList();
      print('coursereserv${data}');
    }
    print('objectttt');
  } catch (e) {
    print('eee${e}');
  }
}
List<CourseInfo> courseinfo=[];
Future <void> course_info()async{
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =Uri.parse('${Applinks.baseurl}/course-info');
    final response=await http.get (url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    if(response.statusCode==200){
      final List<dynamic>data =json.decode(response.body);
      courseinfo=data.map((item)=>CourseInfo.fromJson(item)).toList();
      print('courseinfo${data}');
    }
    else{
      print('errorstudents${response.statusCode}');
    }
  } catch (e) {
    print('Errorrr${e}');
  }
}
  Future<void> allnopagin() async {
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = Uri.parse('${Applinks.baseurl}/course-attend/all');
    final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      CourseAttends = data.map((item) => CourseAttend.fromJson(item)).toList();
      print('llnn${data}');
    } else {
      throw Exception('Failed to load dropdown data');
    }
  } catch (error) {
    print('Error: $error');
  }
}
   Future<void> allpagin(int page) async {
    try {
        final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final url = Uri.parse(
          '${Applinks.baseurl}/course-attend?page=$page&limit=$limit');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        
          courseAttends = data.map((item) => CourseAttend.fromJson(item)).toList();
          print('pagination${data}');
          // Update totalPages dynamically based on response if available
      update();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

 List<Sections>sections=[];
 Future<void> allpaginsections({int? page}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final url = Uri.parse('${Applinks.baseurl}/sections?page=$page&limit=$limit');
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        sections = data.map((item) => Sections.fromJson(item)).toList();
        update();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  //  Future<void> allpaginsections(int page) async {
  //   try {
  //       final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //     final url = Uri.parse(
  //         '${Applinks.baseurl}/sections?page=$page&limit=$limit');
  //     final response = await http.get(url,headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token",
  //     });

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
        
  //         courseAttends = data.map((item) => CourseAttend.fromJson(item)).toList();
  //         print('pagination${data}');
  //         // Update totalPages dynamically based on response if available
  //     update();
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }
  List<Images>images=[];
   Future<void> allimages() async {
    try {
        final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final url = Uri.parse(
          '${Applinks.baseurl}/users/getallimages');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200||response.statusCode==201) {
        final List<dynamic> data = json.decode(response.body);
        
          images = data.map((item) => Images.fromJson(item)).toList();
          print('IMAGESSS');
          // print('olo-'+ 'http://localhost:3300/${images![1].url}');
      update();
      } else {

        print( 'Failed to load img');
      }
    } catch (error) {
      print('Error img: $error');
    }
  }

//   void handleSignIn() async {
//   var user = await GoogleSignInProvider().signIn();
//   if (user != null) {
//     print("User signed in: ${user.displayName}");
//   }
// }

// void handleSignOut() async {
//   await GoogleSignInProvider().signOut();
//   print("User signed out");
// }
  // static const baseUrl = 'http://localhost:3300'; // or your server IP

  // static Future<List<Student>> searchStudents(String query) async {
  //   final response = await http.get(Uri.parse('${Applinks.baseurl}/students?search=$query'));

  //   if (response.statusCode == 200) {
  //     List data = json.decode(response.body);
  //     return data.map((json) => Student.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load students');
  //   }
  // }
  
// List<Student> students=[];


Future <void >studentexam (int page )async{
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url=Uri.parse('${Applinks.baseurl}/students/pagination?page=$page&limit=$limit');
    final response=await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    if(response.statusCode==200 ){
      final List <dynamic>data=json.decode(response.body);
      students=data.map((item)=>Student.fromJson(item)).toList();
      update();
print('yes${students}');
print('why${data}');

    }
    else{
      print('Error:${response.statusCode}');
    }
  } catch (e) {
    print('error${e}');
  }

}
   Future<void> exampagination({int? page}) async {
    try {  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final url = Uri.parse(
          '${Applinks.baseurl}/exams?page=$page&limit=$limit');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        
          Exams = data.map((item) => Exam.fromJson(item)).toList();
          print('paginationexam${data}');
          // Update totalPages dynamically based on response if available
      update();
      } else {
        
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

 List<Exam>exam=[];
   Future<void> exampaginationonline({int? page}) async {
    try {  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final url = Uri.parse(
          '${Applinks.baseurl}/exams/online?page=$page&limit=$limit');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200||response.statusCode==201) {
        final List<dynamic> data = json.decode(response.body);
        
          Exams = data.map((item) => Exam.fromJson(item)).toList();
          print('paginationexam${data}');
          // Update totalPages dynamically based on response if available
      update();
      } else {
        
        print('Failed to load data:${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

// Future <void>controlcenter (int page,String id )async{
//   try {
//       final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     final url=Uri.parse('${Applinks.baseurl}/courses/$id?page=$page&limit=$limit');
//     final response=await http.get(url,headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       });
//     if(response.statusCode==200){
//       final List <dynamic>data=json.decode(response.body);
//      coursemanager=data.map((item)=>Course.fromJson(item)).toList();
//       update();
// print('controlcenter${response.statusCode}');
//     }
//     else{
//       print('Error:${response.statusCode}');
//     }
//   } catch (e) {
//     print('error${e}');
//   }
// }
  
Future <void>controlall (String id )async{
  try {
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url=Uri.parse('${Applinks.baseurl}/courses/$id?page=1&limit=5');
    final response=await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    if(response.statusCode==200){
      final List <dynamic>data=json.decode(response.body);
     coursemanager=data.map((item)=>Course.fromJson(item)).toList();
      update();
print('controlcenter${response.statusCode}');
    }
    else{
      print('Error:${response.statusCode}');
    }
  } catch (e) {
    print('error${e}');
  }
}
  
  // Fetch filtered course data by type
  Future<void> fetchCourseDataByType(String type) async {
    final url = Uri.parse('${Applinks.baseurl}/courses/bytype?type=$type');
    try {
        final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.get(url,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        attendanceData = List<Map<String, dynamic>>.from(
          data['course_attend'].map(
            (attend) => {
              'month': attend['month'],
              'seen_amount': double.parse(attend['seen_amount']),
              'pay_amount': double.parse(attend['pay_amount']),
            },
          ),
        );
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching course data: $e');
    }
  
}
  // Future<void> updateUserEmail(String email) async {
  //   try {
  //     final response = await http.patch(
  //       Uri.parse(apiUrl),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         'email': email,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       // Successful update
  //       final responseData = jsonDecode(response.body);
  //       setState(() {
  //         _responseMessage = 'User updated: ${responseData['email']}';
  //       });
  //     } else {
  //       setState(() {
  //         _responseMessage = 'Failed to update user. Status code: ${response.statusCode}';
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _responseMessage = 'Error: $e';
  //     });
  //   }
  // }
// Future<void> getallcourse() async {
//   try {
//     var url = '${Applinks.baseurl}/bundles';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final List<dynamic> data = json.decode(response.body);
//       allbundle = data.map((item) => Bundle.fromJson(item)).toList();
//       print('Response Data: ${response.body}');
//       update();
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Exception: $e');
//   }
// }

// List<System>allsystem=[];
// Future<void> getallSystems() async {
//   try {
//     var url = '${Applinks.baseurl}/system/allsystem';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final List<dynamic> data = json.decode(response.body);
//       allsystem = data.map((item) => System.fromJson(item)).toList();
//       print('Response system: ${response.body}');
//       update();
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Exception: $e');
//   }
// }
  
// Future<void> getallSystemss( String name) async {
//   try {
//     var url = '${Applinks.baseurl}/system/$name';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final List<dynamic> data = json.decode(response.body);
//       allsystem = data.map((item) => System.fromJson(item)).toList();
//       print('Response system: ${response.body}');
//       update();
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Exception: $e');
//   }
// }




// var system =System();
//  List<Grade>grade=[];
//   Future fetchData(String name) async {
   
//    try{
//     final response = await http.get(Uri.parse('${Applinks.baseurl}/system/$name'));

//     if (response.statusCode == 200) {
//       val=name;

//     // print('response findone');
//     print('name:${name}');
//     print('res:${response.body}');

// print(response.body);
//    final List<dynamic> data = json.decode(response.body);
//       allsystem = data.map((item) => System.fromJson(item)).toList();
//       print('objects:${allsystem}');
//     } else {
//       throw Exception('Failed to load data');
//     }}catch(e){print(e);}
//   }
 final ValueNotifier<String?> selectedValue = ValueNotifier<String?>(null);
  final ValueNotifier<bool> showAdditionalDropdown = ValueNotifier<bool>(false);



  // Future fetchData(String name) async {
  //   try {
  //     final response = await http.get(Uri.parse('${Applinks.baseurl}/system/$name'));

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
  //       allsystem = data.map((item) => System.fromJson(item)).toList();
  //       showAdditionalDropdown.value = allsystem.isNotEmpty;
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }



  // Future<List<System>> fetchSystems(String name) async {
  // final String apiUrl = '${Applinks.baseurl}/system/$name';

  //   try {
  //     // Make a GET request to the API
  //     final response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       // Parse the JSON response
  //       List<dynamic> data = jsonDecode(response.body);
  //       List<System> systems = data.map((json) => System.fromJson(json)).toList();
  //       return systems;
  //     } else {
  //       throw Exception('Failed to load systems');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching data: $e');
  //   }
  // }






















// Future<void> pickAndUploadImage2() async {
//   html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//   uploadInput.accept = 'image/*';
//   uploadInput.click();

//   uploadInput.onChange.listen((event) async {
//     final file = uploadInput.files!.first;
//     final reader = html.FileReader();

//     reader.readAsArrayBuffer(file);
//     reader.onLoadEnd.listen((event) async {
//       imageBytes.value = reader.result as Uint8List?;
//       fileName.value = file.name;
//       if (imageBytes != null) {
//         print('Image selected: $fileName');
//       }
//     });
//   });
// }

// TextEditingController exam_name = TextEditingController();
// TextEditingController examprice = TextEditingController();
// TextEditingController trials_number = TextEditingController();
// TextEditingController durationmin = TextEditingController();
// TextEditingController degree_success = TextEditingController();
// TextEditingController totaldegree = TextEditingController();

// int showDegreeafter = 0;
// int showdegreeEveryQues = 0;

void updateShowDegreeAfter(int value) {
  showDegreeafter = value;
  update();
}

void updateShowDegreeEveryQues(int value) {
  showdegreeEveryQues = value;
  update();
}

String seedate = '2025-01-06'; // Default value matching backend
String startdate = '2025-01-05'; // Default value matching backend

Future<void> uploadcard3online(BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print('No token found');
      return;
    }

    if (imageBytes2.value == null) {
      print('No image selected');
      return;
    }

    dio.FormData formData = dio.FormData.fromMap({
      "file": await dio.MultipartFile.fromBytes(
        imageBytes2.value!,
        filename: fileNameexam.value,
      ),
      "exam_name": exam_name.text,
      "online": 1,
      "examprice": examprice.text,
      "trials_number": trials_number.text,
      "durationmin": durationmin.text,
      "totaldegree": totaldegree.text,
      "degree_success": degree_success.text,
      "showdegreeEveryQues": showdegreeEveryQues.toString(),
      "showDegreeafter": showDegreeafter.toString(),
      "seedate": seedate, // Already formatted as YYYY-MM-DD
      "startdate": startdate, // Already formatted as YYYY-MM-DD
    });

    dio.Dio dioInstance = dio.Dio();
    dioInstance.options.headers["Authorization"] = "Bearer $token";

    dio.Response response = await dioInstance.post(
      '${Applinks.baseurl}/exams/upload',
      data: formData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('start: $startdate');  
      print('see: $seedate');
      print('Uploading with settings:');
      print('showDegreeafter: $showDegreeafter');
      print('showdegreeEveryQues: $showdegreeEveryQues');
      
      Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
      String imageUrl = response.data['imgcart'];
      print('Image uploaded: $imageUrl');
      update();
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
      print('Upload failed: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}

  void increment() => count.value++;

  RxBool isDashboardOpen = false.obs;

  Timer? _refreshTimer;

  String token = '';
  String refreshToken = '';
  int userId = 0;

  // ================= TOKENS =================

  // Future<Map<String, dynamic>?> getTokens() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final t = prefs.getString('token');
  //   final rt = prefs.getString('refreshtoken');
  //   final uid = prefs.getInt('userId');

  //   if (t == null || rt == null) return null;

  //   token = t;
  //   refreshToken = rt;
  //   userId = uid ?? 0;

  //   return {
  //     'token': token,
  //     'refreshtoken': refreshToken,
  //     'userId': userId,
  //   };
  // }

  // Future<void> saveTokens(
  //     String t, String rt, int uid) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', t);
  //   await prefs.setString('refreshtoken', rt);
  //   await prefs.setInt('userId', uid);

  //   token = t;
  //   refreshToken = rt;
  //   userId = uid;
  // }
  
  // Future<String> getInitialRoute() async {
  //   final tokens = await getTokens();
  //   if (tokens == null) return '/HomeView';

  //   if (JwtDecoder.isExpired(tokens['token'])) {
  //     try {
  //       await refreshAccessToken();
  //       return '/Mainscreen';
  //     } catch (_) {
  //       return '/HomeView';
  //     }
  //   }

  //   return '/Mainscreen';
  // }

  // RxBool isDashboardOpen = false.obs;
  // Timer? _refreshTimer;

  // String token = '';
  // String refreshToken = '';
  // int userId = 0;

  // RxBool isDashboardOpen = false.obs;
  // Timer? _refreshTimer;

  // String token = '';
  // String refreshToken = '';
  // int userId = 0;

  // ================= TOKENS =================
  Future<void> loadTokens() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    refreshToken = prefs.getString('refreshtoken') ?? '';
    userId = prefs.getInt('userId') ?? 0;
  }

  // Future<void> saveTokens(String t, String rt, int uid) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', t);
  //   await prefs.setString('refreshtoken', rt);
  //   await prefs.setInt('userId', uid);

  //   token = t;
  //   refreshToken = rt;
  //   userId = uid;
  // }

  // Timer? _refreshTimer;
  // RxBool isDashboardOpen = false.obs;

  // String token = '';
  // String refreshToken = '';
  // int userId = 0;

  // ================= TOKENS =================
  Future<Map<String, dynamic>?> getTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final t = prefs.getString('token');
    final rt = prefs.getString('refreshtoken');
    final uid = prefs.getInt('userId');

    if (t == null || rt == null) return null;

    token = t;
    refreshToken = rt;
    userId = uid ?? 0;

    return {'token': token, 'refreshtoken': refreshToken, 'userId': userId};
  }

  Future<void> saveTokens(String t, String rt, int uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', t);
    await prefs.setString('refreshtoken', rt);
    await prefs.setInt('userId', uid);

    token = t;
    refreshToken = rt;
    userId = uid;
  }

  // ================= INITIAL ROUTE =================
  Future<String> getInitialRoute() async {
    final tokens = await getTokens();
    if (tokens == null) return '/HomeView';

    if (JwtDecoder.isExpired(tokens['token'])) {
      try {
        await refreshAccessToken();
        return '/DashboardScreen'; // go to dashboard if valid
      } catch (_) {
        return '/HomeView';
      }
    }

    return '/DashboardScreen';
  }

  // ================= TOKEN LOGIC =================
  void startAutoRefresh(String token) {
    _refreshTimer?.cancel();

    final expiryDate = JwtDecoder.getExpirationDate(token);
    final remaining = expiryDate.difference(DateTime.now());

    if (remaining.isNegative) {
      _handleTokenExpired();
      return;
    }

    final refreshTime = remaining - const Duration(minutes: 1);
    _refreshTimer = Timer(refreshTime, _handleTokenExpired);
  }

  void stopAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  Future<void> _handleTokenExpired() async {
    if (isDashboardOpen.value) {
      // stay in dashboard and refresh token
      await refreshAccessToken();
    } else {
      // logout from other pages
      logout();
    }
  }

  Future<void> refreshAccessToken() async {
    try {
      final res = await Dio().post(
        'http://localhost:3300/auth/refreshtoken',
        data: {'refreshtoken': refreshToken},
      );

      await saveTokens(res.data['token'], refreshToken, userId);
      startAutoRefresh(res.data['token']);
    } catch (e) {
      logout();
    }
  }

  // ================= LOGOUT =================
  Future<void> logout() async {
    stopAutoRefresh();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed('/HomeView');
  }
}
