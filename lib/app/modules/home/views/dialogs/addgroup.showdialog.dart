import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/assignments%20copy.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addgroupdialog extends StatefulWidget {
  const addgroupdialog({super.key});

  @override
  State<addgroupdialog> createState() => _dialogquizesState();
}

class _dialogquizesState extends State<addgroupdialog> {
   Widget _buildButtonmain({
  // required String text,
  required   icon,
  required String route,
  bool isActive = false,
}) {
  final HomeController controller = Get.find<HomeController>();
  
  return SizedBox(
    width: 24.0,
    height: 24.0,
    child: InkWell(
      // style: ElevatedButton.styleFrom(
      //   // backgroundColor: isActive ?Colors.white: Color.fromARGB(235, 6, 69, 152),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(14),
      //   ),
      // ),
      onTap: () {
        Get.back();
        controller.smartNavigate(route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         
        icon
          // Image.asset('$icon', color: isActive ? Colors.blue[900] : Color.fromARGB(181, 154, 175, 228),),
        ],
      ),
    ),
  );
}
 HomeController controller =Get.put(HomeController());
  Future<bool> ensureTokenValidForDialog() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    if (token == null || token.isEmpty) {
      print(' لا يوجد توكن في الديالوج');
      return false;
    }
    
    if (JwtDecoder.isExpired(token)) {
      print(' التوكن منتهي في الديالوج - محاولة التجديد');
      
      final refreshed = await controller. refreshTokenForDialog();
      
      if (refreshed) {
        print(' تم تجديد التوكن بنجاح - يمكن متابعة الديالوج');
        return true;
      } else {
        print(' فشل تجديد التوكن - الديالوج سيفشل');
        return false;
      }
    }
    
    print(' التوكن صالح في الديالوج');
    return true;
    
  } catch (e) {
    print(' خطأ في التحقق من التوكن للديالوج: $e');
    return false;
  }
}  
  String result='';
      String? selectedValue;
      
  final List<String> items = [
    'سؤال مقالي',
    'سؤال اكمل',
    'سؤال اختار',
    'سؤال صح/غلط',
  ];

  @override
  Widget build(BuildContext context) {
    
  return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {  return Dialog(
          alignment: Alignment.center,
      backgroundColor: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use constraints to determine the size of the dialog
          double dialogWidth = constraints.maxWidth > 1032 ? 1032 : constraints.maxWidth * 0.9;

          return Container(

            padding: EdgeInsets.fromLTRB(18, 18, 18, 40),
            width: 1032,height: 460,
            child:Center(child:  SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 _buildButtonmain(   icon:          
                       Image.asset('assets/close-circl.png', width: 24, height: 24),

                      route: '/managecenter'
                      ,  isActive: Get.currentRoute == '/managecenter',
                      ),
                  Container(
                    width: dialogWidth,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'اضافه الامتحان جديد',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            color: Color.fromARGB(255, 6, 69, 152)),
                          textAlign: TextAlign.right,
                        ),
                       Container(
                        width: 996,height: 260,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
Container(
  width: 453,height: 260,
  child: 
Column(children: [  
 Container(
      width: 453,
      height: 76,
      
      child: 
   
    Column(
       crossAxisAlignment: CrossAxisAlignment.end,
        // spacing: 16,
        children: [
             Text('السنتر',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),textAlign: TextAlign.right,


          ),
 
              TextField(
          textAlign: TextAlign.right
         , textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey),),
            hintText: 'ادخل السنتر',
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 125, 140, 158),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          ),
        ),
        // ) 
           ],
  ),)
 , 
 Container(
      width: 453,
      height: 76,
      
      child: 
   
    Column(
       crossAxisAlignment: CrossAxisAlignment.end,
        // spacing: 16,
        children: [
             Text('المنطقه',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),textAlign: TextAlign.right,


          ),
 
              TextField(
          textAlign: TextAlign.right
         , textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey),),
            hintText: 'ادخل المنطقه',
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 125, 140, 158),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          ),
        ),
        // ) 
           ],
  ),)
  
  
  ])
  ),

Container(
  width: 453,height: 260,
  child: Column(spacing: 16,
  children: [
    Container(
      width: 453,
      height: 76,
      
      child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
        // spacing: 16,
        children: [
Text('اسم المجموعه',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),textAlign: TextAlign.right,


),
// Container(
  
//   child: 
   TextField(
          textAlign: TextAlign.right
      // ,  controller:controller
         , textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey),),
            hintText: 'ادخل المجموعه',
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 125, 140, 158),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          ),
        ),
        // ) 
           ],),)
   , Container(
      width: 453,
      height: 76,
      
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
        // spacing: 16,
        children: [
             Text('عدد الاقصي للطلاب',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),textAlign: TextAlign.right,


),
// Container(
  
//   child: 
              TextField(
          textAlign: TextAlign.right
      // ,  controller:controller
         , textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey),),
            hintText: 'ادخل عدد الاقصي للطلاب',
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 125, 140, 158),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          ),
        ),
        // ) 
           ],),)
   , Container(
      width: 453,
      height: 76,
      
      child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
        // spacing: 16,
        children: [
Text('ميعاد الدرس',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),textAlign: TextAlign.right,


),
// Container(
  
//   child: 
   TextField(
          textAlign: TextAlign.right
      // ,  controller:controller
         , textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey),),
            hintText: 'ادخل ميعاد الدرس',
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 125, 140, 158),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          ),
        ),
        // ) 
           ],),)
  ],
  
  ),),

                        ],))
                        
                        ,
                        
                        Container(
                          width: 996,
                          child: 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [    Container(
                                width:  193,
                                height: 40,child: 
                       TextButton(
                        style:TextButton.styleFrom(
                          padding: EdgeInsets.all(8),
                         shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), 
                          backgroundColor: Color.fromARGB(255, 6, 69, 152)
                        ) ,
                        
                        onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Assignments2()));
      // print('Upload failed: ${response.statusCode}');
    }, child: Text('حفظ',style: TextStyle(color: Colors.white),))
                        )]))
                ],
              ),
            ),
          ]))));
        },
      ),
    );
  });}


}