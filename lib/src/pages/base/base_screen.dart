import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/base/cart/cart_tab.dart';
import 'package:greengrocer/src/pages/base/home/home_tab.dart';
import 'package:greengrocer/src/pages/base/orders/orders_tab.dart';
import 'package:greengrocer/src/pages/base/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final controllerPage = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controllerPage,
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: _navBarBottom(),
    );
  }

  _navBarBottom() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            controllerPage.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Carrinho'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Perfil'),
        ]);
  }
}
