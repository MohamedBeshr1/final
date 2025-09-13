import 'package:flutter/material.dart';
import '../categories/beauty.dart';
import '../categories/Kids.dart';
import '../categories/Mens.dart';
import '../categories/Womens.dart';
import '../categories/more_page.dart';

class CategoryAvatars extends StatefulWidget {
  const CategoryAvatars({super.key});

  @override
  State<CategoryAvatars> createState() => _CategoryAvatarsState();
}

class _CategoryAvatarsState extends State<CategoryAvatars> {
  int selectedIndex = -1;

  final categories = [
    {
      "image": "assets/images/Ellipse 4 (2).png",
      "label": "Beauty",
      "page": const BeautyPage(),
    },
    {
      "image": "assets/images/unsplash__3Q3tsJ01nc (2).png",
      "label": "Fashion",
      "page": const FashionPage(),
    },
    {
      "image": "assets/images/unsplash_GCDjllzoKLo (2).png",
      "label": "Kids",
      "page": const KidsPage(),
    },
    {
      "image": "assets/images/unsplash_xPJYL0l5Ii8.png",
      "label": "Mens",
      "page": const MensPage(),
    },
    {
      "image": "assets/images/unsplash_OYYE4g-I5ZQ.png",
      "label": "Womens",
      "page": const WomensPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.asMap().entries.map((entry) {
        int index = entry.key;
        var category = entry.value;
        final image = category["image"] as String;
        final label = category["label"] as String;
        final page = category["page"] as Widget;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  image,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == index ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
