class Questions {
  final int? id;
  final String? name;
  final List<dynamic> ?students;
  final List<dynamic> ?lesson;

  Questions({
    this.id,
    this.name,
    this.students,this.lesson
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
print('json'+json['id'].toString());
    return Questions(
      
      id: json['id'] as int? ??0,
      name: json['name'] as String? ??''
     ,students:json['students'] as List<dynamic>? ??[]
     ,lesson:json['lessons'] as List<dynamic>? ??[]
   
 
    );
  }
}