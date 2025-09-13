class OrderModel {
  final String id;
  final String title;
  final String price;
  final String status; 
  final String image;
  final int quantity;

  OrderModel({
    required this.id,
    required this.title,
    required this.price,
    required this.status,
    required this.image,
    required this.quantity,
  });
}
