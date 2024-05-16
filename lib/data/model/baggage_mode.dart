import 'package:travel_organiser/data/model/thing_model.dart';
import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class Baggage {
  String name;
  double weight;
  double capacity;
  List<Thing> things;
  Color color;

  Baggage({
    required this.name,
    required this.weight,
    required this.capacity,
    this.color = AppColors.lightGreenColor,
    List<Thing>? things,
  }) : things = things ?? [];

  factory Baggage.fromJson(Map<String, dynamic> json) {
    return Baggage(
      name: json['name'],
      weight: json['weight'].toDouble(),
      capacity: json['capacity'].toDouble(),
      things: (json['things'] as List<dynamic>?)
              ?.map((item) => Thing.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weight': weight,
      'capacity': capacity,
      'things': things.map((thing) => thing.toJson()).toList(),
    };
  }
}
