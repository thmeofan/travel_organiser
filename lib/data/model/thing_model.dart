class Thing {
  String name;
  int quantity;
  String description;
  double weight;
  Map<String, dynamic> category;

  Thing({
    required this.name,
    required this.quantity,
    required this.description,
    required this.weight,
    required this.category,
  });

  factory Thing.fromJson(Map<String, dynamic> json) {
    return Thing(
      name: json['name'],
      quantity: json['quantity'],
      description: json['description'],
      weight: json['weight'].toDouble(),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'description': description,
      'weight': weight,
      'category': category,
    };
  }
}
