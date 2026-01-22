// import 'package:dio/dio.dart';
// // import 'package:my_app/app/modules/home/controllers/home_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';

// class ApiClient {
//   final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:4000'));

//   ApiClient() {
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           final prefs = await SharedPreferences.getInstance();
//           final token = prefs.getString('token');
//           if (token != null) {
//             options.headers['Authorization'] = 'Bearer $token';
//           }
//           handler.next(options);
//         },
//         onError: (error, handler) async {
//           if (error.response?.statusCode == 401) {
//             final prefs = await SharedPreferences.getInstance();
//             final refreshToken = prefs.getString('refreshtoken');

//             if (refreshToken != null) {
//               try {
//                 final res = await Dio().post(
//                   'http://localhost:4000/auth/refresh',
//                   data: {'refreshtoken': refreshToken},
//                 );

//                 final newAccessToken = res.data['token'];
//                 await prefs.setString('token', newAccessToken);
// // final newAccessToken = res.data['token'];
// // await prefs.setString('accessToken', newAccessToken);
// HomeController controller=HomeController();
// // شغّل التايمر من جديد
// // final authController = Get.find<AuthController>();
// controller.startTokenTimer(newAccessToken);

//                 final opts = error.requestOptions;
//                 opts.headers['Authorization'] = 'Bearer $newAccessToken';

//                 final cloneReq = await _dio.request(
//                   opts.path,
//                   options: Options(
//                     method: opts.method,
//                     headers: opts.headers,
//                   ),
//                   data: opts.data,
//                   queryParameters: opts.queryParameters,
//                 );
//                 return handler.resolve(cloneReq);
//               } catch (_) {
//                 await prefs.clear();
//                 Get.offAllNamed('/main');
//                 return handler.reject(error);
//               }
//             } else {
//               await prefs.clear();
//               Get.offAllNamed('/main');
//               return handler.reject(error);
//             }
//           }
//           handler.next(error);
//         },
//       ),
//     );
//   }

//   Dio get dio => _dio;
// }
