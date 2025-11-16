import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:the_12th_kit/models/products_entry.dart';
import 'package:the_12th_kit/widgets/left_drawer.dart';
import 'package:the_12th_kit/widgets/products_entry_card.dart';
import 'package:the_12th_kit/screens/products_detail.dart';

class ProductsEntryListPage extends StatefulWidget {
  const ProductsEntryListPage({super.key});

  @override
  State<ProductsEntryListPage> createState() => _ProductsEntryListPageState();
}

class _ProductsEntryListPageState extends State<ProductsEntryListPage> {
  Future<List<ProductsEntry>> fetchProducts(CookieRequest request) async {
    final response = await request
        .get('https://ahmad-faiq41-the12thkit.pbp.cs.ui.ac.id/json/');

    List<ProductsEntry> products = [];
    for (var d in response) {
      if (d != null) {
        products.add(ProductsEntry.fromJson(d));
      }
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                'Belum ada produk sama sekali.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final allProducts = snapshot.data as List<ProductsEntry>;

          final dynamic rawUserId = request.jsonData['user_id'];

          final int currentUserId = rawUserId is int
              ? rawUserId
              : int.tryParse(rawUserId.toString()) ?? -1;

          final userProducts =
              allProducts.where((p) => p.userId == currentUserId).toList();

          if (userProducts.isEmpty) {
            return const Center(
              child: Text(
                'Kamu belum punya produk terdaftar.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: userProducts.length,
            itemBuilder: (_, index) {
              final product = userProducts[index];
              return ProductsEntryCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
