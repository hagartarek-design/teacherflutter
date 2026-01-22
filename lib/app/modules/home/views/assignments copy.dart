import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/modules/users_info.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;


class Assignments2 extends StatefulWidget {
   Assignments2({super.key});

  @override
  State<Assignments2> createState() => _Assignments2State();
}

class _Assignments2State extends State<Assignments2> {
  final HomeController controller = HomeController();
  String? selectedValue; // Variable to store the selected value

  // List of items for the dropdown
  final List<String> items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[900]),
              child: Center(
                child: Text(
                  'المنصة التعليمية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Row(
  children: [
    // Main Content
    
    Expanded(
      flex: 1, // Reduced to 50% width (you can adjust the value further)
      child:
    SingleChildScrollView(child: 
      
       Column(
        children: [
          
          Container(  color: Colors.white,
            height: 96,
            padding: const EdgeInsets.fromLTRB(64, 24, 344, 24),
            child: App_bar(),
          ),
          Container(child: 
         Row(
          mainAxisAlignment:MainAxisAlignment.center
          ,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Column(
            //  spacing: 495,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [ 
              
              Container(width: 504,//height: 671,
  padding: EdgeInsets.only(top: 40,bottom: 40),
           
           margin: EdgeInsets.only(top:24),

           color:  Color.fromARGB(255, 255, 255, 255),
           
           child:Column(
           spacing: 24,  
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(width: 120,),
Container(
            // padding:EdgeInsets.fromLTRB(17, 40, 17, 40),

  child:Text('السؤال الاول',
style:TextStyle(
fontWeight: FontWeight.w800,fontSize: 32,
color: Color.fromARGB(255, 6, 69, 152)),
textAlign: TextAlign.right,) 
,width: 470,),
Container( width: 504,height: 399,
decoration: BoxDecoration(
color:Color.fromARGB
(255, 232, 232, 232),),
padding: EdgeInsets.all(17),
child:Column(
  
  spacing: 8,
  children: [
  
Container(
      width :470,
  decoration: BoxDecoration(
    // color: const Color.from(alpha: 1, red: 1, green: 1, blue: 1)

  ),child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  // spacing: 8,
  children: [
//   Image.asset('assets/arrow-up.png',width: 24 ,height: 24,)
// ,  
//   Image.asset('assets/arrow-down2.png',width: 24 ,height: 24,)
// ,  
    SizedBox(
  width: 155,height:40 ,
child:
Container(width: 136,child: 
TextButton(
  onPressed: () {
    
  },
  style: TextButton.styleFrom(
 shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
side: BorderSide(width: 1,color:  Color.fromARGB(255, 6, 69, 152))
),child: Row(
  // spacing: 8,
  children: [
Text('انشاءالقسم الفرعي',style: TextStyle(
  color: Color.fromARGB(255, 6, 69, 152)),)
,Image.asset('assets/add-square.png',width: 20,height: 20,)
],),
),),),
Text('القسم الفرعي الاول',style: TextStyle(fontSize: 20, fontWeight:FontWeight.w500 ,color:Color.fromARGB(255, 6, 69, 152) ),)
],),)

,
Container(
  padding: EdgeInsets.fromLTRB(24, 25, 24, 25),
  width: 470,height: 95,decoration:
   BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),   boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],),
  child: Container(width: 422,child: 
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

  Container(
    width: 110,height: 32,
    child:Row(
    spacing: 8,
    children: [
     Container(
      
      child:
     Row(
      spacing: 8,
      children: [
        Container( child:
        Container(
          decoration: BoxDecoration(border: Border.all(width: 2,
          color:Color.fromARGB(255, 6, 69, 152) )
          ,borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.all(4),
          width:32 ,height:32 ,child: 
        Image.asset('assets/delete (2).png',
        width: 24,height: 24,) ,),),
  Container(child: Text('درجة'),),
        
         Container(
          width: 24,height: 24,
          decoration:
    BoxDecoration(
  
      border: Border.all(width: 1,
    color:Color.fromARGB(255, 6, 69, 152))),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // spacing: 8,
      children: [
    Text('11',textAlign: TextAlign.center,)
  ,
  
  ])),
  
  
  ],)
     )

    ],) ,),
Container(
  
  child: 
Row(
  spacing: 16,
  children: [
  
  Text('اسم السؤال'),
  Image.asset('assets/questions (9).png',width: 24,height: 24,),
  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,),
  Image.asset('assets/arrow-down2.png',width: 24,height: 24,),
  Image.asset('assets/arrow-up.png',width: 24,height: 24,)


],))
            ])))
,
Container(
  padding: EdgeInsets.fromLTRB(24, 25, 24, 25),
  width: 470,height: 95,decoration:
   BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),   boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],),
  child: Container(width: 422,child: 
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

  Container(
    width: 110,height: 32,
    child:Row(
    spacing: 8,
    children: [
     Container(
      
      child:
     Row(
      spacing: 8,
      children: [
        Container( child:
        Container(
          decoration: BoxDecoration(border: Border.all(width: 2,
          color:Color.fromARGB(255, 6, 69, 152) )
          ,borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.all(4),
          width:32 ,height:32 ,child: 
        Image.asset('assets/delete (2).png',
        width: 24,height: 24,) ,),),
  Container(child: Text('درجة'),),
        
         Container(
          width: 24,height: 24,
          decoration:
    BoxDecoration(
  
      border: Border.all(width: 1,
    color:Color.fromARGB(255, 6, 69, 152))),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // spacing: 8,
      children: [
    Text('11',textAlign: TextAlign.center,)
  ,
  
  ])),
  
  
  ],)
     )

    ],) ,),
Container(
  
  child: 
Row(
  spacing: 16,
  children: [
  
  Text('اسم السؤال'),
  Image.asset('assets/questions (9).png',width: 24,height: 24,),
  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,),
  Image.asset('assets/arrow-down2.png',width: 24,height: 24,),
  Image.asset('assets/arrow-up.png',width: 24,height: 24,)


],))
            ])))
          
,          
Container(
  padding: EdgeInsets.fromLTRB(24, 25, 24, 25),
  width: 470,height: 95,decoration:
   BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),   boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],),
  child: Container(width: 422,child: 
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

  Container(
    width: 110,height: 32,
    child:Row(
    spacing: 8,
    children: [
     Container(
      
      child:
     Row(
      spacing: 8,
      children: [
        Container( child:
        Container(
          decoration: BoxDecoration(border: Border.all(width: 2,
          color:Color.fromARGB(255, 6, 69, 152) )
          ,borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.all(4),
          width:32 ,height:32 ,child: 
        Image.asset('assets/delete (2).png',
        width: 24,height: 24,) ,),),
  Container(child: Text('درجة'),),
        
         Container(
          width: 24,height: 24,
          decoration:
    BoxDecoration(
  
      border: Border.all(width: 1,
    color:Color.fromARGB(255, 6, 69, 152))),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // spacing: 8,
      children: [
    Text('11',textAlign: TextAlign.center,)
  ,
  
  ])),
  
  
  ],)
     )

    ],) ,),
Container(
  
  child: 
Row(
  spacing: 16,
  children: [
  
  Text('اسم السؤال'),
  Image.asset('assets/questions (9).png',width: 24,height: 24,),
  Image.asset('icons/✏️ Digit.png',width: 24,height: 24,),
  Image.asset('assets/arrow-down2.png',width: 24,height: 24,),
  Image.asset('assets/arrow-up.png',width: 24,height: 24,)


],))
            ])))
          
          
            ],)

)
     , Column(
      spacing: 8,
      crossAxisAlignment:CrossAxisAlignment.center, children: [ 
        Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
        width: 1,color:Color.fromARGB(255, 6, 69, 152)
        
         )),
      width:330
      ,child:   TextButton(onPressed: (){}, 
      style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text('أنشاء قسم جديد',style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 6, 69, 152)),),
              Image.asset('assets/add-square.png',width: 20,height: 20,)
           ],))
                 )    ],) ,
            Container(width: 504,height: 40,
            padding: EdgeInsets.only(right: 17,left: 17
            
            ),
            child: Row(
              
              mainAxisAlignment:MainAxisAlignment.start,
              spacing: 10, children: [Container(
                width: 193,height: 40,
                child:
                TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  side: BorderSide(width: 1,
                  color:Color.fromARGB(255, 6, 69, 152)),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Color.fromARGB(255, 6, 69, 152)),
                  onPressed: (){}, child: Text('اتمام الامتحان',
                style: TextStyle(color: Colors.white),))   
            )],),)
            
             ])),
           
           
     
           
           ]),SizedBox(width: 24,), Container(width: 504,height: 819,
           decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(16) ),),
            padding:EdgeInsets.fromLTRB(17, 40, 17, 40),
            margin: EdgeInsets.only(top: 24),

            child:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 24,
              children: [
            
Text('بنك الاسئلة',style: TextStyle(fontSize: 32,fontWeight:
 FontWeight.w600,color:Color.fromARGB(255, 6, 69, 152) ),)
         ,Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
         Container( 
          width: 223,
          child:  Column(
  spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
Text('اسم الوحدة'),Container(
  
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(1),
    border: Border.all(width: 1,color: Color.fromARGB(255, 195, 202, 210))),
  child: 
DropdownButtonFormField<String>(
        value: selectedValue, // Current selected value
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue; // Update selected value
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value), // Display text for each item
          );
        }).toList(),
        decoration: const InputDecoration(
          border: InputBorder.none, // Remove default border
          contentPadding: EdgeInsets.zero, // Adjust padding
        ),
        icon: const Icon(Icons.arrow_drop_down), // Dropdown icon
        style: const TextStyle(
          color: Colors.black, // Text color
          fontSize: 16, // Text size
        ),
        dropdownColor: Colors.white, // Dropdown background color
        borderRadius: BorderRadius.circular(8), // Dropdown border radius
      ),)
          ],)
          )
        , Container(
          width: 223,
          child:  Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
Text('اسم الوحدة'),Container(

  
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(1),
    border: Border.all(width: 1,color: Color.fromARGB(255, 195, 202, 210))),
  child: 
 
DropdownButtonFormField<String>(
        value: selectedValue, // Current selected value
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue; // Update selected value
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value), // Display text for each item
          );
        }).toList(),
        decoration: const InputDecoration(
          border: InputBorder.none, // Remove default border
          contentPadding: EdgeInsets.zero, // Adjust padding
        ),
        icon: const Icon(Icons.arrow_drop_down), // Dropdown icon
        style: const TextStyle(
          color: Colors.black, // Text color
          fontSize: 16, // Text size
        ),
        dropdownColor: Colors.white, // Dropdown background color
        borderRadius: BorderRadius.circular(8), // Dropdown border radius
      ),)
         
          ],)
          )
         ],),
         Container(
          width: 470,
          color: Colors.white,
          height: 44,
         child:
         Row(children: [
         Container(
          
          width: 117.5,height: 44,
          decoration:
          BoxDecoration(color:
          Colors.white,borderRadius:
           BorderRadius.circular(8)),
          child:  Row(mainAxisAlignment: MainAxisAlignment.center ,
          spacing: 4,
          children: [
            Text('سؤال صح/غلط',style:TextStyle(color: Color.fromARGB(255, 6, 69, 152)),),
            Image.asset('assets/questions (7).png',width: 16,height: 16,)
         ],),)
        , Container(
          
          width: 117.5,height: 44,
          decoration:
          BoxDecoration(color:
          Colors.white,borderRadius:
           BorderRadius.circular(8)),
          child:  Row(mainAxisAlignment: MainAxisAlignment.center ,
          spacing: 4,
          children: [
            Text('سؤال صح/غلط',style:TextStyle(color:Color.fromARGB(255, 6, 69, 152) ),),
            Image.asset('assets/questions (5).png',width: 16,height: 16,)
         ],),)
        , Container(
          
          width: 117.5,height: 44,
          decoration:
          BoxDecoration(color:
          Color.fromARGB(255, 6, 69, 152),borderRadius:
           BorderRadius.circular(8)),
          child:  Row(mainAxisAlignment: MainAxisAlignment.center ,
          spacing: 4,
          children: [
            Text('سؤال مقالى',style:TextStyle(color: Colors.white ),),
            Image.asset('assets/questions (7).png',width: 16,height: 16,)
         ],),)
         ,Container(
          
          width: 117.5,height: 44,
          decoration:
          BoxDecoration(color:
          Colors.white,borderRadius:
           BorderRadius.circular(8)),
          child:  Row(mainAxisAlignment: MainAxisAlignment.center ,
          spacing: 4,
          children: [
            Text('سؤال صح/غلط',style:TextStyle(color:Color.fromARGB(255, 6, 69, 152) ),),
            Image.asset('assets/questions (5).png',width: 16,height: 16,)
         ],),)
      
          ,]) )
          ,
        
          Container( width:  470,
          height: 95,padding: EdgeInsets.fromLTRB(24, 25,24, 25),
          decoration: BoxDecoration(
             color: Colors.white,  
             boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
            border: Border.all(width: 1,color:
            Color.fromARGB(255, 255, 255, 255))
            ,borderRadius: BorderRadius.circular(10)
            
            ),
      
       child: Row(spacing: 10,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
  Container(
    width: 144,
    child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:[
    
  Image.asset("assets/arrow-down.png",height:32 ,width:34 ,)
  , Container(width: 26 ,height: 26,
    child:
    Container(decoration:
    BoxDecoration(border: Border.all(width: 1,
    color:Color.fromARGB(255, 6, 69, 152))),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // spacing: 8,
      children: [
    Text('11',textAlign: TextAlign.center,)
  ,]))
  ),
      Text('درجة') 
  ],)
  ) ,
  
Container(child: Row(children: [Text('اسم السؤال'),
Image.asset('assets/Group (8).png',height: 24,width: 24,)],))
  
  ,
  
   ],
       ),
          )
           
        ,  Container( width:  470,
          height: 95,padding: EdgeInsets.fromLTRB(24, 25,24, 25),
          decoration: BoxDecoration(
             color: Colors.white,  
             boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
            border: Border.all(width: 1,color:
            Color.fromARGB(255, 255, 255, 255))
            ,borderRadius: BorderRadius.circular(10)
            
            ),
      
       child: Row(spacing: 10,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
  Container(
    width: 144,
    child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:[
    
  Image.asset("assets/arrow-down.png",height:32 ,width:34 ,)
  , Container(width: 26 ,height: 26,
    child:
    Container(decoration:
    BoxDecoration(border: Border.all(width: 1,
    color:Color.fromARGB(255, 6, 69, 152))),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // spacing: 8,
      children: [
    Text('11',textAlign: TextAlign.center,)
  ,]))
  ),
      Text('درجة') 
  ],)
  ) ,
  
Container(child: Row(children: [Text('اسم السؤال'),
Image.asset('assets/Group (8).png',height: 24,width: 24,)],))
  
  ,
  
   ],
       ),
          )
           
        
        ,  Container( width:  470,
          height: 95,padding: EdgeInsets.fromLTRB(24, 25,24, 25),
          decoration: BoxDecoration(
             color: Colors.white,  
             boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
            border: Border.all(width: 1,color:
            Color.fromARGB(255, 255, 255, 255))
            ,borderRadius: BorderRadius.circular(10)
            
            ),
      
       child: Row(spacing: 10,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
  Container(
    width: 144,
    child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:[
    
  Image.asset("assets/arrow-down.png",height:32 ,width:34 ,)
  , Container(width: 26 ,height: 26,
    child:
    Container(decoration:
    BoxDecoration(border: Border.all(width: 1,
    color:Color.fromARGB(255, 6, 69, 152))),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // spacing: 8,
      children: [
    Text('11',textAlign: TextAlign.center,)
  ,]))
  ),
      Text('درجة') 
  ],)
  ) ,
  
Container(child: Row(children: [Text('اسم السؤال'),
Image.asset('assets/Group (8).png',height: 24,width: 24,)],))
  
  ,
  
   ],
       ),
          )
           
        
           ]) ,
        // child: ,
          ),])
        // ),
        
        
      ,)
  ],)  ),),
    // Sidebar
    Container(
      
          
      width: 280, // Fixed width for the sidebar
      height: double.infinity, // Full height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        color: Color.fromARGB(240, 6, 69, 152), // Sidebar background color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: rightbar(),
    ),
           
  ],
);
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Positioned(top: 0,bottom: 50,child:  Container(
     
     
      decoration:BoxDecoration(
        borderRadius: BorderRadius.only(topRight:Radius.circular(16) ,topLeft: Radius.circular(16)),
       ),
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
     
       
          ElevatedButton(
            onPressed: () {
              // Add lecture logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color.fromARGB(206, 6, 69, 152)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'أضف المحاضره',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromARGB(206, 6, 69, 152),
                  ),
                ),
                SizedBox(width: 4),
                Image.asset('icons/add-square.png',height: 24,width: 24,)
              ],
            ),
          ),
          Text(
            'الواجبات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ],
      ),)
    );
  }
  Widget _buildHeader2() {
    return Container(
     
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
     
       
         Container(child:Row(children: [
           Container(
            margin: EdgeInsets.symmetric(vertical: 120),
            decoration: BoxDecoration(color: const Color.fromARGB(210, 203, 219, 238),borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 11),
            child: Row(children: [  
              
              
              Text('امتحان في السنتر',style: TextStyle(color: Color.fromARGB(155, 6, 69, 152),),textAlign: TextAlign.right,)
         ,     Image.asset('assets/Frame (2).png',width: 30,height: 30,)
              
              ],),
            
            )
,
          
         

         ],))
          
        ],
      ),
    );
  }

  Widget _buildList(HomeController controller) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.Exams.length,
        itemBuilder: (context, index) {
          final item = controller.Exams[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),

            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: 95,
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('icons/Frame6.png', width: 26, height: 23),
                Row(
                  children: [
                    Text('جنيه', style: TextStyle(fontSize: 16)),
                    Text(
                     '${ item.durationmin.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(202, 6, 69, 152),
                      ),
                    ),
                  ],
                ),
               
              
                Row(
                  children: [
                    Text('درجة', style: TextStyle(fontSize: 16)),
                    Text(
                      item.totaldegree.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(202, 6, 69, 152),
                      ),
                    ),
                  ],
                ),
               
                Row(
                  children: [
                    Text('', style: TextStyle(fontSize: 16)),
                    Text(
                      item.course?['month_by_year'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(202, 6, 69, 152),
                      ),
                    ),
                  ],
                ),  Row(
                  children: [
                    Text('', style: TextStyle(fontSize: 16)),
                    Text(
                      item.examplace.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(202, 6, 69, 152),
                      ),
                    ),
                  ],
                ),
                
                 Row(
                  children: [
                    Text('دقيقة', style: TextStyle(fontSize: 16)),
                    Text(
                      item .examprice.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(202, 6, 69, 152),
                      ),
                    ),
                  ],
                ),
                 Row(
                  children: [
                    Text(
                      'اسم الامتحان',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 4),
                   Image.asset('icons/✏️ Digit.png',width: 24,height: 24,)
                  ],
                ),
              
              
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPagination(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.totalPages, (index) {
        final pageIndex = index + 1;
        return GestureDetector(
          onTap: () {
            controller.currentPage = pageIndex;
            controller.exampagination(page:controller.currentPage);
            controller.update();
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: pageIndex 
              == controller.currentPage
                  ? Color.fromARGB(255, 236, 238, 241)
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$pageIndex',
              style: TextStyle(
                color: pageIndex == controller.currentPage
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }
}
