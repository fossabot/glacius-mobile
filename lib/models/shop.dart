import 'dart:convert';

import 'package:glacius_mobile/models/base_model.dart';

class Shop extends BaseModel {
  final String name;
  final String description;

  Shop({
    int id,
    this.name,
    this.description,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object> get props => super.props
    ..addAll([
      name,
      description,
    ]);

  Shop.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'name': name,
      'description': description,
    });

  @override
  String toString() => '$runtimeType ' + jsonEncode(this.toJson());
}
