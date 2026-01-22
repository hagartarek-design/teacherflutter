
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/home_view.dart';
import 'package:flutterwallet/app/modules/home/views/homescreen.dart';
import 'package:flutterwallet/app/modules/home/views/mainscreen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
 final bool loggedIn;
  const MyApp({Key? key,required this.loggedIn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Calendar',
      theme: ThemeData(primarySwatch: Colors.blue),
      supportedLocales: const [
        Locale('en', ''), 
        Locale('ar', ''), 
      ],
      localizationsDelegates: const [
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
       
      home: loggedIn ? Mainscreen() : HomeView(),
    );
  }
}