import 'package:e_commerce/features/Auth/data/Model/views/order_model.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final bool showActions;

  const OrderCard({
    super.key,
    required this.order,
    this.showActions = false,
  });

  String _statusText() {
    switch (order.status) {
      case "Completed":
        return "Order delivered";
      case "Cancelled":
        return "Order Canceled";
      default:
        return ""; 
    }
  }

  Color _statusColor() {
    switch (order.status) {
      case "Completed":
        return const Color(0xFFF83758);
      case "Cancelled":
        return const Color(0xFFF83758);
      default:
        return Colors.transparent; // Active مش هيظهر حاجة
    }
  }

  IconData _statusIcon() {
    switch (order.status) {
      case "Completed":
        return Icons.check;
      case "Cancelled":
        return Icons.close;
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                order.image,
                width: 90,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(order.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      Text("\$${order.price}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order ID: ${order.id}",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12)),
                      Text("${order.quantity} item(s)",
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  if (order.status != "Active")
                    Row(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: _statusColor(),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _statusIcon(),
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _statusText(),
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                  if (showActions) ...[
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF83758),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Cancel",
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF83758),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Track Order",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
