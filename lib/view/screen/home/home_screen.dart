import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../History/history_screen.dart';
import '../Payment/payment_screen.dart';
import '../Product/product_list_screen.dart';
import '../favorite/favorite_screen.dart';
import '../profile/profile_screen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});
  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}
class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    ProductListScreen(),
    FavoriteScreen(),
    PaymentScreen(),
    HistoryScreen(),
    ProfileScreen(),
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
            backgroundColor: AppColor.backgroundColorSp,
            icon: Icon(Icons.home, color: AppColor.texCilor),
            label: 'Home,',
          ),
          BottomNavigationBarItem(backgroundColor: AppColor.backgroundColorSp,
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(backgroundColor: AppColor.backgroundColorSp,
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
          BottomNavigationBarItem(backgroundColor: AppColor.backgroundColorSp,
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(backgroundColor: AppColor.backgroundColorSp,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
