import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:the_12th_kit/models/products_entry.dart';
import 'package:the_12th_kit/widgets/left_drawer.dart';
import 'package:the_12th_kit/widgets/products_entry_card.dart';
import 'package:the_12th_kit/screens/products_detail.dart';

class ProductsEntryListAllPage extends StatefulWidget {
  const ProductsEntryListAllPage({super.key});

  @override
  State<ProductsEntryListAllPage> createState() => _ProductsEntryListAllPageState();
}

class _ProductsEntryListAllPageState extends State<ProductsEntryListAllPage> {
  Future<List<ProductsEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get(
      'https://ahmad-faiq41-the12thkit.pbp.cs.ui.ac.id/json/',
    );

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
      appBar: AppBar(title: const Text('All Products')),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada produk sama sekali.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final allProducts = snapshot.data as List<ProductsEntry>;

          return ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (_, index) {
              final product = allProducts[index];
              return ProductsEntryCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
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
