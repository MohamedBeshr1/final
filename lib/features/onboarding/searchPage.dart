import 'package:flutter/material.dart';
import 'package:e_commerce/core/utils/ProductCard.dart';

/// 🟢 موديل للمنتجات
class Product {
  final String image;
  final String title;
  final String description;
  final String price;
  final double rating;
  final int reviews;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Product> _allProducts = [
    Product(
      image: "assets/images/unsplash_0vsk2_9dkqo.png",
      title: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
      price: "₹399",
      rating: 4,
      reviews: 152344,
    ),
    Product(
      image: "assets/images/unsplash_0vsk2_9dkqo.png",
      title: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
      price: "₹799",
      rating: 5,
      reviews: 9000,
    ),
   
  ];

  late List<Product> _filteredProducts;

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts; 
  }

  void _searchProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = _allProducts;
      } else {
        _filteredProducts = _allProducts.where((product) {
          final q = query.toLowerCase();
          return product.title.toLowerCase().contains(q) ||
              product.description.toLowerCase().contains(q) ||
              product.price.toLowerCase().contains(q);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search"),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: _searchProducts,
              decoration: InputDecoration(
                hintText: "Search any Product...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "${_filteredProducts.length} Items",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: _filteredProducts.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = _filteredProducts[index];
                        return ProductCard(
                          image: product.image,
                          title: product.title,
                          description: product.description,
                          price: product.price,
                          rating: product.rating,
                          reviews: product.reviews,
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "No products found",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
