class Studentt {
  final String id;
  final String name;
  final String email;

  Studentt({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Studentt.fromJson(Map<String, dynamic> json) {
    return Studentt(
      id: json['id'],        // <-- one of these is null
      name: json['name'],
      email: json['email'],
    );
  }
}
