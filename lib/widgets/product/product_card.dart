import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:myapp/providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final wishlist = Provider.of<WishlistProvider>(context);

    return GestureDetector(
      onTap: () {
        context.go('/products/detail', extra: product);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: 'product-image-${product.id}',
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              wishlist.toggleFavorite(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(wishlist.isFavorite(product)
                                      ? 'Added to wishlist'
                                      : 'Removed from wishlist'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            icon: Icon(
                              wishlist.isFavorite(product) ? Icons.favorite : Icons.favorite_border,
                              color: wishlist.isFavorite(product) ? Colors.red : Theme.of(context).colorScheme.secondary,
                            ),
                            tooltip: 'Add to wishlist',
                            splashRadius: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              cart.addItem(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Added to cart'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add_shopping_cart),
                            tooltip: 'Add to cart',
                            splashRadius: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
