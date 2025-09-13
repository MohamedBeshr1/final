import 'package:flutter/material.dart';
import 'order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order No. ${order.id}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  order.status,
                  style: TextStyle(
                    color: order.status == "Active"
                        ? Colors.green
                        : const Color(0xFFF83758),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text("25 Nov, 02:30 pm", style: TextStyle(color: Colors.grey)),

            const Divider(height: 30),

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(order.image, width: 60, height: 60, fit: BoxFit.cover),
                ),
                title: Text(order.title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${order.quantity} item(s)"),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("\$${order.price}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text("Total: \$${order.price}",
                        style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Column(
              children: [
                _summaryRow("Subtotal", "\$${order.price}"),
                _summaryRow("Tax and Fees", "\$3.00"),
                _summaryRow("Delivery Fee", "\$2.00"),
                const Divider(),
                _summaryRow("Order Total", "\$${int.parse(order.price) + 5}",
                    isBold: true),
              ],
            ),

            const SizedBox(height: 30),

            if (order.status == "Active")
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        //..............................
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF83758),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text("Cancel Order",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        //00000000000000000
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF83758),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text("Track Driver",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
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
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
