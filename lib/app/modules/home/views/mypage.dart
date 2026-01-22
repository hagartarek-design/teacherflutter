import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/views/homescreen.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Notification Icon
           
              // User Info Section
              Flexible(
                flex: screenWidth > 600 ? 1 : 2,
                child: Container(
                  width: 200,
                  height: 48.0,
                  child: Row(
                    children: [
                         Container(
                width: 24,
                height: 24,
                child: Image.asset('icons/notification-bing.png'),
              ),
          
                      // User Details
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'عمرو سمسر',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                'فزياء',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homescreen()),
                          );
                          controller.allimages();
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage('http://localhost:3300/${controller.users.image}'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Only show the "صفحتي" label for larger screens (>=600px)
              if (screenWidth > 600) 
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'صفحتي',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
