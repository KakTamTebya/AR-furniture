import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'furniture_item.g.dart';

@JsonSerializable()
class FurnitureItem implements Equatable {

  final String id;

  final String name;

  final String menuImageUrl;

  final String description;

  final String glbModelUrl;

  final List<String>? _imageUrls;

  FurnitureItem({
    required this.id,
    required this.name,
    required this.menuImageUrl,
    required this.glbModelUrl,
    required this.description,
    List<String>? imageUrls}) : _imageUrls = imageUrls;

  List<String> get imageUrls => [menuImageUrl, ...?_imageUrls];

  factory FurnitureItem.fromJson(Map<String, dynamic> json) => _$FurnitureItemFromJson(json);

  Map<String, dynamic> toJson() => _$FurnitureItemToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    menuImageUrl,
    description,
    glbModelUrl,
    _imageUrls,
  ];

  @override
  bool? get stringify => true;
}
