// dialog_wrapper.dart
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/askquestion.dart';
// import 'package:flutterwallet/app/modules/home/views/dialog_assignments.dart';
// import 'package:flutterwallet/app/modules/home/views/dialog_quizes.dart';
import 'package:flutterwallet/app/modules/home/views/tokenservice.dart';


class Containerforaskques extends StatefulWidget {
  const Containerforaskques({super.key});

  @override
  State<Containerforaskques> createState() => _ContainerforaskquesState();
}

class _ContainerforaskquesState extends State<Containerforaskques> {
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
      child: Askquestion(),
    );
  }
}