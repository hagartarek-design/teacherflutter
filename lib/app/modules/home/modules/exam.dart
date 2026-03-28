



class Exam {
  final int? id;
final String? durationmin;

 final String? examplace;
 final String?totaldegree;
 final String?exam_name;
 final int?examprice;
 final Map?course;
 final bool ?online;
final String? startdate;
final String? seedate;

//  final String? gradeName;
  Exam({
    this.id,
  this.durationmin,
  this.examplace
  ,this.totaldegree,
  this.examprice,
  this.course,this.exam_name,
    // this.gradeName
    this.online
    ,this.seedate,
    this.startdate
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
  print('json'+json['id'].toString());
    return Exam(
      
      id: json['id'] as int? ??0,
      durationmin:json['durationmin'] as String? ??'',
      examplace: json['examplace']as String? ??'',
      examprice:json['examprice'] as int? ??0
      ,totaldegree: json['totaldegree'] as String? ??''
    ,course: json['course']as Map? ??{},
    exam_name:json['exam_name']as String? ??''
,online:json['online']  as bool? ??true
    ,startdate:json['startdate']as String? ??''
    ,seedate:json['seedate']as String? ??''
    
    );

  }
}
