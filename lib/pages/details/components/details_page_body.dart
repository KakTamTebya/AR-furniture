import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/models/furniture_item.dart';
import 'scroll_item.dart';
import 'package:readmore/readmore.dart';
import 'page_view_indicator.dart';

class DetailsPageBody extends StatefulWidget {
  final FurnitureItem furnitureItem;

  const DetailsPageBody({required this.furnitureItem, super.key});

  @override
  State<DetailsPageBody> createState() => _DetailsPageBodyState();
}

class _DetailsPageBodyState extends State<DetailsPageBody> {
  var _currentPageIndex = 0;

  PageController pageController = PageController(viewportFraction: 0.9);

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var totalSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: totalSize.height * 0.5,
              child: PageView.builder(
                controller: pageController,
                itemCount: widget.furnitureItem.imageUrls.length,
                itemBuilder: (context, index) =>
                    ScrollItem(imageUrl: widget.furnitureItem.imageUrls[index]),
                onPageChanged: _onPageChanged,
              )),
          if (widget.furnitureItem.imageUrls.length > 1)
            PageViewIndicator(
                pagesCount: widget.furnitureItem.imageUrls.length,
                currentPageIndex: _currentPageIndex),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 12, horizontal: totalSize.width * 0.05 + 10),
            child: ReadMoreText(
              widget.furnitureItem.description,
              trimLines: 5,
              trimMode: TrimMode.Line,
              moreStyle: const TextStyle(color: kBottomNavBarColor),
              lessStyle: const TextStyle(color: kBottomNavBarColor),
              trimCollapsedText: "далее",
              trimExpandedText: "свернуть",
              style: const TextStyle(
                  color: kTextColor,
                  height: 1.5,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              onPressed: () {}, //TODO
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(Size(
                    totalSize.width * 0.9,
                    totalSize.height * 0.1,
                  ))),
              child: const Text(
                "Посмотреть в AR",
                style: TextStyle(color: kBottomNavBarColor, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
