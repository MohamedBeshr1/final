import 'package:e_commerce/core/utils/ProductCard.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/features/home/widgets/category_avatars.dart';
import 'package:e_commerce/features/home/widgets/custom_bottom_nav.dart';
import 'package:e_commerce/features/onboarding/views/ProductDetails.dart';
import 'package:e_commerce/features/onboarding/views/cart_screen.dart';
import 'package:flutter/material.dart';

class Itemspage extends StatefulWidget {
  const Itemspage({super.key});

  @override
  State<Itemspage> createState() => _ItemspageState();
}

class _ItemspageState extends State<Itemspage> {
  int _selectedIndex = 0;
  List<bool> isFavoriteList = [false, false, false, false]; 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            "assets/images/logoipsum-255 1 (2).png",
            height: 40,
            width: 125,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "All Featured",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),
            const CategoryAvatars(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Recommended",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            
            GridView.count(
              crossAxisCount: 2, 
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(), 
              mainAxisSpacing: 10, 
              crossAxisSpacing: 10,
              childAspectRatio: 0.65, 
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          image: "assets/images/unsplash_0vsk2_9dkqo.png",
                          title: "Mens Starry",
                          description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                          price: "₹399",
                          rating: 4,
                          reviews: 152344,
                        ),
                      ),
                    );
                  },
                  child: Stack(
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
                            color: isFavoriteList[0] ? AppColor.primaryColor : Colors.grey,
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
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          image: "assets/images/unsplash_0vsk2_9dkqo.png",
                          title: "Mens Starry",
                          description: "Vision Alta Mens Shoes Size (All Colours) Mens\n Starry Sky Printed Shirt 100% Cotton Fabric",
                          price: "₹399",
                          rating: 4,
                          reviews: 500,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      const ProductCard(
                        image: "assets/images/unsplash_0vsk2_9dkqo.png",
                        title: "Mens Starry",
                        description: " Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
                        price: "₹399",
                        rating: 4,
                        reviews: 500,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: Icon(
                            isFavoriteList[1] ? Icons.favorite : Icons.favorite_border,
                            color: isFavoriteList[1] ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavoriteList[1] = !isFavoriteList[1];
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          image: "assets/images/unsplash_0vsk2_9dkqo.png",
                          title: "Mens Starry",
                          description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
                          price: "₹399",
                          rating: 3,
                          reviews: 800,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      const ProductCard(
                        image: "assets/images/unsplash_0vsk2_9dkqo.png",
                        title: "Mens Starry",
                        description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
                        price: "₹399",
                        rating: 3,
                        reviews: 800,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: Icon(
                            isFavoriteList[2] ? Icons.favorite : Icons.favorite_border,
                            color: isFavoriteList[2] ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavoriteList[2] = !isFavoriteList[2]; 
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          image: "assets/images/unsplash_0vsk2_9dkqo.png",
                          title: "Printed T-Shirt",
                          description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
                          price: "₹399",
                          rating: 4,
                          reviews: 2000,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      const ProductCard(
                        image: "assets/images/unsplash_0vsk2_9dkqo.png",
                        title: "Printed T-Shirt",
                        description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
                        price: "₹399",
                        rating: 4,
                        reviews: 2000,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: Icon(
                            isFavoriteList[3] ? Icons.favorite : Icons.favorite_border,
                            color: isFavoriteList[3] ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavoriteList[3] = !isFavoriteList[3]; 
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        child: Image.asset(
          "assets/icons/Iconly Pro.png",
          width: 24,
          height: 24,
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}