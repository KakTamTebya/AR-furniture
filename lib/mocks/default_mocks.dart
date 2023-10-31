import 'package:ar_furniture/models/furniture_item.dart';

List<FurnitureItem> defaultFloorMock = [
  for (var i = 0; i < 10; i++) FurnitureItem(
      name: "Стол TetChair обеденный BOSCO",
      menuImageUrl: "https://ir-2.ozone.ru/s3/multimedia-x/wc1000/6305988369.jpg")
];

List<FurnitureItem> defaultCeilingMock = [
  for (var i = 0; i < 10; i++) FurnitureItem(
      name: "Люстра подвесная ST-Luce",
      menuImageUrl: "https://ir-2.ozone.ru/s3/multimedia-7/wc1000/6123436915.jpg")
];

List<FurnitureItem> defaultWallMock = [
  for (var i = 0; i < 10; i++) FurnitureItem(
      name: "Полка Стиль и Мебель Настенная",
      menuImageUrl: "https://ir-2.ozone.ru/s3/multimedia-n/wc1000/6674003087.jpg")
];
