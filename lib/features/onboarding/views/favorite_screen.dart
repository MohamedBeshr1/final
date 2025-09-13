import 'package:e_commerce/core/utils/ProductCard.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<bool> isFavoriteList = [true, true, true]; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Favorites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2, 
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.65, 
          children: [
            Stack(
              children: [
                const ProductCard(
                      image: "assets/images/unsplash_0vsk2_9dkqo.png",
                      title: "Mens Starry",
                      description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                      price: "₹399",
                      rating: 4,
                      reviews: 152344,
                    ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isFavoriteList[0] ? Icons.favorite : Icons.favorite_border,
                      color: isFavoriteList[0] ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavoriteList[0] = !isFavoriteList[0]; 
                      });
                    },
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                const ProductCard(
                      image: "assets/images/unsplash_0vsk2_9dkqo.png",
                      title: "Mens Starry",
                      description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                      price: "₹399",
                      rating: 4,
                      reviews: 152344,
                    ),
              ]
            ),
            Stack(
              children: [
                const ProductCard(
                      image: "assets/images/unsplash_0vsk2_9dkqo.png",
                      title: "Mens Starry",
                      description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                      price: "₹399",
                      rating: 4,
                      reviews: 152344,
                    ),

                
              ],
            ),
             Stack(
              children: [
                const ProductCard(
                      image: "assets/images/unsplash_0vsk2_9dkqo.png",
                      title: "Mens Starry",
                      description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                      price: "₹399",
                      rating: 4,
                      reviews: 152344,
                    ),

                
              ],
            ),
          ],
        ),
      ),
    );
  }
}