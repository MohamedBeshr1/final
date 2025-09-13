import 'package:flutter/material.dart';
import 'order_card.dart';
import 'order_model.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<OrderModel> orders = [
    OrderModel(
      id: "MS2025243",
      title: "Mens Starry",
      price: "50",
      status: "Active",
      image: "assets/images/unsplash_0vsk2_9dkqo.png",
      quantity: 1,
    ),
    OrderModel(
      id: "MS2025244",
      title: "Mens Starry",
      price: "50",
      status: "Completed",
      image: "assets/images/unsplash_0vsk2_9dkqo.png",
      quantity: 1,
    ),
    OrderModel(
      id: "MS2025245",
      title: "Mens Starry",
      price: "50",
      status: "Cancelled",
      image: "assets/images/unsplash_0vsk2_9dkqo.png",
      quantity: 1,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long,
              size: 100, color: Color(0xFFF83758).withOpacity(0.3)),
          const SizedBox(height: 20),
          Text(
            message,
            style: const TextStyle(color: Color(0xFFF83758), fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeOrders =
        orders.where((order) => order.status == "Active").toList();
    final completedOrders =
        orders.where((order) => order.status == "Completed").toList();
    final cancelledOrders =
        orders.where((order) => order.status == "Cancelled").toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          
            
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
              ),

              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: const Color(0xFFF83758),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: const Color(0xFFF83758),
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                tabs: const [
                  Tab(text: "Active"),
                  Tab(text: "Completed"),
                  Tab(text: "Cancelled"),
                ],
              ),
            ),
          ),
          
        ),
      
      body: TabBarView(
        controller: _tabController,
        children: [
          activeOrders.isEmpty
              ? _buildEmptyState("You don’t have any active orders at this time")
              : ListView.builder(
                  itemCount: activeOrders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(
                      order: activeOrders[index],
                      showActions: true,
                    );
                  },
                ),

          completedOrders.isEmpty
              ? _buildEmptyState("No completed orders yet")
              : ListView.builder(
                  itemCount: completedOrders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(order: completedOrders[index]);
                  },
                ),

          cancelledOrders.isEmpty
              ? _buildEmptyState("No cancelled orders yet")
              : ListView.builder(
                  itemCount: cancelledOrders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(order: cancelledOrders[index]);
                  },
                ),
        ],
      ),
    );
  }
}
