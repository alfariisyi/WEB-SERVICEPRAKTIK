import 'package:flutter/material.dart';
import 'package:project/pages/business.dart';
import 'package:project/pages/history.dart';
import 'package:project/pages/shoppingcart.dart';

// Widget untuk halaman utama
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Daftar produk dengan nama, harga, gambar, dan jumlah terjual
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Laptop',
      'price': 200.99,
      'sold': 50, // Jumlah terjual
      'image': 'images/product.jpg',
    },
    {
      'name': 'Laptop',
      'price': 200.99,
      'sold': 50, // Jumlah terjual
      'image': 'images/product.jpg',
    },
    {
      'name': 'Laptop',
      'price': 200.99,
      'sold': 50, // Jumlah terjual
      'image': 'images/product.jpg',
    },
    {
      'name': 'Laptop',
      'price': 200.99,
      'sold': 50, // Jumlah terjual
      'image': 'images/product.jpg',
    },
    {
      'name': 'Laptop',
      'price': 200.99,
      'sold': 50, // Jumlah terjual
      'image': 'images/product.jpg',
    },
    {
      'name': 'Laptop',
      'price': 200.99,
      'sold': 50, // Jumlah terjual
      'image': 'images/product.jpg',
    },
    {
      'name': 'Laptop',
      'price': 200.99,
      'sold': 50, // Jumlah terjual
      'image': 'images/product.jpg',
    },
  ];
  // Fungsi untuk memuat gambar produk dengan penanganan kesalahan
  Widget loadProductImage(String imageUrl) {
    return Image.network(
      imageUrl,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey[200],
          child: Icon(
            Icons.broken_image,
            color: Colors.red,
            size: 50,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Gambar dengan latar belakang
          Container(
            color: const Color(0xFF232325),
            child: Center(
              child: Image.network(
                'images/image1.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Baris tombol untuk History, Shopping Cart, dan Business
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Tombol History
                _buildIconButton(
                  context,
                  Icons.history,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(),
                      ),
                    );
                  },
                ),
                // Tombol Shopping Cart
                _buildIconButton(
                  context,
                  Icons.shopping_cart,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingCartPage(),
                      ),
                    );
                  },
                ),
                // Tombol Business
                _buildIconButton(
                  context,
                  Icons.business,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BusinessPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Menambahkan ruang antar bagian
          // Menampilkan grid produk
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dua item per baris
                childAspectRatio:
                    0.8, // Mengatur rasio aspek untuk penampilan yang lebih baik
                crossAxisSpacing: 10.0, // Jarak antar kolom
                mainAxisSpacing: 10.0, // Jarak antar baris
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      loadProductImage(product['image']),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '\$${product['price'].toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      // Menampilkan jumlah terjual
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Terjual: ${product['sold']}',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membangun tombol ikon
  Widget _buildIconButton(
      BuildContext context, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF232325),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(10.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
