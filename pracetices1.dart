import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFF5EFE6),
        fontFamily: 'Roboto',
      ),
      home: const CoffeeShopHome(),
    );
  }
}

class CoffeeShopHome extends StatelessWidget {
  const CoffeeShopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coffee Shop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Coffee Icon
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.brown[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.coffee,
                        size: 60,
                        color: Colors.brown[700],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Coffee Name
                    const Text(
                      'Cappuccino',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Price
                    Text(
                      'Price: \$4.50',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.brown[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Size
                    const Text(
                      'Size: Large',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Star Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                            (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Order Now Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order placed! ☕'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[700],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Order Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}