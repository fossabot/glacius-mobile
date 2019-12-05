import 'dart:convert';

import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String url;
  final String name;
  final String fileName;
  final String collection;

  Image({
    this.url,
    this.name,
    this.fileName,
    this.collection,
  });

  @override
  List<Object> get props => [
        url,
        name,
        fileName,
        collection,
      ];

  Image.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        name = json['name'],
        fileName = json['file_name'],
        collection = json['collection'];

  Map<String, dynamic> toJson() => {
        'url': url,
        'name': name,
        'file_name': fileName,
        'collection': collection,
      };

  @override
  String toString() => '$runtimeType ' + jsonEncode(this.toJson());
}
