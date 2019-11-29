import 'dart:convert';
import 'package:glacius_mobile/models/base_model.dart';
import 'package:glacius_mobile/models/marketplace.dart';

class Customer extends BaseModel {
  final Marketplace marketplace;

  Customer({
    int id,
    this.marketplace,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object> get props => super.props
    ..addAll([
      marketplace,
    ]);

  Customer.fromJson(Map<String, dynamic> json)
      : marketplace = json['marketplace'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'marketplace': marketplace,
    });

  @override
  String toString() => '$runtimeType ' + jsonEncode(this.toJson());
}
