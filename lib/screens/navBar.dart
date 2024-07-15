import 'package:flutter/material.dart';
import 'package:flutter_practise_1/HomeScreens/page1.dart';
import 'package:flutter_practise_1/screens/downloads.dart';
import 'package:flutter_practise_1/screens/menu.dart';
import 'package:flutter_practise_1/screens/search.dart';
import 'package:flutter_practise_1/screens/watchlist.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Page1(),
    const SearchPage(),
    const WatchListPage(),
    const DownloadsPage(),
    const MenuPage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        currentIndex: _currentIndex,
        onTap: _onTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              label: 'WatchList',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
              backgroundColor: Colors.black),
        ],
      ),
    );
  }
}

// This removes the back button
