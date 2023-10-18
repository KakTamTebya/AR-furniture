import 'package:flutter/material.dart';
import 'package:ar_furniture/custom_icons/page_icons.dart';
import 'components/page_body.dart';
import 'package:ar_furniture/mocks/floor_furniture_mock.dart';
import 'package:ar_furniture/mocks/ceiling_furniture_mock.dart';
import 'package:ar_furniture/mocks/wall_furniture_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  var _currentPageIndex = 0;

  final _pages = [
    PageBody(
        items: floorFurnitureMock,
        key: const PageStorageKey("floor")),
    PageBody(
        items: ceilingFurnitureMock,
        key: const PageStorageKey("ceiling")),
    PageBody(
        items: wallFurnitureMock,
        key: const PageStorageKey("wall"))
  ]; // mock

  void _onTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF535353),
        currentIndex: _currentPageIndex,
        onTap: _onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: "FloorPlaced",
              icon: Icon(PageIcons.armchair)),
          BottomNavigationBarItem(
              label: "CeilingPlaced",
              icon: Icon(PageIcons.chandelier)),
          BottomNavigationBarItem(
              label: "WallPlaced",
              icon: Icon(PageIcons.book_shelf)),
        ],
      ),
    );
  }
}
