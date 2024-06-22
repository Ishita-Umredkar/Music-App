import 'package:flutter/material.dart';
import 'package:untitled3/screens/home.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final Tabs = [Home()];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentIndex) {
          currentTabIndex = currentIndex;
        },
        selectedLabelStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.grey[850],
        // fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music_sharp, color: Colors.white),
              label: 'Your Library'),
        ],
      ),
    );
  }
}
