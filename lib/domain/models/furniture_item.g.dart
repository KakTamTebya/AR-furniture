// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furniture_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FurnitureItem _$FurnitureItemFromJson(Map<String, dynamic> json) =>
    FurnitureItem(
      id: json['id'] as String,
      name: json['name'] as String,
      menuImageUrl: json['menuImageUrl'] as String,
      glbModelUrl: json['glbModelUrl'] as String,
      description: json['description'] as String,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FurnitureItemToJson(FurnitureItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'menuImageUrl': instance.menuImageUrl,
      'description': instance.description,
      'glbModelUrl': instance.glbModelUrl,
      'imageUrls': instance.imageUrls,
    };
