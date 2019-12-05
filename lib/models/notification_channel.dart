import 'package:glacius_mobile/models/base_model.dart';

class NotificationChannel extends BaseModel {
  final String name;
  final String website;

  NotificationChannel({
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

  NotificationChannel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        website = json['website'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'name': name,
      'website': website,
    });
}
