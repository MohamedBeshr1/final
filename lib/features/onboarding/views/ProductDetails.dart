import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final int rating;
  final int reviews;

  const ProductDetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  bool isFavorite = false;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void _showAddToCartPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: AppColor.primaryColor,
        content: SizedBox(
          width: 150, 
          height: 100, 
          child: Center(
            child: Text(
              "Item added to cart successfully!",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = (int.parse(widget.price) * quantity).toString();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Product"),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? AppColor.primaryColor : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Center(
              child: Image.asset(
                widget.image,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(widget.description),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${totalPrice}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.primaryColor),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline,
                          color: Color(0xFFF83758)),
                      onPressed: _decrementQuantity,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline,
                          color: Color(0xFFF83758)),
                      onPressed: _incrementQuantity,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _showAddToCartPopup,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.shopping_cart, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}