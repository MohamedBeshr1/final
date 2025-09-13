import 'package:e_commerce/core/utils/ProductCard.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/features/home/widgets/category_avatars.dart';
import 'package:e_commerce/features/home/widgets/custom_bottom_nav.dart';
import 'package:e_commerce/features/onboarding/searchPage.dart';
import 'package:e_commerce/features/onboarding/views/cart_screen.dart';
import 'package:e_commerce/features/onboarding/views/itemspage.dart';
import 'package:e_commerce/features/onboarding/views/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
    static String id = 'HomeScreen page';



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>  const Itemspage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>  ProfileScreen()),
        );
        break;
    }
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

            // Search
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchPage()),
                  );
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search any Product",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "All Featured",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),
            const CategoryAvatars(),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              height: 189,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/Rectangle 48.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "50-40% OFF",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Now in (product)\nAll colours",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Shop Now",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Recommended",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 380,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ProductCard(
                    image: "assets/images/unsplash_0vsk2_9dkqo.png",
                    title: "Mens Starry",
                    description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                    price: "₹399",
                    rating: 4,
                    reviews: 152344,
                  ),
                  SizedBox(width: 5),
                  ProductCard(
                    image: "assets/images/unsplash_0vsk2_9dkqo.png",
                    title: "Mens Starry",
                    description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                    price: "₹399",
                    rating: 4,
                    reviews: 152344,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),);
          
        },
        child: Image.asset(
          "assets/icons/Iconly Pro.png",
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
