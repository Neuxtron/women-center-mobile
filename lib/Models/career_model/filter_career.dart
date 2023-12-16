class FilterJobType {
  final int id;
  final String name;
  final String description;

  FilterJobType({
    required this.id,
    required this.name,
    required this.description,
  });

  factory FilterJobType.fromJson(Map<String, dynamic> json) {
    return FilterJobType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
