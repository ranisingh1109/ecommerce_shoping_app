import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    // ProductListScreen(),
    // PaymentScreen(),
    // HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColor.backgroundColorSp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment, color: AppColor.backgroundColorSp),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: AppColor.backgroundColorSp),
            label: 'History',
          ),
        ],
      ),
    );
  }
}