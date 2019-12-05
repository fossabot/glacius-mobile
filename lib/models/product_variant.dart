import 'package:glacius_mobile/models/base_model.dart';

class ProductVariant extends BaseModel {
  final String name;
  final String price;
  final String stock;

  ProductVariant({
    int id,
    this.name,
    this.price,
    this.stock,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object> get props => super.props
    ..addAll([
      name,
      price,
      stock,
    ]);

  ProductVariant.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        stock = json['stock'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'name': name,
      'price': price,
      'stock': stock,
    });
}
