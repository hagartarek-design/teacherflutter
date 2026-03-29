// dialog_wrapper.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/dialogs/dialog_quizes.dart';
// import 'package:flutterwallet/app/modules/home/views/dialog_quizes.dart';
import 'package:flutterwallet/app/modules/home/views/tokenservice.dart';


class DialogWrapper extends StatefulWidget {
  const DialogWrapper({super.key});

  @override
  State<DialogWrapper> createState() => _DialogWrapperState();
}

class _DialogWrapperState extends State<DialogWrapper> {
  final TokenService _tokenService = TokenService();
  
  @override
  void initState() {
    super.initState();
    print('📱 DialogWrapper - بدء التشغيل');
    
    _tokenService.startTokenMonitoringForDialog();
  }
  
  @override
  void dispose() {
    print('🗑️ DialogWrapper - التخلص');
    
    // Stop token monitoring when dialog closes
    _tokenService.stopTokenMonitoringForDialog();
    
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
  behavior: const ScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.trackpad,
    },
  ),
  child: SingleChildScrollView(
      child: dialogquizes(),
    ));
  }
}