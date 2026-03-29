import 'dart:ui';

import 'package:flutterwallet/app/modules/home/views/login.dart';
import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
class HomeView extends GetView<HomeController> {
  
  HomeView({super.key});
  
// final GoogleSignIn googleSignIn = GoogleSignIn(
//   clientId: '196209474074-vbhoc100o56js635lrnjms7f87fv24em.apps.googleusercontent.com',
//   scopes: ['email', 'profile','openid'],
  
// );
// Future<void> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signInSilently();
//     if (googleUser == null) {
//       // If no silent sign-in, render the button
//       await googleSignIn.signIn();
//     } else {
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final String? idToken = googleAuth.idToken;
//       final String? accessToken = googleAuth.accessToken;

//       print('ID Token: $idToken');
//       print('Access Token: $accessToken');

//       if (idToken != null) {

//         // await sendTokenToBackend(idToken);
//       } else {
//         print('ID Token is null. Check your configuration.');
//       }
//     }
//   } catch (error) {
//     print('Error signing in with Google: $error');
//   }
// } String selectedValue = "السنة الدراسية";
 
 
  @override
  Widget build(BuildContext context) {

  
 return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
  
      return Scaffold(
          backgroundColor: ui.Color.fromARGB(255, 6, 69, 152),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Center(
                    child: ScrollConfiguration(
  behavior: const ScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.trackpad,
    },
  ),
  child: SingleChildScrollView(
                      child: Container(
                        width: constraints.maxWidth > 960 ? 960 : constraints.maxWidth * 0.9,
                        height: constraints.maxHeight > 600 ? 600 : constraints.maxHeight * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                  ),
                                ),
                                child: Image.asset('assets/Left section.png'),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'تسجل دخول لحسابك',
                                        style: TextStyle(
                                          color: ui.Color.fromARGB(255, 6, 69, 152),
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                      SizedBox(height: 20),
                                      _buildEmailField(controller),
                                      SizedBox(height: 20),
                                      _buildPasswordField(controller),
                                      SizedBox(height: 20),
                                      _buildLoginButton(context),
                                      SizedBox(height: 20),
                                      _buildForgotPasswordButton(context),
                                      SizedBox(height: 20),
                                      _buildDivider(),
                                      SizedBox(height: 20),
                                      _buildGoogleLoginButton(context),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     )   ),
                  _buildBackgroundElements(),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEmailField(HomeController controller) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            'البريد الاليكتروني',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Color.fromARGB(255, 195, 202, 210)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 13,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "ادخل البريد الاليكتروني",
                hintStyle: TextStyle(color: ui.Color.fromARGB(255, 125, 140, 158)),
              ),
              controller: controller.emailController,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(HomeController controller) {
  bool passwordVisible = false;

    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            'كلمة المرور',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Color.fromARGB(255, 195, 202, 210)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 13,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: controller.passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "**********",
                hintStyle: TextStyle(color: ui.Color.fromARGB(255, 125, 140, 158)),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility_off,
                    color: const ui.Color.fromARGB(255, 212, 211, 211),
                  ),
                  onPressed: () {
                    passwordVisible = !passwordVisible;
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
      void handleLogin() async {
    bool success = await controller.login(
      // emailController.text.toString(),
      // passwordController.text.toString(),
   context );

    if (success) {
      
      // Fluttertoast.showToast(msg: "Login Successful");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mainscreen()),
      );
    } else  {
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
      // Fluttertoast.showToast(msg: "Invalid Credentials");
    }
  }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 13,
            offset: Offset(0, 3),
          ),
        ],
        color: ui.Color.fromARGB(255, 6, 69, 152),
      ),
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 14),
        ),
        child: Text(
          'تسجيل دخول',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.right,
        ),
        onPressed:handleLogin
      ),
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(alignment: Alignment.centerRight),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyWidget()),
          );
        },
        child: Text(
          'نسيت كلمة المرور؟',
          style: TextStyle(
            color: Color.fromARGB(255, 6, 69, 152),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Color.fromARGB(255, 6, 69, 152),
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'او تسجيل من خلال',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Color.fromARGB(255, 6, 69, 152),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleLoginButton(context) {
  
















  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   clientId: '748588866035-dn3vn5ca4icqdr40aj48bq9gcitqm40r.apps.googleusercontent.com',
  //   scopes: ['email', 'profile'],
  // );

  // Future<void> handleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) return;

  //     final GoogleSignInAuthentication googleAuth = 
  //         await googleUser.authentication;

  //     // Send token to your backend
  //     final response = await http.post(
  //       Uri.parse('${Applinks.baseurl}/auth/google'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'token': googleAuth.idToken,
  //         'accessToken': googleAuth.accessToken,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       final userData = jsonDecode(response.body);
  //       // Handle successful login (store token, navigate to home, etc.)
  //       print('Logged in user: ${userData['email']}');
  //     } else {
  //       throw Exception('Failed to authenticate with backend');
  //     }
  //   } catch (error) {
  //     print('Error signing in with Google: $error');
  //   }
  // }


// Future<void> signInWithGoogle() async {
//     try {
//       // Trigger the Google Sign-In flow

//     import 'package:http/http.dart' as http;
// import 'dart:convert';

 
//       GoogleAuthProvider googleProvider = GoogleAuthProvider();

//       UserCredential userCredential = await _auth.signInWithPopup(googleProvider);

//       // Get the ID Token
//       String? idToken = await userCredential.user?.getIdToken();
//       print("✅ ID Token: $idToken");
// // Navigator.push(context,MaterialPageRoute(builder: (context)=>))
//       // Show in app (optional)
//     Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Mainscreen()));
//       debugPrint("Logged in as: ${userCredential.user?.email}");
//     } catch (e) {
//       print("❌ Sign-in error: $e");
//     }
//   }









  
      // Fl}uttertoast.showToast(msg: "Invalid Credentials");
    // }


    // AuthService authservice =AuthService();
    return Container(
      // width: double.infinity,
      height: 42.56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Color.fromARGB(255, 6, 69, 152)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Google.png', width: 24, height: 24.56),
          // SizedBox(width: 10),
          TextButton(
          onPressed:()async{
              void signin() async {
   await controller. signInWithGoogle(
 context     // emailController.text.toString(),
      // passwordController.text.toString(),
    );

    // if (success) {
      
      // Fluttertoast.showToast(msg: "Login Successful");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mainscreen()),
      );
    // } else  {
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
);}
   
          return   signin();
//             try {
//               final userCredential = await controller.  signInWithGoogle(context);

// if (userCredential != null) {
//   // final user = userCredential.user;
//   print("✅ Login Success:${controller.token}");
//   Navigator.push(context,MaterialPageRoute(builder: (context){return Mainscreen(); }));
//   // print("Name: ${user?.displayName}");
//   // print("Email: ${user?.email}");
//   // print("Photo: ${controller.idToken}");
//   // print("Photo: ${user?.}");
// } else {
//   print("ser cancelled sign-in");

//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Sign-in cancelled")),
//                 );
//               }
//             } catch (e) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("Error: $e")),
//               );
//               print('eee$e');
//             }     
   }
            // _handleSignIn();
//           final _googleSignIn = GoogleSignIn(
//   clientId: '1234-your-web-client-id.apps.googleusercontent.com',
//   scopes: ['openid', 'email', 'profile'],
// );

// Future<void> _signIn() async {
//   final user = await _googleSignIn.signIn();
//   final auth = await user!.authentication;
//   print(auth.idToken); // Should now be non-null
,
          
          // },

            child: Text(
              'تسجيل دخول عبر',
              style: TextStyle(
                color: ui.Color.fromARGB(255, 6, 69, 152),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundElements() {
    return Stack(
      children: [
        Positioned(
          top: -119,
          left: -64,
          child: Container(
            width: 811,
            height: 785,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2),
              ),
            ),
            child: Opacity(
              opacity: 0.0,
              child: Image.asset('assets/triangles.png'),
            ),
          ),
        ),
        Positioned(
          width: 1039.83,
          height: 259.96,
          top: 456.27,
          left: -112,
          child: Transform.rotate(
            angle: 45 * (3.1415926535 / 180),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                border: Border.all(
                  width: 2,
                  color: Color.fromRGBO(246, 248, 253, 0.1),
                ),
              ),
              child: Image.asset('assets/Vector 1.png'),
            ),
          ),
        ),
        Positioned(
          width: 132,
          height: 132,
          top: 72,
          left: -39,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: BorderSide(width: 2, color: Color.fromRGBO(246, 248, 253, 0.1)),
              ),
            ),
            child: Image.asset('assets/circle.png'),
          ),
        ),
      ],
    );
  }

}