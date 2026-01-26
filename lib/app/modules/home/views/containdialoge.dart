import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class TokenProtectedDialog extends StatefulWidget {
  final Widget Function() dialogContent;
  
  const TokenProtectedDialog({
    Key? key,
    required this.dialogContent,
  }) : super(key: key);
  
  @override
  _TokenProtectedDialogState createState() => _TokenProtectedDialogState();
}

class _TokenProtectedDialogState extends State<TokenProtectedDialog> {
  final HomeController controller = Get.find<HomeController>();
  bool _tokenValid = false;
  bool _loading = true;
  
  @override
  void initState() {
    super.initState();
    _checkToken();
  }
  
  Future<void> _checkToken() async {
    try {
      final valid = await controller.ensureTokenValidForDialog();
      setState(() {
        _tokenValid = valid;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _tokenValid = false;
        _loading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    
    if (!_tokenValid) {
      return _buildTokenExpiredView();
    }
    
    return widget.dialogContent();
  }
  
  Widget _buildTokenExpiredView() {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning_amber, color: Colors.orange),
          SizedBox(width: 10),
          Text('تنبيه'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'انتهت صلاحية الجلسة',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'يمكنك المحاولة مرة أخرى أو حفظ عملك والخروج',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              _loading = true;
            });
            await _checkToken();
          },
          child: Text('إعادة المحاولة'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}