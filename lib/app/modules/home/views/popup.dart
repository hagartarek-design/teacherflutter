import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/close.dialog.dart';
import 'package:flutterwallet/app/modules/home/views/showdialogs.dart';

class popup extends StatefulWidget {
  const popup({super.key});

  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
  @override
  Widget build(BuildContext context) {
    return  Container(
  width: 73,
  height: 72,
  decoration: BoxDecoration(
    color: Colors.white,
  ),
  child: PopupMenuButton<String>(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    onSelected: (value) {
      if (value == 'close') {
         showDialog( context: context, builder: (context){

          return close();
         });
      } else if (value == 'delete') {
      showDialog( context: context, builder: (context){

    return  Showdialogs();
         });
      }
    },
    itemBuilder: (BuildContext context) => [
      // Non-clickable header
      PopupMenuItem(
        enabled: false,
        child: Container(
          width: 151,
          height: 40,
          child: Center(
            child: Text(
              'إدارة السؤال',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      // Close option
      PopupMenuItem(
        value: 'close',
        child: MouseRegion(
          child: Container(
            width: 151,
            height: 75,
            child: Center(
              child: Text(
                'عرض التقرير',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
      PopupMenuItem(
        value: 'delete',
        child: MouseRegion(
          child: Container(
            width: 151,
            height: 75,
            child: Center(
              child: Text(
                'ايقاف الطالب',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
        onTap: () {
          // Handle tap
        },
      ),
    ],
    child: Image.
    asset(
      'icons/Group 37966.png',
      width: 26,
      height: 6,
    ),
  ),
);

  }
}