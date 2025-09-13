import 'dart:async';
import 'package:e_commerce/features/Auth/views/Splash/getStarted.dart';
import 'package:flutter/material.dart';

class Startscrean extends StatefulWidget {
  const Startscrean({super.key});

  @override
  State<Startscrean> createState() => _StartscreanState();
}

class _StartscreanState extends State<Startscrean> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/fashion shop-rafiki 1.png",
      "title": "Choose Products",
      "desc":
          '''Amet minim mollit non deserunt ullamco est \nsit aliqua dolor do amet sint. Velit officia \nconsequat duis enim velit mollit.'''
    },
    {
      "image": "assets/images/Sales consulting-pana 1.png",
      "title": "Make Payment",
      "desc":
          '''Amet minim mollit non deserunt ullamco est \nsit aliqua dolor do amet sint. Velit officia \nconsequat duis enim velit mollit.'''
    },
    {
      "image": "assets/images/Shopping bag-rafiki 1.png",
      "title": "Get Your Order",
      "desc":
          '''Amet minim mollit non deserunt ullamco est \nsit aliqua dolor do amet sint. Velit officia \nconsequat duis enim velit mollit.'''
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < onboardingData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (_currentPage < onboardingData.length - 1)
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GetStartedPage(),
                  ),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboardingData[index]["image"]!,
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[index]["title"]!,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        onboardingData[index]["desc"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 60,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(4),
                        width: _currentPage == index ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.black
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                if (_currentPage == onboardingData.length - 1)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const GetStartedPage(),
                          ),
                        );
                      },
                      
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF83758),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
