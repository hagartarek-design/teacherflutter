import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';

  HomeController controller=HomeController();
class AttendanceChart extends StatelessWidget {
  final double present = 40; // Replace with actual values
  final double absent = 40;  // Replace with actual values
  final double notAttended = 20; // Replace with actual values
final double non=20;
double absentPercentage=0.0;
  @override
  Widget build(BuildContext context) {
    return 


    
        Column(children: [
          
            Container( width: 148,height: 148,child:    PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Color.fromARGB(255, 39, 114, 83),
            value: present,
            title: '',
            radius: 40,
            titleStyle: TextStyle(color: Colors.white, fontSize: 16),
          ),
          PieChartSectionData(
            color: Color.fromARGB(255, 222, 61, 49)  ,
            value: absent,
            title: '',
            radius: 40,
            titleStyle: TextStyle(color: Colors.white, fontSize: 16),
          ),
          PieChartSectionData(
            color: Color.fromARGB(255, 242, 195, 42),
            value: notAttended,
            title: '',
            radius: 40,
            titleStyle: TextStyle(color: Colors.black, fontSize: 16),
          ),
          PieChartSectionData(
            color: Color.fromARGB(255, 127, 86, 217),
            value: non,
            title: '',
            radius: 40,
            titleStyle: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
        borderData: FlBorderData(show: false),
        centerSpaceRadius: 40,
        sectionsSpace: 0,
      ),
             )   )
        ]) ;
  }
}