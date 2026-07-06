import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: const FoodMenuPage(),
    );
  }
}

// Model class for a food item
class FoodItem {
  final String name;
  final String price;
  final IconData icon;
  bool isFavorite;

  FoodItem({
    required this.name,
    required this.price,
    required this.icon,
    this.isFavorite = false,
  });
}

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  // List of at least 8 food items
  final List<FoodItem> foodItems = [
    FoodItem(name: 'Burger', price: '4.50', icon: Icons.lunch_dining),
    FoodItem(name: 'Pizza', price: '8.00', icon: Icons.local_pizza),
    FoodItem(name: 'Fried Rice', price: '3.75', icon: Icons.rice_bowl),
    FoodItem(name: 'Sushi', price: '9.20', icon: Icons.set_meal),
    FoodItem(name: 'Ice Cream', price: '2.50', icon: Icons.icecream),
    FoodItem(name: 'Hot Dog', price: '3.00', icon: Icons.fastfood),
    FoodItem(name: 'Coffee', price: '2.00', icon: Icons.coffee),
    FoodItem(name: 'Salad', price: '5.50', icon: Icons.eco),
    FoodItem(name: 'Noodles', price: '4.00', icon: Icons.ramen_dining),
    FoodItem(name: 'Cake', price: '3.50', icon: Icons.cake),
  ];

  // Toggle favorite state when heart icon is tapped
  void toggleFavorite(int index) {
    setState(() {
      foodItems[index].isFavorite = !foodItems[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F2),
      body: CustomScrollView(
        slivers: [
          // Gradient, rounded, collapsible header
          SliverAppBar(
            expandedHeight: 140,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.deepOrange,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              title: const Text(
                'Food Menu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFF7A45),
                      Color(0xFFFF9D4D),
                      Color(0xFFFFC15E),
                    ],
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12, bottom: 8),
                    child: Icon(
                      Icons.restaurant_menu,
                      size: 64,
                      color: Colors.white24,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Food list
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(14, 16, 14, 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final item = foodItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      child: Row(
                        children: [
                          // Icon avatar with gradient background
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.orange[300]!,
                                  Colors.deepOrange[400]!,
                                ],
                              ),
                            ),
                            child: Icon(
                              item.icon,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 14),

                          // Name and price
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.orange[50],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '\$${item.price}',
                                    style: TextStyle(
                                      color: Colors.deepOrange[700],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Animated favorite button
                          IconButton(
                            onPressed: () => toggleFavorite(index),
                            icon: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, animation) =>
                                  ScaleTransition(
                                      scale: animation, child: child),
                              child: Icon(
                                item.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                key: ValueKey(item.isFavorite),
                                color: item.isFavorite
                                    ? Colors.red
                                    : Colors.grey[400],
                                size: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: foodItems.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}