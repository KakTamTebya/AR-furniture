import 'package:flutter/material.dart';
import 'package:ar_furniture/custom_icons/page_icons.dart';
import 'components/home_page_body.dart';
import 'package:ar_furniture/constants.dart';
import 'package:ar_furniture/mocks/default_mocks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var _currentPageIndex = 0;

  final _pages = [
    HomePageBody(
      items: defaultFloorMock,
      gridViewKey: "floor"),
    HomePageBody(
      items: defaultCeilingMock,
      gridViewKey: "ceiling"),
    HomePageBody(
      items: defaultWallMock,
      gridViewKey: "wall"),
  ];

  void _onTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kBottomNavBarColor,
        currentIndex: _currentPageIndex,
        onTap: _onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: "FloorPlaced", icon: Icon(PageIcons.armchair)),
          BottomNavigationBarItem(
              label: "CeilingPlaced", icon: Icon(PageIcons.chandelier)),
          BottomNavigationBarItem(
              label: "WallPlaced", icon: Icon(PageIcons.book_shelf)),
        ],
      ),
    );
  }
}
