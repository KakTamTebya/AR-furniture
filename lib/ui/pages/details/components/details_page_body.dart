import 'package:ar_furniture/routes/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/models/furniture_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_furniture/blocs/details_page/details_page_bloc.dart';
import 'package:ar_furniture/generated/l10n.dart';
import 'scroll_item.dart';
import 'package:readmore/readmore.dart';
import 'page_view_indicator.dart';
import 'package:ar_furniture/ui/reused_widgets/text_elevated_button.dart';

class DetailsPageBody extends StatefulWidget {
  final FurnitureItem furnitureItem;
  final PageController pageController = PageController(viewportFraction: 1);

  DetailsPageBody({
    required this.furnitureItem,
    super.key
  });

  @override
  State<DetailsPageBody> createState() => _DetailsPageBodyState();
}

class _DetailsPageBodyState extends State<DetailsPageBody> {
  var _currentPageIndex = 0;

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: totalSize.height * 0.5,
              child: PageView.builder(
                controller: widget.pageController,
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
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultCircularRadius / 2),
              ),
              child: ReadMoreText(
                widget.furnitureItem.description,
                trimLines: 5,
                trimMode: TrimMode.Line,
                moreStyle: TextStyle(color: theme.primaryColor),
                lessStyle: TextStyle(color: theme.primaryColor),
                trimCollapsedText: S.of(context).showMore,
                trimExpandedText: "",
                style: const TextStyle(
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(horizontal: 15)
                .copyWith(bottom: 12),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 4,
                    child: TextElevatedButton(
                      function: () => {},
                      text: S.of(context).viewInAR,
                      fontSize: 16,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: TextElevatedButton(
                      function: () => context.router.push(ModelRoute(
                          modelUrl: widget.furnitureItem.glbModelUrl)),
                      text: S.of(context).view3dModel,
                      fontSize: 16,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: BlocBuilder<DetailsPageBloc, DetailsPageState>(
                        builder: (context, state) {
                          final bloc = BlocProvider.of<DetailsPageBloc>(context);
                          var favouriteIconColor = const Color(0xFF808080);
                          if (state is DetailsPageLoaded) {
                            if (state.isFavourite) {
                              favouriteIconColor = Colors.red;
                            }
                          }
                          return IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            icon: const Icon(
                              Icons.favorite,
                            ),
                            color: favouriteIconColor,
                            onPressed: () => {
                              bloc.add(favouriteIconColor == Colors.red
                                ? RemoveFavourite()
                                : AddFavourite())
                            }, //
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
