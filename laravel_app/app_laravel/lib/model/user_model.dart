class Details {
  final int? id;
  final String? name;
  final String? age;
  final String? city;

  Details({
    this.id,
    required this.name,
    this.age,
    this.city,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "city": city,
    };
  }
}