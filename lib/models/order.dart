import 'package:glacius_mobile/models/base_model.dart';
import 'package:glacius_mobile/models/marketplace.dart';

class Order extends BaseModel {
  final String totalPrice;
  final String subtotalPrice;
  final Marketplace marketplace;

  Order({
    int id,
    this.totalPrice,
    this.subtotalPrice,
    this.marketplace,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object> get props => super.props
    ..addAll([
      totalPrice,
      subtotalPrice,
      marketplace,
    ]);

  Order.fromJson(Map<String, dynamic> json)
      : totalPrice = json['total_price'],
        subtotalPrice = json['subtotal_price'],
        marketplace = Marketplace.fromJson(
          Map<String, dynamic>.from(json['marketplace']),
        ),
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'total_price': totalPrice,
      'subtotal_price': subtotalPrice,
      'marketplace': marketplace,
    });
}
