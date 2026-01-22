class Courses2 {
  int? id;
  String? name;
  String? description;
  bool? attendance;
  String? grade;
  String? type;
  bool? sheetsPaym;
  String? createdDate;
  String? updatedDate;
  String? monthByYear;
  List<CourseAttend>? courseAttend;

  Courses2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    attendance = json['attendance'];
    grade = json['grade'];
    type = json['type'];
    sheetsPaym = json['sheets_paym'];
    createdDate = json['created_date'];
    updatedDate = json['Updated_date'];
    monthByYear = json['month_by_year'];
    if (json['course_attend'] != null) {
      courseAttend = [];
      json['course_attend'].forEach((v) {
        courseAttend!.add(CourseAttend.fromJson(v));
      });
    }
  }
}

class CourseAttend {
  int? id;
  String? month;
  String? days;
  String? seenAmount;
  String? payAmount;

  CourseAttend.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    month = json['month'];
    days = json['days'];
    seenAmount = json['seen_amount'].toString();
    payAmount = json['pay_amount'].toString();
  }
}

