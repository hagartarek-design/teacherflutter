// dialog_wrapper.dart
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/dialog_assignments.dart';
import 'package:flutterwallet/app/modules/home/views/dialog_quizes.dart';
import 'package:flutterwallet/app/modules/home/views/tokenservice.dart';

import '../controllers/tokens.dart';

class dialogforassignments extends StatefulWidget {
  const dialogforassignments({super.key});

  @override
  State<dialogforassignments> createState() => _dialogforassignmentsState();
}

class _dialogforassignmentsState extends State<dialogforassignments> {
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
      child: DialogAssignments(),
    );
  }
}