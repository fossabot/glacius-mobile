import 'package:glacius_mobile/models/base_model.dart';
import 'package:glacius_mobile/models/models.dart';

class Product extends BaseModel {
  final String name;
  final String description;
  final List<String> images;
  final List<ProductVariant> productVariants;

  Product({
    int id,
    this.name,
    this.description,
    this.images,
    this.productVariants,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object> get props => super.props
    ..addAll([
      name,
      description,
      images,
      productVariants,
    ]);

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        images = json['images'],
        productVariants = (json['product_variants'] as List)
            .map((model) => ProductVariant.fromJson(model))
            .toList(),
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'name': name,
      'description': description,
      'images': images,
      'product_variants': productVariants,
    });
}
