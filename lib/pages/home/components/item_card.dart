import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/models/furniture_item.dart';

class ItemCard extends StatelessWidget {
  final FurnitureItem cardInfo;
  final VoidCallback press;
  const ItemCard({
    required this.cardInfo,
    required this.press,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(kCircularRadius),
            child: Image.network(cardInfo.menuImageUrl), // mock
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                cardInfo.name,
                style: const TextStyle(color: kTextColor),
                softWrap: true,
                overflow: TextOverflow.ellipsis, // если текст слишком длинный, то появится многоточие в конце
                maxLines: 2,  // максимальное количество строк 2
                textScaleFactor: MediaQuery.of(context).textScaleFactor, // учитываем масштабирование текста устройства
              ),
            ),
          ),
        ],
      ),
    );
  }
}
