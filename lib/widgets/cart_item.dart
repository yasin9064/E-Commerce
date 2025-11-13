import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItem({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            product.image,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          title: Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  cart.removeItem(product);
                },
              ),
              Text(quantity.toString()),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  cart.addItem(product);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
