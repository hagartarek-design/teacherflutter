// dialog_wrapper.dart
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/askquestion.dart';
import 'package:flutterwallet/app/modules/home/views/dialog_assignments.dart';
import 'package:flutterwallet/app/modules/home/views/dialog_quizes.dart';
import 'package:flutterwallet/app/modules/home/views/notificationdialog.dart';
import 'package:flutterwallet/app/modules/home/views/tokenservice.dart';
import 'package:flutterwallet/app/modules/home/views/videodialog.dart';

import '../controllers/tokens.dart';

class Containerofnotification extends StatefulWidget {
  const Containerofnotification({super.key});

  @override
  State<Containerofnotification> createState() => _ContainerfordashboardscreenState();
}

class _ContainerfordashboardscreenState extends State<Containerofnotification> {
   final TokenService _tokenService = TokenService();
  
  @override
  void initState() {
    super.initState();
    print('📱 DialogWrapper - بدء التشغيل');
    
    // Start token monitoring for dialog
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
    return SingleChildScrollView(
      child: Notificationdialog(),
    );
  }
}