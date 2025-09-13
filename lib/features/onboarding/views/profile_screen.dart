import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/features/Auth/views/signin_view.dart';
import 'package:e_commerce/features/home/widgets/custom_bottom_nav.dart';
import 'package:e_commerce/features/onboarding/views/cart_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFFF8375),
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/icons/2289_SkVNQSBGQU1PIDEwMjgtMTE2 2.png",
                  ), 
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'User full Name',
            style: TextStyle(
              fontSize: 20,
              color: Color(0XFFF83758),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: NavigatorScreen(
              onItemTapped: (title) {
                print('Tapped: $title');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Divider(color: Color(0xFFFF8375), thickness: 1),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Image.asset(
              'assets/icons/Logout - Iconly Pro.png',
              width: 24,
              height: 24,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.logout);
              },
            ),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 2, onTap: (index) {}),
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
          color: Colors.white,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.shopping_bag, color: Colors.white);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
