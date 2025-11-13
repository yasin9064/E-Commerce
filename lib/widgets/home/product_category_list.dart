import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

class ProductCategoryList extends StatelessWidget {
  final List<Category> categories = [
    Category(name: 'Electronics', icon: Icons.phone_android),
    Category(name: 'Fashion', icon: Icons.checkroom),
    Category(name: 'Home', icon: Icons.home_work),
    Category(name: 'Sports', icon: Icons.sports_soccer),
  ];

  ProductCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(categories[index].icon, size: 30),
                ),
                const SizedBox(height: 8),
                Text(categories[index].name),
              ],
            ),
          );
        },
      ),
    );
  }
}
