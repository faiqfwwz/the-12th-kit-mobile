import 'package:flutter/material.dart';
import 'package:the_12th_kit/models/products_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductsEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // THUMBNAIL
            if (product.thumbnail.isNotEmpty)
              Image.network(
                "https://ahmad-faiq41-the12thkit.pbp.cs.ui.ac.id/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}",
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, e, s) => Container(
                  height: 280,
                  color: cs.surfaceVariant,
                  child: Icon(Icons.broken_image, size: 60, color: cs.onSurfaceVariant),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // FEATURED BADGE
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: cs.secondary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "FEATURED PRODUCT",
                        style: TextStyle(
                          color: cs.onSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  const SizedBox(height: 16),

                  // NAME
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // PRICE
                  Text(
                    "Rp ${product.price}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: cs.primary,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // CATEGORY CHIP
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: cs.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _formatCategory(product.category),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: cs.onSecondaryContainer,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // PRODUCT META 
                  _buildMeta("Brand", product.brand),
                  _buildMeta("Team", product.team),
                  _buildMeta("League", product.league),
                  _buildMeta("Season", product.season),
                  _buildMeta("Stock", product.stock.toString()),

                  const SizedBox(height: 24),
                  const Divider(),

                  // DESCRIPTION 
                  const SizedBox(height: 12),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: cs.onSurface.withOpacity(0.85),
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeta(String label, String value) {
    if (value.isEmpty) value = "-";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label:",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  String _formatCategory(String cat) {
    return cat
        .replaceAll("_", " ")
        .split(" ")
        .map((w) => w[0].toUpperCase() + w.substring(1))
        .join(" ");
  }
}
