import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  // Daftar produk sebagai contoh dengan nama, harga, gambar, dan jumlah terjual
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

  // Fungsi untuk memuat gambar produk
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
      appBar: AppBar(
        title: Text('Produk'),
        backgroundColor: Color(0xFFc3e56c),
      ),
      body: GridView.builder(
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
    );
  }
}
