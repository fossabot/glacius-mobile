import 'package:glacius_mobile/mixin/mixin.dart';
import 'package:glacius_mobile/models/base_model.dart';

class Marketplace extends BaseModel with Statusable {
  final String name;
  final String website;

  Marketplace({
    int id,
    this.name,
    this.website,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object> get props => super.props
    ..addAll([
      name,
      website,
    ]);

  Marketplace.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        website = json['website'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'name': name,
      'website': website,
    });
}
