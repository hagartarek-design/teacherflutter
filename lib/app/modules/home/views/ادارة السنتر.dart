import 'package:flutter/material.dart';
import 'package:flutterwallet/Applinks.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';
import 'package:flutterwallet/app/modules/home/views/addgroup.showdialog.dart';
import 'package:flutterwallet/app/modules/home/views/borderright.dart';
import 'package:flutterwallet/app/modules/home/views/grouphasstudents.dart';
import 'package:flutterwallet/app/modules/home/views/stable_app_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:path/path.dart';

import 'studentsingroup.dart';

class managecenter extends StatelessWidget {
  final HomeController controller = HomeController();

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
 if (controller.coursemanager.isEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              controller.coursemanage().then((_) {
               
              });
            });
          }          
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 96,
                        padding: const EdgeInsets.fromLTRB(64, 24, 344, 24),
                        child: App_bar(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                        child: Column(
                          children: [
                            _buildCardSection('إدارة السنتر', controller,context),
                            SizedBox(height: 16),
                            _buildCardSection2('طلبات حجز السنتر ', controller),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          Container(
                width: 280,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                  color: Color.fromARGB(240, 6, 69, 152),
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

  Widget _buildCardSection(String title, HomeController controller,context) {
    return Container(width: 1032,
      color: Colors.white,
 
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _buildHeader(context),
    Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 95,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 3),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        
      ),child: 
      

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

Text('')
,
Text('المنطقه'),
Text('عدد الاقصي للطلاب '),
Text('ميعاد الدرس'),
Text('السنتر '),

      
      ],),),
    // ),
           ListView.builder(
  shrinkWrap: true,
  itemCount: controller.coursemanager.length,
  itemBuilder: (context, index) {
  
    final course = controller.coursemanager[index];
    var outputFormat = DateFormat('hh:mm a');

    return InkWell(
      onTap: () {
    
        print("Clicked Course ID: ${course.id}");
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Studentsingroup(course:course),
          ),
        );
controller.Studentsbycourse(course.id.toString());

      },
      child: _buildItem(
        '${course.placecountry}', 
        '${course.availableStudents} طالب', 
        '${course.month_by_year}   ${outputFormat.format(
          DateTime.parse(
            DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
              .parse(course.created_date.toString())
              .toString()
          )
        )}',
        '${course.placecountry ?? "N/A"}',
        context,
      ),
    );
  },
),
   ])));
  }

  Widget _buildCardSection2(String title, HomeController controller) {
    return Container(width: 1032,
      color: Colors.white,
  
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 95,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 3),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        
      ),child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
Text(''),
Text('الحاله'),
Text('رقم تليفون الام')
,
Text('رقم تليفون الطالب'),
Text('ميعاد الدرس'),
Text('السنتر'),
Text('اسم الطالب'),


      ],),),
            // _buildHeader2(),
            
            ListView.builder(
              shrinkWrap: true, 
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.coursereserv.length, 
              itemBuilder: (context, index) {
var outputFormat = DateFormat('hh:mm a');
      //  controller.findonecourse(id:'${controller.uniquecourse.id.toString()}');

                return _buildItem2('${controller.coursereserv[index].price}','${controller.coursereserv[index].students?['parent_num'].toString()}',
              
               '${controller.coursereserv[index].students?['phoneNum'].toString()}'
           ,     '${controller.coursereserv[index].course?['month_by_year']}'
,
                '${outputFormat.format(DateTime.parse( new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(controller.coursereserv[index].start_date.toString()??'').toString()??''))}',  
               '${controller.coursereserv[index].place.toString()??''}',

                '+(02)${controller.coursereserv[index].students?['customernum'].toString()??''}'
              // },
         , '${Applinks.baseurl}/${controller. coursereserv[index].students?['img'].toString()??''}',   );}
         ) ],
        ),
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {



   showDialog(context: context, builder: (BuildContext context ){
return Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment:MainAxisAlignment.center,
  children: [ 
    
Expanded(child:   
  SingleChildScrollView(child: 
    addgroupdialog()))]);
      });
              
      },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color.fromARGB(206, 6, 69, 152)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child:Container(height: 40,child:Row(
              children: [
                Text(
                  'اضف مجموعة',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromARGB(206, 6, 69, 152),
                  ),
                ),
                SizedBox(width: 4),
                Image.asset('icons/add-square.png', height: 24, width: 24),
              ],
            ),)
          ),
          Text(
            'انشاء مجموعات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildHeader2() {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
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
                  'اضف مجموعة',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromARGB(206, 6, 69, 152),
                  ),
                ),
                SizedBox(width: 4),
                Image.asset('icons/add-square.png', height: 24, width: 24),
              ],
            ),
          ),
          Text(
            'انشاء مجموعات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String priceLabel, String price, String times, String lectureName,context) {

  return      Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 95,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 3),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('icons/Frame6.png', width: 26, height: 23),
          Row(
            children: [
              Text(priceLabel, style: TextStyle(fontSize: 16)),
             
            ],
          ),
          Row(
            children: [
              Text(price, style: TextStyle(fontSize: 16)),
          
            ],
          ),
          Row(
            children: [
             
            Container(width: 73,child:  
             Text(textAlign: TextAlign.center,
                times,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
             fontFamily: 'Teshrin AR+LT',
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
              ))
            ,Image.asset('assets/calendar.png',width: 20,height: 20,),
         
            ],
          ),
          Row(
            children: [
              Text(
                lectureName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: 4),
              Image.asset('icons/✏️ Digit.png',width: 24,height: 24,),

            ],
          ),
        ],
      ),//)
    );
  }

  Widget _buildItem2(String num1,String num2, String price,String month, String times,String priceLabel, String num,String img) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 95,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 3),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('icons/Frame6.png', width: 26, height: 23),
         
          Row(
            children: [
              Text('جنيه'+num1, style: TextStyle(fontSize: 16)),
              // Text(
              //   price,
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 16,
              //     color: Color.fromARGB(202, 6, 69, 152),
              //   ),
              // ),
            ],
          ),
           Row(
            children: [
              // Text(price, style: TextStyle(fontSize: 16)),
              Text(
                price,
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
              Text(num2, style: TextStyle(fontSize: 16)),
              // Text(
              //   price,
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 16,
              //     color: Color.fromARGB(202, 6, 69, 152),
              //   ),
              // ),
            ],
          ),
           
          
          Row(
            children: [
              // Text(timesLabel, style: TextStyle(fontSize: 16)),
        
            Container(width: 73,child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text(textAlign: TextAlign.center,
                month,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
             fontFamily: 'Teshrin AR+LT',
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
            ),
            
                Text(textAlign: TextAlign.center,
                times,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
             fontFamily: 'Teshrin AR+LT',
                  color: Color.fromARGB(202, 6, 69, 152),
                ),
            )
            ]))
            ,Image.asset('assets/calendar.png',width: 20,height: 20,),
         
            ],
          ),
      Row(
            children: [
              Text(priceLabel, style: TextStyle(fontSize: 16)),
              // Text(
              //   price,
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 16,
              //     color: Color.fromARGB(202, 6, 69, 152),
              //   ),
              // ),
            ],
          ),
         
          Row(
            children: [
                    //  Container(width: 187,height: 72,
                
                // padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                // decoration: BoxDecoration(color:Colors.white)
                // ,child:
                Container(width: 140,height: 40,child:  
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
//  Container(width: 91,height: 40,
                      // child:
                       Column(
                        
                        children: [
                       Text('اسم العميل',textAlign: TextAlign.right
                       ,style: TextStyle(fontFamily: 'Teshrin AR+LT'
                       ,fontWeight:FontWeight.w500,
                       fontSize: 14
                       ,height:17.5/14 
                       
                       ),
                       
                       )
                       ,SizedBox(height: 8,),
                    Text(num,style: TextStyle(
                          color: Colors.grey 
                          ,fontSize: 12,fontFamily: 'Teshrin AR+LT',
                        fontWeight: FontWeight.w500 
                        ,height: 15/14
                        ),)]),
                      // ],)) 
                // ,SizedBox(width:8),
                 Container(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          
                          radius: 24,
                          backgroundImage: NetworkImage('${img}'),
                        ),
                      ),
                   
                   
                   
                     ],)
                ,),
            ],
          ),
        ],
      ),
    );
  }
}
