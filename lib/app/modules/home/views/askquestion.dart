import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/views/lectures.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Askquestion extends StatefulWidget {
  const Askquestion({super.key});

  @override
  State<Askquestion> createState() => _AskquestionState();
}
class _AskquestionState extends State<Askquestion> {
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
    HomeController controller=Get.put(HomeController());
     var  lessonid;
    String? localSelectedValue = selectedValue;
    String localResult = result;
  return StatefulBuilder( builder: (context,setStateDialog){
  
  return Dialog( child:  Container(
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white,),
  
  padding: EdgeInsets.fromLTRB(18, 18, 18, 40),

  width: 1032,height: 376,
child: Column(
  // spacing: 10,
  children: [
Container(width: 996,height: 307,

child: Column(spacing: 4, children: [
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
 _buildButtonmain(   icon:          
                       Image.asset('assets/close-circl.png', width: 24, height: 24),

                      route: '/Lectures'
                      ,  isActive: Get.currentRoute == '/Lectures',
                      )
],),
Container(width: 996,height: 279,
child: Column(spacing: 107,children: [
Container(
  width: 996,//height: 132,
  child: Column( 
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
Text('أنشاء سؤال جديد',style:
 TextStyle(fontWeight: FontWeight.w600,
 fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)  ),)
    ,Container( 
     width: 996,//height: 76,
      child: Column(
     crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 52,
        children: [
          Container(
            width: 453,
            child:Column(spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
Text('اختار نوع السؤال',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
 ,

Container( width: 435,height: 44,decoration: BoxDecoration(border: Border.all(width: 1),
borderRadius: BorderRadius.circular(8)),child: 
DropdownButtonFormField<String>(alignment: Alignment.centerRight,
  value: selectedValue,
  onChanged: (String? newValue) {
    // setState(() {
    setStateDialog(() {
                        localSelectedValue = newValue;
                        localResult = newValue ?? '';
                        print('value: $localResult');
                      });
    // });
  },
  items: items.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(alignment: Alignment.centerRight,
      value: value,
      child:Container(width: 391,  child:  Text(value,textDirection: TextDirection.rtl,),)
    );
  }).toList(),
  decoration: const InputDecoration(
    border: InputBorder.none,hintTextDirection: TextDirection.rtl
  ),
  icon: const Icon(Icons.arrow_drop_down),
  style: const TextStyle(
    color: Colors.black,
    fontSize: 16,
  ),

  dropdownColor: Colors.white,
),)])
 )
     ])     ) ],),)
 ,
 Container(width: 996,child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
 Container(
  
  width: 193,height: 40,
  child:  
TextButton(
onPressed: localResult.isNotEmpty
                        ? () {
                            setState(() {

                              print(result);
                              selectedValue = localSelectedValue;
                              result = localResult;
                            });
                            Navigator.of(context).pop();

localResult=='سؤال اختار'?
showDialog( context: context, builder: (context){
   String? localSelectedValue = selectedValue;
      String localResult = result;
return StatefulBuilder( builder: (context,setStateDialog){
  
  return Dialog(child:SingleChildScrollView(child:   Container(//height: 484,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white,),
  padding: EdgeInsets.fromLTRB(18, 18, 18, 40),

  width: 1032,//height: 472,
child: Column(
  // spacing: 10,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
Container(width: 996,//height: 484,

child: Column(spacing: 4, children: [
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
_buildButtonmain(   icon:              Image.asset('assets/close-circl.png', width: 24, height: 24),

                      route: '/Lectures'
                      ,  isActive: Get.currentRoute == '/Lectures',
                      )
],),
Container(width: 996,
child: Column(children: [
Container(
  width: 996,//height: 132,
  child: Column( 
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
Text('أنشاء سؤال اختار',style:
 TextStyle(fontWeight: FontWeight.w600,
 fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)  ),)
    ,Container( 
     width: 996,//height: 76,
      child: Column(  crossAxisAlignment: CrossAxisAlignment.end,   spacing: 52,  children: [
          Container(//height: 274,
            // width: 453,
            child:Column(spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
Text('ادخل السؤال',style: TextStyle(fontSize: 16,
fontWeight: FontWeight.w500,color: Color.fromARGB(255, 12, 12, 12)),)
 ,

Container( height: 44,decoration: BoxDecoration(border: Border.all(width: 1),
borderRadius: BorderRadius.circular(8)),child:
TextField(
  
  textDirection: TextDirection.rtl,controller: controller.nametext,
decoration: InputDecoration(
      contentPadding: EdgeInsets.all(
  8
      ),
      border: InputBorder.none, 
    ),) 
),
Text('ادخل الاجابه الصحيحة',style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 12, 12, 12)),)
 ,

Container( height: 44,decoration: BoxDecoration(border: Border.all(width: 1),
borderRadius: BorderRadius.circular(8)),child:
TextField(textDirection: TextDirection.rtl,controller: controller.teacher_answertext,
decoration: InputDecoration(
      contentPadding: EdgeInsets.all(
  8
      ),
      border: InputBorder.none, 
    ),) 
),
Text('ادخل الاختيار',style:
 TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 12, 12, 12)),)
 ,
   ...  List.generate(
  controller.controllers.length,
  (index) {
    return Obx(() {
      return Container(
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: controller.controllers[index],
          textDirection: TextDirection.rtl,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(8),
            border: InputBorder.none,
          ),
        ),
      );
    });
  },
),


 DottedBorder(
// bor ,

color: Color.fromARGB(255, 6, 69, 152),
        radius: Radius.circular(8),
        strokeWidth: 1,
        dashPattern: [2, 2],
borderType: BorderType.RRect,
  child:Container(width: 996,height: 40,
child: TextButton(onPressed: (){
setState(() {
  

  
                   controller.add(  lessonid);
              // controller.update();      
                  });


}, child:Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text('انشاء اختيار جديد',style: TextStyle(fontSize: 18
  ,fontWeight: FontWeight.w500,color:
    Color.fromARGB(255, 6, 69, 152)),)
,SizedBox(width: 8,),Image.asset('assets/add-square.png',width: 20,height: 20,)
],) )),

),SizedBox(height: 4,) 
])
 )
     ])     ) ],),)
 ,
 Container(width: 996,height: 40,child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [

 Container(
  
  width: 193,height: 40,
  child:  
TextButton(
onPressed: localResult.isNotEmpty
                        ? () {
                            setState(() {
                              controller.add(lessonid);
                              selectedValue = localSelectedValue;
                              result = localResult;
                            });
                            Navigator.of(context).pop();

                          }
                        : null,
 
 
  child: Text(
    'حفظ',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Colors.white,
    ),
  ),
  style: TextButton.styleFrom(
    padding: EdgeInsets.all(8),
  backgroundColor:
                          localResult.isNotEmpty ?
                            Color.fromARGB(255, 6, 69, 152) : Colors.grey,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),),
 Container(
  width: 193,height: 40,
  child: TextButton(onPressed: (){}, child: Text('الغاء',style: TextStyle(fontWeight: FontWeight.w500
,  fontSize:18, color:Colors.white 
  ),)
  ,style: TextButton.styleFrom(

    // side:BorderSide( width: ),
    padding: EdgeInsets.all(8),
  backgroundColor: Color.fromARGB(255, 6, 69, 152),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
  ),
  ),),
  // SizedBox(height: 10,)
],
 ),)
//  ,SizedBox(height: 10,)
  ],),
)
  
],),
)

],),

)));

});

}):localResult=='سؤال مقالي'?
                       
showDialog( context: context, builder: (context){
   String? localSelectedValue = selectedValue;
      String localResult = result;
return StatefulBuilder( builder: (context,setStateDialog){
  
  return Dialog(child:  Container(height: 472,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white,),
  // padding: EdgeInsets.fromLTRB(18, 18, 18, 40),

  width: 1032,//height: 472,
child: Column(
  // spacing: 10,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
Container(width: 996,height: 414,

child: Column(spacing: 4, children: [
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
InkWell(child: 
 Image.asset('assets/close-circl.png', height: 24, width: 24),
 onTap: (){Navigator.pop(context);
        // Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Lectures()),
        //     );   
 },
)
],),
Container(width: 996,
child: Column(children: [
Container(
  width: 996,//height: 132,
  child: Column( 
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
Text('أنشاء سؤال جديد',style:
 TextStyle(fontWeight: FontWeight.w600,
 fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)  ),)
    ,Container( 
     width: 996,//height: 76,
      child: Column(
     crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 52,
        children: [
          Container(height: 274,
            // width: 453,
            child:Column(spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
Text('ادخل السؤال',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
 ,

Container( height: 44,decoration: BoxDecoration(border: Border.all(width: 1),
borderRadius: BorderRadius.circular(8)),child:
TextField( textDirection: TextDirection.rtl,controller:controller. textname,
decoration: InputDecoration(
      contentPadding: EdgeInsets.all(
  8
      ),
      border: InputBorder.none, // Remove the default TextField border
    ),) 
),
Container(
  height: 150,
  decoration: BoxDecoration(
    border: Border.all(width: 1),
    borderRadius: BorderRadius.circular(8),
  ),
  child: TextField(textDirection: TextDirection.rtl,controller: controller.textteacher,
    expands: true,  // This makes the TextField expand to fill available space
    maxLines: null, // Allows unlimited lines (required when expands is true)
    minLines: null, // Allows shrinking to minimum (required when expands is true)
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 8,
        right: 22,
      ),
      border: InputBorder.none, // Remove the default TextField border
    ),
  ),
)
])
 )
     ])     ) ],),)
 ,
 Container(width: 996,height: 40,child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
 Container(
  
  width: 193,height: 40,
  child:  
TextButton(
onPressed: localResult.isNotEmpty
                        ? () {
                            setState(() {
                              controller.textQuestion(lessonid);
                              // selectedValue = localSelectedValue;
                              // result = localResult;
                            });
                            Navigator.of(context).pop();

                          }
                        : null,
  child: Text(
    'حفظ',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Colors.white,
    ),
  ),
  style: TextButton.styleFrom(
    padding: EdgeInsets.all(8),
  backgroundColor:
                          localResult.isNotEmpty ?
                            Color.fromARGB(255, 6, 69, 152) : Colors.grey,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),),
 Container(
  width: 193,height: 40,
  child: TextButton(onPressed: (){}, child: Text('الغاء',style: TextStyle(fontWeight: FontWeight.w500
,  fontSize:18, color:Colors.white 
  ),)
  ,style: TextButton.styleFrom(

    // side:BorderSide( width: ),
    padding: EdgeInsets.all(8),
  backgroundColor: Color.fromARGB(255, 6, 69, 152),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
  ),
  ),)
],
 ),)
 
  ],),
)
  
],),
)

],),

));

});

}):localResult=='سؤال صح/غلط'?

showDialog( context: context, builder: (context){
   String? localSelectedValue = selectedValue;
      String localResult = result;
return StatefulBuilder( builder: (context,setStateDialog){
  
  return Dialog(child:  Container(height: 366,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white,),
  padding: EdgeInsets.fromLTRB(18, 18, 18, 40),

  width: 1032,//height: 472,
child: Column(
  // spacing: 10,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
Container(width: 996,//height: 308,

child: Column(spacing: 4, children: [
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
InkWell(child: 
 Image.asset('assets/close-circl.png', height: 24, width: 24),
 onTap: (){Navigator.pop(context);
        // Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Lectures()),
        //     );   
 },
)
],),
Container(width: 996,
child: Column(children: [
Container(
  width: 996,//height: 132,
  child: Column( 
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
Text('أنشاء سؤال صح/غلط',style:
 TextStyle(fontWeight: FontWeight.w600,
 fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)  ),)
    ,Container( 
     width: 996,//height: 76,
      child: Column(
     crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 52,
        children: [
          Container(height: 189,
            // width: 453,
            child:Column(spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
Text('ادخل السؤال',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
 ,

Container( height: 44,decoration: BoxDecoration(border: Border.all(width: 1),
borderRadius: BorderRadius.circular(8)),child:
TextField( controller: controller.wrightwrongname ,textDirection: TextDirection.rtl,
decoration: InputDecoration(
      contentPadding: EdgeInsets.all(
  8
      ),
      border: InputBorder.none, // Remove the default TextField border
    ),) 
),
Text('ادخل الاجابه الصحيحه',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
 ,

Container( height: 44,decoration: BoxDecoration(border: Border.all(width: 1),
borderRadius: BorderRadius.circular(8)),child:
TextField(textDirection: TextDirection.rtl,controller: controller.wrightwrongteacher_answer,
decoration: InputDecoration(
      contentPadding: EdgeInsets.all(
  8
      ),
      border: InputBorder.none, // Remove the default TextField border
    ),) 
),
// Container(
//   height: 150,
//   decoration: BoxDecoration(
//     border: Border.all(width: 1),
//     borderRadius: BorderRadius.circular(8),
//   ),
//   child: TextField(textDirection: TextDirection.rtl,
//     expands: true,  // This makes the TextField expand to fill available space
//     maxLines: null, // Allows unlimited lines (required when expands is true)
//     minLines: null, // Allows shrinking to minimum (required when expands is true)
//     decoration: InputDecoration(
//       contentPadding: EdgeInsets.only(
//         top: 15,
//         bottom: 15,
//         left: 8,
//         right: 22,
//       ),
//       border: InputBorder.none, // Remove the default TextField border
//     ),
//   ),
// )

])
 )
     ])     ) ],),)
 ,
 Container(width: 996,height: 40,child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
 Container(
  
  width: 193,height: 40,
  child:  
TextButton(
onPressed: localResult.isNotEmpty
                        ? () {
                          controller.wrightWrong(lessonid);
                            // setState(() {
                            //   selectedValue = localSelectedValue;
                            //   result = localResult;
                            // });
                            // Navigator.of(context).pop();

                          }
                        : null,
  child: Text(
    'حفظ',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Colors.white,
    ),
  ),
  style: TextButton.styleFrom(
    padding: EdgeInsets.all(8),
  backgroundColor:
                          localResult.isNotEmpty ?
                            Color.fromARGB(255, 6, 69, 152) : Colors.grey,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),),
//  Container(
//   width: 193,height: 40,
//   child: TextButton(onPressed: (){}, child: Text('الغاء',style: TextStyle(fontWeight: FontWeight.w500
// ,  fontSize:18, color:Colors.white 
//   ),
//   )
//   ,style: TextButton.styleFrom(

//     // side:BorderSide( width: ),
//     padding: EdgeInsets.all(8),
//   backgroundColor: Color.fromARGB(255, 6, 69, 152),
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
//   ),
//   ),)
],
 ),)
 
  ],),
)
  
],),
)

],),

));

});

})

:showDialog( context: context, builder: (context){
   String? localSelectedValue = selectedValue;
      String localResult = result;
return StatefulBuilder( builder: (context,setStateDialog){
  
  return Dialog(child:  Container(height: 366,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white,),
  // padding: EdgeInsets.fromLTRB(18, 18, 18, 40),

  width: 1032,//height: 472,
child: Column(
  // spacing: 10,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
Container(width: 996,height: 308,

child: Column(spacing: 4, children: [
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
InkWell(child: 
 Image.asset('assets/close-circl.png', height: 24, width: 24),
 onTap: (){Navigator.pop(context);
        // Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Lectures()),
        //     );   
 },
)
],),
Container(width: 996,
child: Column(children: [
Container(
  width: 996,//height: 132,
  child: Column( 
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
Text('أنشاء سؤال اكمل',style:
 TextStyle(fontWeight: FontWeight.w600,
 fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)  ),)
    ,Container( 
     width: 996,//height: 76,
      child: Column(
     crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 52,
        children: [
          Container(// height: 274,
            // width: 453,
            child:Column(spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
Text('ادخل السؤال',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
 ,

Container( height: 44,decoration: BoxDecoration(border: Border.all(width: 1),
borderRadius: BorderRadius.circular(8)),child:
TextField(textDirection: TextDirection.rtl,controller: controller.completeteacher,
decoration: InputDecoration(
      contentPadding: EdgeInsets.all(
  8
      ),
      border: InputBorder.none, // Remove the default TextField border
    ),) 
),
Text(' ادخل الاجابه الصحيحه',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
 ,

Container( height: 44,decoration: BoxDecoration(border: Border.all(width: 1),
borderRadius: BorderRadius.circular(8)),child:
TextField(textDirection: TextDirection.rtl,controller: controller.completename,
decoration: InputDecoration(
      contentPadding: EdgeInsets.all(
  8
      ),
      border: InputBorder.none, // Remove the default TextField border
    ),) 
),

])
 )
     ])     ) ],),)
 ,SizedBox(height: 8,),
 Container(width: 996,height: 40,child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
 
 Container(
  
  width: 193,height: 40,
  child:  
TextButton(
onPressed: localResult.isNotEmpty
                        ? () {
                            // setState(() {
                            //   selectedValue = localSelectedValue;
                            //   result = localResult;
                            // });
                            // Navigator.of(context).pop();
controller.completeQuestion(lessonid);
                          }
                        : null,
  child: Text(
    'حفظ',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Colors.white,
    ),
  ),
  style: TextButton.styleFrom(
    padding: EdgeInsets.all(8),
  backgroundColor:
                          localResult.isNotEmpty ?
                            Color.fromARGB(255, 6, 69, 152) : Colors.grey,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),),
//  Container(
//   width: 193,height: 40,
//   child: TextButton( onPressed: (){}, child: Text('الغاء',style: TextStyle(fontWeight: FontWeight.w500
// ,  fontSize:18, color:Colors.white 
//   ),)
//   ,style: TextButton.styleFrom(

//     // side:BorderSide( width: ),
//     padding: EdgeInsets.all(8),
//   backgroundColor: Color.fromARGB(255, 6, 69, 152),
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
//   ),
//   ),
  // )
],
 ),)
 
  ],),
)
  
],),
)

],),

));

});

});
                       
                       
                       
                          }
                        : null,
  child: Text(
    'التالي',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Colors.white,
    ),
  ),
  style: TextButton.styleFrom(
    padding: EdgeInsets.all(8),
  backgroundColor:
                          
          localResult.isNotEmpty ?  Color.fromARGB(255, 6, 69, 152) : Colors.grey
   , shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),),
 Container(
  width: 193,height: 40,
  child: TextButton(onPressed: (){}, 
  child: Text('الغاء',style: TextStyle(fontWeight: FontWeight.w500
,  fontSize:18, color:Colors.white 
  ),)
  ,style: TextButton.styleFrom(
    // side:BorderSide( width: ),
    padding: EdgeInsets.all(8),
  backgroundColor: Color.fromARGB(255, 6, 69, 152),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
  ),
  ),)
],
 ),)
 
  ],),
)
  
],),
)

],),

));

});
  }
}