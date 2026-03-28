import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutterwallet/app/modules/home/Applinks.dart';
import 'package:flutterwallet/app/modules/home/controllers/nav.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/modules/assignments.dart';
import 'package:flutterwallet/app/modules/home/modules/dailytable.dart';
import 'package:flutterwallet/app/modules/home/modules/lessons.dart';
import 'package:flutterwallet/app/modules/home/modules/questions.dart';
import 'package:flutterwallet/app/modules/home/modules/sections.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:path/path.dart';
import 'package:flutterwallet/app/modules/home/modules/users_info.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutterwallet/app/modules/home/modules/course_attend.dart';
import 'package:flutterwallet/app/modules/home/modules/course_info.dart';
import 'package:flutterwallet/app/modules/home/modules/exam.dart';
import 'package:flutterwallet/app/modules/home/modules/file.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet%20copy.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/students.dart';

class HomeController extends GetxController {
  Future<bool> refreshTokenForDialog() async {
    try {
      print('try renew token');

      if (refreshToken.isEmpty) {
        print('there is no refreshtoken for dialog');
        return false;
      }

      final res = await Dio().post(
        'http://localhost:3300/auth/refreshtoken',
        data: {'refreshtoken': refreshToken},
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        await saveTokens(res.data['token'], refreshToken, userId);
        _lastRefreshTime = DateTime.now();

        print('the dialog renewed successfully');

        return true;
      } else {
        print('faild to renew token for dialog: ${res.statusCode}');
        return false;
      }
    } catch (e) {
      print('something wrong for renew dialog $e');
      return false;
    }
  }
  
  int itemsPerPage = 10;
  int showDegreeafter = 0;
  int showdegreeEveryQues = 0;
  String? selectedGrade;
  String? selectedName;
  List<String> grades = [
    'السنة الدراسية الخامسة',
    'السنة الدراسية السادسة',
    'السنة الدراسية السابعة',
    'السنة الدراسية الثامنة'
  ];
  List<String> names = ['Math', 'physics', 'English', 'chemistery'];

  List<Course> allStudents1 = [];


  Future<bool> ensureTokenValidForDialog() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        print('there is no dialog');
        return false;
      }

      if (JwtDecoder.isExpired(token)) {
        print('the token ended try renew');

        final refreshed = await refreshTokenForDialog();

        if (refreshed) {
          print('the token renewed successfully you can follow dialog');
          return true;
        } else {
          print('failed');
          return false;
        }
      } 
      return true;
    } catch (e) {
      print('failed $e');
      return false;
    }
  }
  TextEditingController exam_name = TextEditingController();
  TextEditingController examprice = TextEditingController();
  TextEditingController trials_number = TextEditingController();
  TextEditingController durationmin = TextEditingController();
  TextEditingController degree_success = TextEditingController();
  TextEditingController totaldegree = TextEditingController();

  String formatDateForBackend(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
  String seedate='';
  String startdate='';
  String? photoUrl = '';
  Timer? _logoutTimer;
  void startTokenTimer(String token) {
    _logoutTimer?.cancel();
    final expirationDate = JwtDecoder.getExpirationDate(token);
    final reHomeViewingTime = expirationDate.difference(DateTime.now());
    if (reHomeViewingTime.isNegative) {
      logout();
    } else {
      _logoutTimer = Timer(reHomeViewingTime, logout);
    }
  }

  Future<bool> signInWithGoogle(context) async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      UserCredential userCredential =
          await auth.signInWithPopup(googleProvider);

      String? idToken = await userCredential.user?.getIdToken();
      print(" ID Token: $idToken");

      final response =
          await api.post('/auth/google-login', {'idToken': idToken}, context);

      final responseBody = response;
      print("🎉 Logged in successfully: ${responseBody['token']}");

      final data = response;
      final token = data['token'];
      final refreshToken = data['refreshtoken'];
      final userId = data['userId'];

      await saveTokens(token, refreshToken, userId);
      scheduleNextRefresh(data['token']);

     nav.toMainScreen();

      return true;

    } catch (e) {
      print("❌ Sign-in error: $e");
      return false;
    }
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool passwordVisible = false;

  bool isoptionselect = false;
  bool isoptionselecttablet = false;
  String? selectedtype2;
  String? selectedtype;
  List<String> type = [];
  Map<String, dynamic>? courseData;
  TextEditingController emailinput = TextEditingController();
  TextEditingController passwordinput = TextEditingController();
  List<String> month_by_year = [];
  List<String> alleventDate = [];
  String? selectedmonth_by_year;
  List<String> attendence = [];
  List<String> section = [];
  Student student = Student();
  Future<void> fetchDropdownData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final url = Uri.parse('${Applinks.baseurl}/courses/all');
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = json.decode(response.body);
        attendence = data.map((item) => item['attendance'].toString()).toList();

        type = data.map((item) => item['type'].toString()).toList();
        month_by_year =
            data.map((item) => item['month_by_year'].toString()).toList();
      } else {
        throw Exception('Failed to load dropdown data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> allevents() async {
    try {
      final response = await api.get('/events/alldate', context);

      final List<dynamic> data = response;
      alleventDate = data.map((item) => item['eventDate'].toString()).toList();
    } catch (error) {
      print('Error: $error');
    }
  }


  late DropzoneViewController dropzone;

  void setDropzoneController(DropzoneViewController ctrl) {
    dropzone = ctrl;
  }
  TextEditingController price = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController viewingWatching = TextEditingController();


  Course courseDatas = Course();
  Event eventData = Event();

  Future<void> fetchcoursedata(String? name, String? grade) async {
    try {
      // Applinks api =Applinks();
      final data = await api.getall(
        '/courses/name',
        queryParams: {
          "name": name ?? '',
          "grade": grade ?? '',
        },
      );

      courseDatas = Course.fromJson(data);
      section =
          courseDatas.section?.map((e) => e['name'].toString()).toList() ?? [];
      // section = courseDatas.section!
      //     .map((e) => e['name'].toString())
      //     .toList();

      print('newsection $section');

      update();

      print('data $data');
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  Images uniqueimg = Images();
  Future<void> findoneimg(String id) async {
    // final url = Uri.parse('${Applinks.baseurl}/users/uniqueImg/$id');
    try {
      final response = await api.get('/users/uniqueImg/$id', context);

      final data = await response;
      uniqueimg = await Images.fromJson(data);
      update();
    } catch (e) {
      print('Error fetching coursessss : $e');
      print('let${uniqueimg.id}');
    }
  }

  Future<void> fetchStudent(
    context,
    String userId, {
    int? page,
  }) async {
    try {
      final data = await api.get('/students/findoneuser/$userId', context,
          page: page, limit: limit);

      final json = await data;
      student = Student.fromJson(json);
      print('Student loaded: ${student.name}');
      print('Student loadedid: ${student.id}');
      print('Student loaded: ${page.toString()}');
      update();

      print('Student loaded: ${page.toString()}');
      print('Failed to fetch student: ${data.statusCode}');
    } catch (e) {
      print(e);
    }
  }

  Course stu = Course();
  Future<void> Studentsbycourse(
    BuildContext context,
    String id, {
    int? page,
  }) async {
    try {
// Applinks()
// getApi().get();

      final response = await api.get('/courses/onecourse', context,queryParams: {'id':id},
          page: page, limit: limit);

      final jsonData = response;
      stu = Course.fromJson(jsonData);
      print('Course loaded successfully: ${stu.toString()}');
      // print('Response body: ${response.body}');
      update();
    } catch (e) {
      print('Error in Studentsbycourse: $e');
      if (e is SocketException) {
        print('Network error - please check your connection');
      }
    }
  }

  Course onecourse = Course();
  Future<void> fetchcourse(
    BuildContext context,
    int id, {
    int? page,
  }) async {
    try {
      final res = await api.get('/courses/findoneuser/$id', context,
          page: page, limit: limit);

      final json = await res;
      onecourse = Course.fromJson(json);
      print('loaded: ${res.body}');
      print('loaded: ${student.id}');
      print('loaded: ${page.toString()}');
      update();
    } catch (e) {
      print(e);
    }
  }

  List<Questions> questions = [];
  Future<void> fetchQuestions(
    context, {
    int? page,
  }) async {
    try {
      final response =
          await api.get('/userquestion', context, page: page, limit: limit);

      final let = response;
      final List<dynamic> data = let['questions'];
      questions = data.map((item) => Questions.fromJson(item)).toList();
      print('questions loaded: ${response.body}');

      update();
      print('questions loaded: ${page.toString()}');
      print('Failed to fetch questions: ${response.statusCode}');
    } catch (e) {
      print('que${e}');
    }
  }

  List<Student> students = [];

  Future<void> fetchstud({int? page, required Id}) async {
    try {
      final response = await api.get(
        '/students/student/$Id',
        context,
        page: page,
        limit: limit,
      );
      if (response is List) {
        final data = response;
        students = data.map((item) => Student.fromJson(item)).toList();
        print('questions loaded: ${response}');
        update();
      }
    } catch (e) {
      print('que${e}');
    }
  }

  List<Assignments> assignment = [];
  Future<void> fetchAssignments(
    context, {
    int? page,
  }) async {
    try {
      final response = await api.get('/assignments/paginate', context);

      final List<dynamic> data = response;
      assignment = data.map((item) => Assignments.fromJson(item)).toList();

      update();
    } catch (e) {
      print('que${e}');
    }
  }

  Lessons lessons = Lessons();

  Future<void> lessonquestions(
    BuildContext context,
    String userId, {
    int? page,
  }) async {
    try {
      final response = await api.get('/lesson/lessonquestions/$userId', context,
          page: page, limit: limit);

      final json = await response;
      lessons = Lessons.fromJson(json);
      print('Student loaded: ${lessons.name}');

      update();
    } catch (e) {
      print(e);
    }
  }

  void searchExams(String examName) {
    List.generate(students2.length, (index) {
      examName.isEmpty
          ? findonestudent(
              context,
              '${students2[index].id}',
            )
          : findonestudent(
              context,
              '${students2[index].id}',
              exam_name: examName,
            );
    });
  }

  Student uniquestud = Student();
  Future<void> findonestudent(context, String id,
      {int? attendence, String? exam_name}) async {
    try {
      final response = await api.get(
        '/students/findoneuser/$id',
        context,
        queryParams: {
          "attendence": attendence.toString(),
          "exam_name": exam_name ?? '',
        },
      );

      final data = response;
      student = await Student.fromJson(data);
      update();
    } catch (e) {}
  }

  Course uniquecourse = Course();

  Course courses = Course();
  Future<void> fetchcoursedata2(context, String? type) async {
    try {
      final Map<String, String> queryparams = {"type": type ?? ""};
      final response =
          await api.get('/courses/type', context, queryParams: queryparams);
      final data = response;
      courses = Course.fromJson(data);
      print('my persentages${courses.viewedPercentagesList}');
      update();
    } catch (e) {}
  }

  Course coursebytype = Course();
  Future<void> fetchcoursedata4(String? type) async {
    try {
      final response = await api.get('/courses/bytype', context,
          queryParams: {'type': type.toString()});

      final data = json.decode(response);
      coursebytype = Course.fromJson(data);
      update();
      List<Map<String, dynamic>> attendanceData = coursebytype.course_attend!
          .map((attend) => {
                'month': attend['month'],
                'seen_amount': double.parse(attend['seen_amount']),
                'pay_amount': double.parse(attend['pay_amount'])
              })
          .toList();
attendanceData;
      update();
    } catch (e) {
      print('Error fetching course data: $e');
    }
  }

  Future<void> fetchcoursedata3(String? month_by_year) async {
    try {
      final response = await api.get('/courses/month_by_year', context,
          queryParams: {'month_by_year': month_by_year.toString()});

      final data = response;
      courses = Course.fromJson(data);
      update();
      List<Map<String, dynamic>> attendanceData = courses.course_attend!
          .map((attend) => {
                'month': attend['month'],
                'seen_amount': double.parse(attend['seen_amount']),
                'pay_amount': double.parse(attend['pay_amount'])
              })
          .toList();

      update();
      attendanceData;
    } catch (e) {}
  }

  String val = '';
  final count = 0.obs;

  var controllers = <TextEditingController>[].obs;
 fetching(){
    fetchQuestions(context);
fetchDropdownData();
fetchAssignments(context); fetchcoursedata2(context, '');
    fetchDropdownData();
 List.generate(students.length, (index) {
      return findonestudent(context, '${students[index].id}');
    });
    fetchcoursedata('physics', 'السنة الدراسية الاولى');

    List.generate(students.length, (index) {
      return fetchStudent(context, '${students[index].id}');
    });
}
  @override

  void onInit() {
    fetching();
    loadTokens();
    Future.delayed(Duration(seconds: 2), () {
      if (token.isNotEmpty) {
        fetchQuestions(context);
        fetchAssignments(context);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentScreen.value = Get.currentRoute;
    });

    exampagination(page: 3);
    controllers.add(TextEditingController());
    getLessons();
   
    allpaginsections(page: currentPage);
    gloabalsection();
    users_info(context);
    allcourseinfo();
    coursemanage();
    course_reserv();
    course_info();
    allstudents();
    studentexam(1);
    allnopagin();
    super.onInit();
    allevents();
    eventDate(context, '2025-01-07');
  }

  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future eventDate(
    context,
    String? eventDate,
  ) async {
    try {
      final response = await api.get('/events/date', context,
      queryParams: {"eventdate": eventDate ?? ""});
      final data = response;
      // if (data != null && data.isNotEmpty) {
        eventData = Event.fromJson(data);
      // }
      update();
    } catch (e) {
      Text('no events');
      eventData = Event(title: 'there is no events');
      eventData = Event(description: 'there is no events');
      update();
    }
  }

  userInfo users = userInfo();
  String img = '';
  String img2 = '';
  Future<void> users_info(context) async {
    try {
      final response = await api.get('/users/userInfo', context);

      final data = response;
      users = userInfo.fromJson(data);

      update();
      img =
          'http://localhost:3300/${users.image.toString().replaceAll(r'\', '/')}';
      img2 = users.image.toString();
      print('User Image: ${users.image.toString()}');
    } catch (e) {
      update();
    }
  }

  void initState() {
    allevents();
    passwordVisible = true;

    fetchDropdownData();
  }

  Future<void> putcourse(String id, String name, String description) async {
    try {
      final response = await api.put(
        '/bundles/$id',
        {'name': name, "description": description},
        context,
      );
      response;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addcourse(String name, String description) async {
    try {
      final response = await api.post(
          '/bundles', {'name': name, "description": description}, context);
      update();
      response;
    } catch (e) {}
  }

  TextEditingController nametext = TextEditingController();
  TextEditingController teacher_answertext = TextEditingController();
  Future<void> add(String lessonId) async {
    try {
      final response = await api.post(
          '/userquestion/teacher_choose/question',
          {
            'name': nametext.text,
            "teacher_answer": teacher_answertext.text,
            "chooses": controllers.map((c) => c.text).toList(),
            "lessonId": lessonId
          },
          context);

      print(response);
      update();
      response;
    } catch (e) {
      print(e);
    }
  }

  TextEditingController wrightwrongname = TextEditingController();
  TextEditingController wrightwrongteacherAnswer = TextEditingController();
  Future<void> wrightWrong(BuildContext context, String lessonId) async {
    try {
      final response = await api.post(
          '/userquestion/teacher_yesno/question',
          {
            'name': wrightwrongname.text,
            "teacher_answer": wrightwrongteacherAnswer.text,
            "lessonId": lessonId
          },
          context);
response;
      update();

    } catch (e) {
      print(e);
    }
  }

  TextEditingController completename = TextEditingController();
  TextEditingController completeteacher = TextEditingController();
  Future<void> completeQuestion(String lessonId) async {
    try {
      final response = await api.post(
          '/userquestion/teachercomplete/question',
          {
            'name': completename.text,
            "teacher_answer": completeteacher.text,
            "lessonId": lessonId
          },
          context);

      update();
      response;
    } catch (e) {
      print(e);
    }
  }

  TextEditingController textname = TextEditingController();
  TextEditingController textteacher = TextEditingController();
  Future<void> textQuestion(BuildContext context, String lessonId) async {
    try {
      final response = await api.post(
          '/userquestion/teacher_text/question',
          {
            'name': textname.text,
            "teacher_answer": textteacher.text,
            "lessonId": lessonId
          },
          context);

      response;
    } catch (e) {
      print(e);
    }
  }

  TextEditingController teacher_answer = TextEditingController();
  Future<void> addanswer(int id, BuildContext context) async {
    try {
      final response = await api.post('/userquestion/$id',
          {'teacher_answer': teacher_answer.text}, context);
      response;
    } catch (e) {
      print('Error:$e');
    }
  }

  Future<void> addLessonType(
      BuildContext context, String type, String question, String answer) async {
    try {
      final response = await api.post(
          '/lesson', {'type': type, 'question': question}, context);
      response;
    } catch (e) {
      print('Error$e');
    }
  }

  TextEditingController oldPasswordcontroller = TextEditingController();
  TextEditingController newPasswordcontroller = TextEditingController();
  Future<void> updatePasword(BuildContext context) async {
    try {
      final response = await api.put(
          '/auth/change-password',
          {
            'oldPassword': oldPasswordcontroller.text,
            "newPassword": newPasswordcontroller.text
          },
          context);
      response;
    } catch (e) {
      print('Error$e');
    }
  }

  Future<void> deleteaccount(context) async {
    try {
      final response = await api.put('/users/freeze', {}, context);
      print(response);
      response;
    } catch (e) {}
  }

  void saveToken(String token) {
    final box = GetStorage();
    box.write('auth_token', token);
  }

  final String baseUrl = "${Applinks.baseurl}/auth";
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

  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();

   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null ||
        prefs.getString('accessToken') != null;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

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
        body: jsonEncode(
            {'email': emailinput.text, 'password': passwordinput.text}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        if (data.containsKey('token')) {
          String token = data['token'];
          saveToken(token);
          isLoggedIn();
        } else {
        }
      } else {
      }
    } catch (e) {
    }
  }

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

  Future<void> uploadInfo(BuildContext context) async {
    try {
      final response = await api.patch(
          '/users/updateInfo',
          {
            'email': emailController.text,
            'fullname': firstnamecontroller.text,
            'phone': phonecontroller.text
          },
          context);
      print(response);
    } catch (e) {
      print('Error adding file: $e');
    }
  }

  Future<void> deletecourse(context, String id) async {
    try {
      final response = await api.delete('/bundles/$id', context);

      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteexam(String id, context) async {
    try {
      final response = await api.delete('/exams/$id', context);

//  getallcourse();
      print(response);
      update();
//  getallcourse();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletesection(BuildContext context, String id) async {
    try {
      final response = await api.delete('/sections/$id', context);

      print(response);

//  getallcourse();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteLesson(BuildContext context, String id) async {
    try {
      final response = await api.delete('/lesson/$id', context);

      update();
      response.body;
//  getallcourse();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteimage(BuildContext context, String id) async {
    try {
      final response = await api.delete('/users/image/$id', context);

      response.body;
//  getallcourse();
      update();
      print('image deleted');
//  getallcourse();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletecourseinfo(BuildContext context, String id) async {
    try {
      final response = await api.delete('/course-info/delete/$id', context);

      response.body;
//  getallcourse();
      update();
    } catch (e) {
      print(e);
    }
  }

  var selectedTypes = 'center'.obs;
  // void courseStudentType(String type) {
  //   // other logic
  // }


  var typeList = <String>[];
  String selectedType = 'المحاضره الاوله';
  var attendanceData = <Map<String, dynamic>>[];

  Future<void> fetchDropdownData11() async {
    try {
      final response = await api.get(
        '/courses/all',
        context,
      );

      final List<dynamic> data = json.decode(response.body);
      typeList = data.map((item) => item['type'].toString()).toList();
    } catch (error) {
      print('Error: $error');
    }
  }

  var isButtonWhite = false.obs;
  void toggleButtonColor() {
    isButtonWhite.value = !isButtonWhite.value;
  }

  final api = Applinks();

  List<CourseAttend> courseAttends = [];
  List<Exam> Exams = [];
  int currentPage = 1;
  int totalPages = 9;
  final int? limit = 2;
  List<CourseAttend> CourseAttends = [];

  var students2 = <Student>[].obs;

  void fetchexams() async {}
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
      final response = await api
          .get('/students/search/by', context, queryParams: {'search': query});

      final data = response;

      final List list = data['student'] ?? [];

      return list.map((e) => Student.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
  }

  List percent = [];
  List percents = [];
  Future allstudents() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final url = Uri.parse('${Applinks.baseurl}/students');
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        selectedTypes.value = 'all';
        final data = json.decode(response.body);
        print('meme${data['percent']}');
        percents =
            List<double>.from(data['percent'].map((e) => (e ?? 0).toDouble()));

        percent = data['percent'];
        update();
      } else {
        print('errorstudents${response.statusCode}');
      }
    } catch (e) {
      print('Errorrr${e}');
    }
  }

  Dailytable dailytables = Dailytable();
  Future dailytable({String? coursetabledate}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final url = Uri.parse(
          '${Applinks.baseurl}/dailytable?coursetabledate=$coursetabledate');
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        selectedTypes.value = 'all';
        final json = await jsonDecode(response.body);
        dailytables = Dailytable.fromJson(json);
        update();
      } else {
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

  Future<void> courseStudentType(String courseType) async {
    try {
      selectedTypes.value = courseType;
      final response =
          await api.get('/students/coursetype/${courseType}', context);
      final List<dynamic> data = response;
      students = data.map((item) => Student.fromJson(item)).toList();
      update();
    } catch (e) {
      print('Errorrr${e}');
    }
  }

  Future<void> addLesson() async {
    try {
      final response = await api.post('/lesson/addLesson', {}, context);

      update();
      response.body;
      print('${response}');
      update();
      getLessons();
    } catch (e) {}
  }

  List<Lessons> lesson = [];
  Future<void> getLessons() async {
    try {
      final response = await api.get('/lesson', context);
      final List<dynamic> data = response;
      lesson = data.map((item) => Lessons.fromJson(item)).toList();
      print('students${data}');
      update();
    } catch (e) {
      print('eeeeee${e}');
    }
  }

  Future<void> getattendence(bool? attendence) async {
    try {
      final response = await api.get('/students/$attendence', context);

      final List<dynamic> data = response;
      lesson = data.map((item) => Lessons.fromJson(item)).toList();
      print('2eeeee${data}');
      update();
    } catch (e) {
      print('Errorrr${e}');
    }
  }

  List<Sections> allsections = [];
  Future<void> gloabalsection() async {
    try {
      final response = await api.get('/sections/allsections', context);

      final List<dynamic> data = response;
      allsections = data.map((item) => Sections.fromJson(item)).toList();
      update();
      print('students${data}');
    } catch (e) {
      print('Errorrr${e}');
    }
  }

  List<CourseInfo> course_infoall = [];
  Future<void> allcourseinfo() async {
    try {
      final response = await api.get('/course-info/all', context);
      final List<dynamic> data = response;
      course_infoall = data.map((item) => CourseInfo.fromJson(item)).toList();
      print('allcontain${data}');
    } catch (e) {
      print('Errorrr${e}');
    }
  }

  List<Course> coursemanager = [];
  List<Course> coursemanages = [];
  List<course_reservation> coursereserv = [];
// List <Course>course=[];

  Future<void> coursemanage({
    int? id,
    int? page,
  }) async {
    try {
      final response = await api.get(
        '/courses/coursestudnum',
        context,
        queryParams: {
         if(id!=null) 'id': id.toString() ,
        },
        page: page,
        limit: limit,
      );

      update();
      final  data = response;
      if(data is List)
    {  coursemanager = data .map((item) => Course.fromJson(item)).toList();

      update();}else {
  coursemanager = [];
}
    } catch (e) {
      print('mmmnnnlll: $e');
    }
  }

  Future<void> idcoursestudents({
    int? id,
    int? page,
  }) async {
    try {
    
      final response = await api.get('/students/paginationcour', context);

      update();
      final List<dynamic> data = response;
      coursemanages = data.map((item) => Course.fromJson(item)).toList();
      update();
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> course_reserv() async {
    try {
      final response = await api.get('/course-reservation', context);

      final List<dynamic> data = response;
      coursereserv =
          data.map((item) => course_reservation.fromJson(item)).toList();
      print('coursereserv${data}');
    } catch (e) {
      print('eee${e}');
    }
  }

  List<CourseInfo> courseinfo = [];
  Future<void> course_info() async {
    try {
      final response = await api.get('/course-info', context);

      final List<dynamic> data = response;
      courseinfo = data.map((item) => CourseInfo.fromJson(item)).toList();
      print('courseinfo${data}');
    } catch (e) {
      print('Errorrr${e}');
    }
  }

  Future<void> allnopagin() async {
    try {
      final response = await api.get('/course-attend/all', context);

      final List<dynamic> data = response;

      CourseAttends = data.map((item) => CourseAttend.fromJson(item)).toList();
      print('llnn${data}');
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> allpagin(int page) async {
    try {
      final response =
          await api.get('/course-attend', context, page: page, limit: limit);

      final List<dynamic> data = response;

      courseAttends = data.map((item) => CourseAttend.fromJson(item)).toList();
      print('pagination${data}');
      update();
    } catch (error) {
      print('Error: $error');
    }
  }

  List<Sections> sections = [];
  Future<void> allpaginsections({int? page}) async {
    try {
      final response =
          await api.get('/sections', context, page: page, limit: limit);

      final List<dynamic> data = response;
      sections = data.map((item) => Sections.fromJson(item)).toList();
      update();
    } catch (error) {
      print('Error: $error');
    }
  }

  List<Images> images = [];
  Future<void> allimages() async {
    try {
      final response = await api.get(
        '/users/getallimages',
        context,
      );

      final List<dynamic> data = response;

      images = data.map((item) => Images.fromJson(item)).toList();
      print('IMAGESSS');
      // print('olo-'+ 'http://localhost:3300/${images![1].url}');
      update();

      print('Failed to load img');
    } catch (error) {
      print('Error img: $error');
    }
  }

  Future<void> studentexam(int page) async {
    try {
      final response = await api.get('/students/pagination', context,
          page: page, limit: limit);
      final List<dynamic> data = response;
      students = data.map((item) => Student.fromJson(item)).toList();
      update();
      print('yes${students}');
      print('why${data}');
    } catch (e) {
      print('error${e}');
    }
  }

  Future<void> exampagination({int? page}) async {
    try {
      final response = await api.get('/exams', context);
      final List<dynamic> data = response;
      Exams = data.map((item) => Exam.fromJson(item)).toList();
      print('paginationexam${data}');
      update();
    } catch (error) {
      print('Error: $error');
    }
  }

  List<Exam> exam = [];
  Future<void> exampaginationonline({int? page}) async {
    try {
      final response =
          await api.get('/exams/online', context, page: page, limit: limit);
      final List<dynamic> data = response;
      Exams = data.map((item) => Exam.fromJson(item)).toList();
      print('paginationexam${data}');
      update();
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> controlall(String id) async {
    try {
      final response =
          await api.get('/courses/$id', context, page: 1, limit: limit);
      final List<dynamic> data = response;
      coursemanager = data.map((item) => Course.fromJson(item)).toList();
      update();response;
      print('controlcenter${response}');
    } catch (e) {
      print('error${e}');
    }
  }

  Future<void> fetchCourseDataByType(String type) async {
    try {
      final response = await api.get('/courses/bytype', context,
          queryParams: {'type': type.toString()});

      final data = response;
      attendanceData = List<Map<String, dynamic>>.from(
        data['course_attend'].map(
          (attend) => {
            'month': attend['month'],
            'seen_amount': double.parse(attend['seen_amount']),
            'pay_amount': double.parse(attend['pay_amount']),
          },
        ),
      );attendanceData;
    } catch (e) {
      print('Error fetching course data: $e');
    }
  }

  void updateShowDegreeAfter(int value) {
    showDegreeafter = value;
    update();
  }

  void updateShowDegreeEveryQues(int value) {
    showdegreeEveryQues = value;
    update();
  }

NavigationService nav =NavigationService();

  Future<bool> refreshTokenForNavigation() async {
    try {
      print('🔄 محاولة تجديد التوكن للتنقل...');

      if (refreshToken.isEmpty) {
        print('❌ لا يوجد refresh token للتنقل');
        return false;
      }

      final res = await Dio().post(
        'http://localhost:3300/auth/refreshtoken',
        data: {'refreshtoken': refreshToken},
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        await saveTokens(res.data['token'], refreshToken, userId);
        print('✅ تم تجديد التوكن بنجاح للتنقل');
        return true;
      } else {
        print('❌ فشل تجديد التوكن للتنقل: ${res.statusCode}');
        return false;
      }
    } catch (e) {
      print('❌ خطأ في تجديد التوكن للتنقل: $e');
      return false;
    }
  }


  void increment() => count.value++;


  void stopAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  void startAutoLogoutMonitor(String token) {
    _refreshTimer?.cancel();

    try {
      final expiryDate = JwtDecoder.getExpirationDate(token);
      final remaining = expiryDate.difference(DateTime.now());

      print(
          ' بدء مراقبة التسجيل الخروج - المتبقي: ${remaining.inMinutes} دقيقة');

      if (remaining.isNegative) {
        print(' التوكن منتهي - تسجيل خروج فوري');
        Future.delayed(Duration(seconds: 2), () {
          logout();
        });
        return;
      }

      if (remaining.inMinutes < 5) {
        final logoutTime = remaining - Duration(minutes: 4);

        if (logoutTime.isNegative) {
          print(' سأخرج بعد 30 ثانية');
          _refreshTimer = Timer(Duration(seconds: 30), () {
            logout();
          });
        } else {
          _refreshTimer = Timer(logoutTime, () {
            logout();
          });
        }
      } else {}
    } catch (e) {
      print(' خطأ في startAutoLogoutMonitor: $e');
    }
  }

  RxBool isDashboardOpen = false.obs;
  RxString currentScreen = ''.obs;
  Timer? _refreshTimer;

  String token = '';

  int userId = 0;
  String refreshToken = '';
  Future<void> loadTokens() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    refreshToken = prefs.getString('refreshtoken') ?? '';
    userId = prefs.getInt('userId') ?? 0;

    if (token.isNotEmpty) {
      print(' تم تحميل التوكن - ${token.substring(0, 20)}...');

      if (Get.currentRoute.contains('Dashboard')) {
        isDashboardOpen.value = true;
        scheduleNextRefresh(token);
      }
    }
  }

  Future<void> saveTokens(String t, String rt, int uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', t);
    await prefs.setString('refreshtoken', rt);
    await prefs.setInt('userId', uid);

    token = t;
    refreshToken = rt;
    userId = uid;

    print(' تم حفظ التوكنات الجديدة');
  }

  Future<void> smartRefreshToken() async {
    try {
      print(' smartRefreshToken - بدء');

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        print(' لا يوجد توكن');
        return;
      }

      final expiryDate = JwtDecoder.getExpirationDate(token);
      final remaining = expiryDate.difference(DateTime.now());

      print(
          ' الوقت المتبقي: ${remaining.inMinutes} دقيقة و${remaining.inSeconds % 60} ثانية');
      print(' الصفحة الحالية: ${currentScreen.value}');
      print(' في Dashboard: ${isDashboardOpen.value}');

      if (currentScreen.value.contains('DashboardScreen') ||
          isDashboardOpen.value) {
        print(' في Dashboard - تحقق من الحاجة للتجديد');

        if (remaining.isNegative) {
          print(' التوكن منتهي - جدد فوراً');
          await refreshAccessToken();
        } else if (remaining.inMinutes < 10) {
          print(' بقي أقل من 10 دقائق - جدد التوكن');
          await refreshAccessToken();
        } else {
          print(' التوكن ساري لوقت كافي في Dashboard');
        }
      } else {
        print(' في صفحة أخرى - لا تجدد، فقط تحقق للتسجيل الخروج');

        if (remaining.isNegative || remaining.inSeconds < 30) {
          print(' التوكن منتهي أو شبه منتهي - تسجيل خروج');
          await logout();
        } else {
          print(' التوكن ساري في الصفحة الأخرى - لا تجديد');
        }
      }
    } catch (e) {
      print(' خطأ في smartRefreshToken: $e');
    }
  }

  Future<void> refreshAccessToken() async {
    try {
      print(' تجديد التوكن...');

      if (_lastRefreshTime != null) {
        final timeSinceLastRefresh =
            DateTime.now().difference(_lastRefreshTime!);
        if (timeSinceLastRefresh.inSeconds < 30) {
          print('⏸️ تم التجديد مؤخراً - تأجيل');

          final waitTime = Duration(seconds: 30) - timeSinceLastRefresh;
          _refreshTimer?.cancel();
          _refreshTimer = Timer(waitTime, () {
            refreshAccessToken();
          });
          return;
        }
      }

      if (refreshToken.isEmpty) {
        print(' لا يوجد refresh token');
        throw Exception('No refresh token');
      }

      final res = await Dio().post(
        'http://localhost:3300/auth/refreshtoken',
        data: {'refreshtoken': refreshToken},
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        await saveTokens(res.data['token'], refreshToken, userId);
        _lastRefreshTime = DateTime.now();

        print(' تم تجديد التوكن بنجاح - ${_lastRefreshTime}');

        scheduleNextRefresh(res.data['token']);
      } else {
        print(' فشل تجديد التوكن: ${res.statusCode}');
        throw Exception('Failed to refresh');
      }
    } catch (e) {
      print(' خطأ في تجديد التوكن: $e');

      final retryDelay = Duration(minutes: 1 + Random().nextInt(4));
      print(' سأحاول مرة أخرى بعد ${retryDelay.inMinutes} دقيقة');

      _refreshTimer?.cancel();
      _refreshTimer = Timer(retryDelay, () {
        refreshAccessToken();
      });

      rethrow;
    }
  }

  DateTime? _lastRefreshTime;

  Future<String> getInitialRoute() async {
    final tokens = await getTokens();
    if (tokens == null) return '/HomeView';

    if (JwtDecoder.isExpired(tokens['token'])) {
      try {
        await refreshAccessToken();
        return '/Mainscreen';
      } catch (_) {
        return '/HomeView';
      }
    }

    return '/Mainscreen';
  }

  Future<Map<String, dynamic>?> getTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final t = prefs.getString('token');
    final rt = prefs.getString('refreshtoken');
    final uid = prefs.getInt('userId');

    if (t == null || rt == null) return null;

    return {
      'token': t,
      'refreshtoken': rt,
      'userId': uid ?? 0,
    };
  }

  Future<void> smartNavigate(String routeName) async {
    try {
      print('🧭 Navigating to: $routeName from ${Get.currentRoute}');

      if (Get.currentRoute.contains('DashboardScreen') &&
          !routeName.contains('DashboardScreen')) {
        print('🏃 Leaving Dashboard - stopping Dashboard timers');
        isDashboardActive.value = false;
        stopDashboardTimer();
      }

      currentScreen.value = routeName;

      if (routeName.contains('DashboardScreen')) {
        isDashboardOpen.value = true;
        isDashboardActive.value = true;
      } else {
        isDashboardOpen.value = false;
      }

      print('🚀 Using offAndToNamed');
      Get.offAndToNamed(routeName);

      print('✅ Navigation completed');
    } catch (e) {
      print('❌ Navigation error: $e');
      Get.offAndToNamed(routeName);
    }
  }

  Future<bool> login(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost:3300/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {"email": emailController.text, "password": passwordController.text}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      await saveTokens(data['token'], data['refreshtoken'], data['userId']);
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("خطأ في البريد الإلكتروني أو كلمة المرور"),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
  }

  Future<void> checkTokenAndRedirect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        print('❌ No token found - Redirecting to HomeView');
        await _redirectToHomeView();
        return;
      }

      final currentRoute = Get.currentRoute;
      final isInDashboard = currentRoute.contains('DashboardScreen');

      if (JwtDecoder.isExpired(token)) {
        print('⏰ Token expired');

        if (isInDashboard) {
          print(
              '📱 In Dashboard - Will try to refresh token instead of redirecting');
          await refreshAccessToken();
        } else {
          print('🚪 Not in Dashboard - Redirecting to HomeView');
          await _redirectToHomeView();
        }
        return;
      }

      final expiryDate = JwtDecoder.getExpirationDate(token);
      final remaining = expiryDate.difference(DateTime.now());

      print('✅ Token valid for ${remaining.inMinutes} minutes');

      if (remaining.inSeconds < 60 && !isInDashboard) {
        print(
            '⚠️ Token expiring soon - Will redirect in ${remaining.inSeconds} seconds');
        Timer(remaining, () async {
          await _redirectToHomeView();
        });
      } else if (remaining.inSeconds < 60 && isInDashboard) {
        print(
            '📱 In Dashboard - Token expiring soon, will refresh instead of redirect');
        if (remaining.inSeconds < 30) {
          await refreshAccessToken();
        }
      }
    } catch (e) {
      print('❌ Error checking token: $e');
      if (!Get.currentRoute.contains('DashboardScreen')) {
        await _redirectToHomeView();
      }
    }
  }

  RxBool isDashboardActive = false.obs;

  void startDashboardTimer() {
    print('بدء تايمر Dashboard');
    isDashboardActive.value = true;

    _refreshTimer?.cancel();

    if (token.isNotEmpty && isDashboardOpen.value) {
      scheduleNextRefresh(token);
    }
  }

  void stopDashboardTimer() {
    print('إيقاف تايمر Dashboard');
    isDashboardActive.value = false;
    _refreshTimer?.cancel();
  }

  void scheduleNextRefresh(String token) {
    _refreshTimer?.cancel();

    if (!isDashboardActive.value) {
      print('⏸ Dashboard غير نشط - لا أجدد تلقائياً');
      return;
    }

    try {
      final expiryDate = JwtDecoder.getExpirationDate(token);
      final remaining = expiryDate.difference(DateTime.now());

      print(
          ' صلاحية التوكن: ${remaining.inMinutes} دقيقة و${remaining.inSeconds % 60} ثانية');

      final refreshTime = remaining - Duration(minutes: 10);

      if (refreshTime.isNegative) {
        print('⏱ بقي أقل من 10 دقائق - جدد بعد دقيقة');
        _refreshTimer = Timer(Duration(minutes: 1), () {
          if (isDashboardActive.value) {
            smartRefreshToken();
          }
        });
      } else {
        print('سأجدد بعد ${refreshTime.inMinutes} دقيقة');
        _refreshTimer = Timer(refreshTime, () {
          if (isDashboardActive.value) {
            smartRefreshToken();
          }
        });
      }
    } catch (e) {
      print(' خطأ في scheduleNextRefresh: $e');
    }
  }

  Future<void> logout() async {
  print(' بدء تسجيل الخروج');
  
  _refreshTimer?.cancel();
  _refreshTimer = null;
  
  isDashboardOpen.value = false;
  isDashboardActive.value = false;
  currentScreen.value = '';
  
  await Future.delayed(Duration(milliseconds: 100));
  
  final prefs = await SharedPreferences.getInstance();
  
  await prefs.remove('token');
  await prefs.remove('refreshtoken');
  await prefs.remove('userId');
  
  if (Get.currentRoute != '/HomeView') {
    Get.offAllNamed('/HomeView');
  }


  print(' تم تسجيل الخروج');
}
  Future<void> logout2() async {
  
  
  final prefs = await SharedPreferences.getInstance();
  
  await prefs.remove('token');
  await prefs.remove('refreshtoken');
  await prefs.remove('userId');
  
  if (Get.currentRoute != '/HomeView') {
    Get.offAllNamed('/HomeView');
  }


  print(' تم تسجيل الخروج');
}

  Future<void> _redirectToHomeView() async {
    print(' Redirecting to HomeView...');

    _logoutTimer?.cancel();
    _refreshTimer?.cancel();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    isDashboardOpen.value = false;
    currentScreen.value = '';
    token = '';

    if (Get.currentRoute != '/HomeView') {
    Get.offAllNamed('/HomeView');
    }

    print('Successfully redirected to HomeView');
  }

  void startTokenMonitoring() {
    print('🔍 Starting token monitoring...');

    _logoutTimer?.cancel();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkTokenAndRedirect();
    });

    _logoutTimer = Timer.periodic(Duration(seconds: 30), (timer) {
      if (!Get.currentRoute.contains('DashboardScreen')) {
        checkTokenAndRedirect();
      } else {
        print(
            '📱 In Dashboard - Skipping auto-logout check (Dashboard handles refresh)');
      }
    });
  }

  Future<void> checkDashboardToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        print('❌ No token in Dashboard');
        return;
      }

      if (JwtDecoder.isExpired(token)) {
        print('🔄 Dashboard: Token expired, refreshing...');
        await refreshAccessToken();
      } else {
        final expiryDate = JwtDecoder.getExpirationDate(token);
        final remaining = expiryDate.difference(DateTime.now());

        if (remaining.inMinutes < 5) {
          print(
              '🔄 Dashboard: Token expiring soon (${remaining.inMinutes} min), refreshing...');
          await refreshAccessToken();
        }
      }
    } catch (e) {
      print('❌ Error in Dashboard token check: $e');
    }
  }

  void stopAllTimers() {
    _logoutTimer?.cancel();
    _logoutTimer = null;
    _refreshTimer?.cancel();
    _refreshTimer = null;
    isDashboardActive.value = false;
  }

  @override
  void onClose() {
    _logoutTimer?.cancel();
    _refreshTimer?.cancel();
    super.onClose();
  }
}
