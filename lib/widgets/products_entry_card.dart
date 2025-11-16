import 'package:flutter/material.dart';
import 'package:the_12th_kit/models/products_entry.dart';

class ProductsEntryCard extends StatelessWidget {
  final ProductsEntry product;
  final VoidCallback onTap;

  const ProductsEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: cs.primary.withOpacity(0.15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, e, s) => Container(
                      height: 160,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Name
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 4),

                // Category
                Text(
                  _formatCategory(product.category),
                  style: TextStyle(
                    fontSize: 14,
                    color: cs.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                // Price
                Text(
                  "Rp ${product.price.toString()}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                // Description preview
                Text(
                  product.description.length > 100
                      ? "${product.description.substring(0, 100)}..."
                      : product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),

                // Featured tag
                if (product.isFeatured)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade600,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "FEATURED",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),

                const SizedBox(height: 10),

                // Extra Info
                Row(
                  children: [
                    Icon(Icons.checkroom, size: 16, color: cs.primary),
                    const SizedBox(width: 5),
                    Text(product.brand.isEmpty ? "Unknown Brand" : product.brand),

                    const SizedBox(width: 20),

                    Icon(Icons.shield_outlined, size: 16, color: cs.primary),
                    const SizedBox(width: 5),
                    Text(product.team.isEmpty ? "-" : product.team),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(Icons.sports_soccer, size: 16, color: cs.primary),
                    const SizedBox(width: 5),
                    Text(product.league.isEmpty ? "-" : product.league),

                    const SizedBox(width: 20),

                    Icon(Icons.calendar_today, size: 16, color: cs.primary),
                    const SizedBox(width: 5),
                    Text(product.season.isEmpty ? "-" : product.season),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  "Stock: ${product.stock}",
                  style: TextStyle(
                    color: product.stock > 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper untuk kategori agar lebih readable
  String _formatCategory(String value) {
    return value
        .replaceAll("_", " ")
        .split(" ")
        .map((w) => w[0].toUpperCase() + w.substring(1))
        .join(" ");
  }
}
