import 'package:flutterwallet/app/modules/home/controllers/tokens.dart';

class DialogSession {
  static bool _active = false;

  // static Future<void> start() async {
  //   if (_active) return;
  //   _active = true;

 
  //   await TokenService.refreshToken();

 
  //   TokenService.startAutoRefresh();
  // }

  // static Future<void> end({bool logout = true}) async {
  //   if (!_active) return;
  //   _active = false;

  //   TokenService.stopAutoRefresh();

  //   if (logout) {
  //     await TokenService.logout();
  //   }
  // }
}
// Future<void> openSecureDialog(BuildContext context) async {
//   await DialogSession.start(); // 🔥 فتح session

//   await showDialog(
//     context: context,
//     barrierDismissible: true, // tap برة
//     builder: (context) {
//       return WillPopScope(
//         onWillPop: () async {
//           await DialogSession.end(); // back button
//           return true;
//         },
//         child: AlertDialog(
//           title: Text("Secure Dialog"),
//           content: Text("Token active while dialog open"),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 await DialogSession.end();
//                 Navigator.of(context).pop();
//               },
//               child: Text("Close"),
//             ),
//           ],
//         ),
//       );
//     },
//   );

//   // safety net لو اتقفل بأي طريقة
//   await DialogSession.end();
// }
