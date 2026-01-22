class Sections {
  final int id;
  final String name;
  final int price;
  final int viewingWatching;
  final String? cardimg; // Make nullable if it can be null

  Sections({
    required this.id,
    required this.name,
    required this.price,
    required this.viewingWatching,
    this.cardimg,
  });

  factory Sections.fromJson(Map<String, dynamic> json) {
    return Sections(
      id: json['id'] as int? ?? 0, // Provide default value if null
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0, // Provide default value if null
      viewingWatching: json['viewingWatching'] as int? ?? 0, // Provide default value if null
      cardimg: json['cardimg'] as String?,
    );
  }
}