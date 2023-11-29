import 'package:ar_furniture/domain/models/furniture_item.dart';

abstract class Mocks {
  static final List<FurnitureItem> floorFurnitureMock = [
    for (var i = 0; i < 10; i++) FurnitureItem(
      id: i.toString(),
      name: "Стол TetChair обеденный BOSCO",
      menuImageUrl: "https://ir-2.ozone.ru/s3/multimedia-x/wc1000/6305988369.jpg",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing "
          "elit, sed do eiusmod tempor incididunt ut labore et dolore "
          "magna aliqua.",
      glbModelUrl: "assets/models/model.glb")
  ];

  static final List<FurnitureItem> wallFurnitureMock = [
    for (var i = 0; i < 10; i++) FurnitureItem(
      id: (i + 10).toString(),
      name: "Полка Стиль и Мебель Настенная",
      menuImageUrl: "https://ir-2.ozone.ru/s3/multimedia-n/wc1000/6674003087.jpg",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing "
          "elit, sed do eiusmod tempor incididunt ut labore et dolore "
          "magna aliqua.",
      glbModelUrl: "assets/models/model.glb")
  ];

  static final List<FurnitureItem> ceilingFurnitureMock = [
    for (var i = 0; i < 10; i++) FurnitureItem(
      id: (i + 20).toString(),
      name: "Люстра подвесная ST-Luce",
      menuImageUrl: "https://ir-2.ozone.ru/s3/multimedia-7/wc1000/6123436915.jpg",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing "
          "elit, sed do eiusmod tempor incididunt ut labore et dolore "
          "magna aliqua.",
      glbModelUrl: "assets/models/model.glb")
  ];
}
