import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/Applinks.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/DashboardScreen.dart';
import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
import 'package:flutterwallet/app/modules/home/views/progress.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'dart:html'as html;
class Fileuploader {
    File? _videoFile;
  Uint8List? _videoBytes;
  String? _videoName;
  bool isUploading = false;
  final picker = ImagePicker();
  TextEditingController exam_name = TextEditingController();
  TextEditingController examprice = TextEditingController();
  TextEditingController trials_number = TextEditingController();
  TextEditingController durationmin = TextEditingController();
  TextEditingController degree_success = TextEditingController();
  TextEditingController totaldegree = TextEditingController();
  Future<PlatformFile?> pickVideoWebSafe() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      return result.files.single;
    }

    return null;
  }
  Future<FilePickerResult?> pickVideos() async {
    return await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
  }

  Future<void> uploadVideoWebSafe(PlatformFile file) async {
    final uri = Uri.parse("${Applinks.baseurl}/courses/uploadlessonvideo");

    var request = http.MultipartRequest("POST", uri);

    request.files.add(
      http.MultipartFile.fromBytes(
        'file', // MUST MATCH FileInterceptor name
        file.bytes!, // bytes instead of file path
        filename: file.name, // keep original name
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

  void pickAndUpload() async {
    final file = await pickVideoWebSafe();
    if (file != null) {
      await uploadVideoWebSafe(file);
    } else {
      print("No video selected");
    }
  }

  Future<void> pickVideoWeb() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.bytes != null) {
      _videoFile = null;
      _videoBytes = result.files.single.bytes;
      _videoName = result.files.single.name;
    } else {
    }
  }

  Future<void> uploadVideo() async {
    if (_videoFile == null && _videoBytes == null) {
      return;
    }
    isUploading = true;
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
        // print(' Uploading video (Web)');
        request.files.add(
          http.MultipartFile.fromBytes(
            'video',
            _videoBytes!,
            filename: _videoName,
            contentType: MediaType.parse(mimeType),
          ),
        );
      } else if (_videoFile != null) {
        print(' Uploading video (Mobile/Desktop)');
        request.files.add(
          await http.MultipartFile.fromPath(
            'video',
            _videoFile!.path,
            contentType: MediaType.parse(mimeType),
          ),
        );
      } else {
        print(' Unexpected error: No valid video file.');
        return;
      }

      var response = await request.send();
      if (response.statusCode == 201 || response.statusCode == 200) {
        // print(' Video uploaded successfully!');
      } else {
        // print(' Video upload failed: ${response.statusCode}');
      }
    } catch (e) {
      // print(' Error uploading video: $e');
    } finally {
      // setState(() {
      isUploading = false;
      // });
    }
  }

  final ValueNotifier<Uint8List?> imageBytes = ValueNotifier<Uint8List?>(null);
  final ValueNotifier<Uint8List?> imageBytes2 = ValueNotifier<Uint8List?>(null);
  final ValueNotifier<String?> fileName = ValueNotifier<String?>(null);
  final ValueNotifier<String?> fileNameexam = ValueNotifier<String?>(null);
  final ValueNotifier<String?> fullUrl = ValueNotifier<String?>(null);
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

    request.files.add(
      await http.MultipartFile.fromPath(
        'video',
        videoFile.path,
        filename: basename(videoFile.path),
      ),
    );

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
          "file",
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

  Future<void> pickAndUploadImage(context) async {
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
          await uploadImage(imageBytes, fileName,context);
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
        print('Image selected: $fileName');
        // await uploadImage(imageBytes, fileName);
            });
    });
  }
  int showDegreeafter = 0;
  int showdegreeEveryQues = 0;
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

      String formattedStartDate = controller.startdate.toString();

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
        "seedate":controller. seedate.toString(),
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

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Assignments2()));
        String imageUrl = response.data['imgcart'];
        print('Image uploaded: $imageUrl');
     controller.   update();
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Assignments2()));
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

  Future<void> uploadImage(Uint8List imageBytes, String fileName,context) async {
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
        String imageUrl = response.data['imagePath']; 
        print('Image uploaded: $imageUrl');
       controller. update();
      controller.  users_info(context);
     controller.   allimages();
        fullUrl.value = imageUrl;
      } else {}
    } catch (e) {}
  }
  int currentPage = 1;

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
        "name":controller. name.text,
        "price":controller. price.text,
        "viewingWatching":controller. viewingWatching.text,
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
      controller.  gloabalsection();
     controller.   allpaginsections(page: currentPage);
     controller.   update();
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
  // String seedate = '2025-01-06';
  // String startdate = '2025-01-05';

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
        "seedate":controller. seedate,
        "startdate":controller. startdate,
      });

      dio.Dio dioInstance = dio.Dio();
      dioInstance.options.headers["Authorization"] = "Bearer $token";

      dio.Response response = await dioInstance.post(
        '${Applinks.baseurl}/exams/upload',
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('start: ${controller. startdate}');
        print('see: ${controller.seedate}');
        print('Uploading with settings:');
        print('showDegreeafter: $showDegreeafter');
        print('showdegreeEveryQues: $showdegreeEveryQues');
        _buildButtonmain(
          icon: Image.asset('assets/close-circl.png', width: 24, height: 24),
          route: '/Mainscreen',
          isActive: Get.currentRoute == '/Mainscreen',
        );
        String imageUrl = response.data['imgcart'];
        print('Image uploaded: $imageUrl');
      controller.  update();
      } else {
        _buildButtonmain(
          icon: Image.asset('assets/close-circl.png', width: 24, height: 24),
          route: '/Mainscreen',
          isActive: Get.currentRoute == '/Mainscreen',
        );
        print('Upload failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Widget _buildButtonmain({
    required icon,
    required String route,
    bool isActive = false,
  }) {
    final HomeController controller = Get.find<HomeController>();

    return SizedBox(
      width: 24.0,
      height: 24.0,
      child: InkWell(
        onTap: () async {
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

}