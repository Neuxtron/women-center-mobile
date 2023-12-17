import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  MyBottomNavigationBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Artikel',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_outlined),
          label: 'Karir',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_alt),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      iconSize: 24,
      onTap: onItemTapped,
    );
  }
}