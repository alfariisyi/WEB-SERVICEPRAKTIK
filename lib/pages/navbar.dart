import 'package:flutter/material.dart';
import 'product.dart';
import 'home.dart';

class Navbar extends StatefulWidget {
  Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  void _navigationBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [HomePage(), Product()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigationBar,
        backgroundColor: Color(0xFFc3e56c), // Ubah warna latar belakang
        selectedItemColor: Colors.white, // Warna item yang dipilih
        unselectedItemColor: Colors.black, // Warna item yang tidak dipilih
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits), label: 'Product'),
        ],
      ),
    );
  }
}
