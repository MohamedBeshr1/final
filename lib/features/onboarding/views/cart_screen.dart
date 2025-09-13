import 'package:e_commerce/features/onboarding/views/checkout_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "title": "Women's Casual Wear",
      "price": 34.0,
      "oldPrice": 64.0,
      "image": "assets/images/image 15.png",
      "rating": 4.8,
      "quantity": 1,
    },
    {
      "title": "Men's Jacket",
      "price": 45.0,
      "oldPrice": 67.0,
      "image": "assets/images/image 15 (1).png",
      "rating": 4.7,
      "quantity": 1,
    }
  ];

  double get subtotal {
    return cartItems.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"]));
  }

  double tax = 3.0;
  double delivery = 2.0;

  @override
  Widget build(BuildContext context) {
    double total = subtotal + tax + delivery;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const Text(
                  "Shopping List",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                ...cartItems.map((item) => _buildCartItem(item)),

                const SizedBox(height: 20),

                _summaryRow("Subtotal", "\$${subtotal.toStringAsFixed(2)}"),
                _summaryRow("Tax and Fees", "\$${tax.toStringAsFixed(2)}"),
                _summaryRow("Delivery Fee", "\$${delivery.toStringAsFixed(2)}"),
                const Divider(),
                _summaryRow("Order Total", "\$${total.toStringAsFixed(2)}",
                    isBold: true, valueColor: Colors.red),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
  onPressed: () {
   
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CheckoutScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFF83758),
    padding: const EdgeInsets.symmetric(vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: const Text(
    "Checkout",
    style: TextStyle(fontSize: 16, color: Colors.white),
  ),
            )
       ) ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item["image"],
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item["title"],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              size: 14, color: Colors.orange),
                          const SizedBox(width: 4),
                          Text("${item["rating"]}",
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text("\$${item["price"]}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          const SizedBox(width: 8),
                          Text("\$${item["oldPrice"]}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                    ],
                  ),
                ),

                //  + / -
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline,
                          color: Color(0xFFF83758)),
                      onPressed: () {
                        setState(() {
                          if (item["quantity"] > 1) {
                            item["quantity"]--;
                          }
                        });
                      },
                    ),
                    Text("${item["quantity"]}",
                        style: const TextStyle(fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline,
                          color: Color(0xFFF83758)),
                      onPressed: () {
                        setState(() {
                          item["quantity"]++;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Order (${item["quantity"]}) :",
                    style: const TextStyle(color: Colors.grey)),
                Text(
                    "\$${(item["price"] * item["quantity"]).toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value,
      {bool isBold = false, Color valueColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontSize: 14,
                  color: valueColor,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}