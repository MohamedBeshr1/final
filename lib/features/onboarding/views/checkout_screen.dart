import 'package:e_commerce/features/onboarding/views/home_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController addressController = TextEditingController();

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
        title: const Text("Checkout"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.black54),
                    SizedBox(width: 6),
                    Text(
                      "Delivery Address",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                controller: addressController,
                                decoration: const InputDecoration(
                                  hintText: "Type address here or pick from map",
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF83758),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                          ),
                          child: const Icon(Icons.location_pin,
                              color: Colors.white, size: 28),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Shopping List",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ...cartItems.map((item) => _buildCartItem(item)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showPlaceOrderPopup(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF83758),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Place Order",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
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
                Text("x${item["quantity"]}"),
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

  void _showPlaceOrderPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: const Color(0xFFF83758),
        content: const SizedBox(
          width: 250, 
          height: 100, 
          child: Center(
            child: Text(
              "Order placed successfully!",
              style: TextStyle(
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
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()), 
              );
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
}