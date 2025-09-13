import 'package:flutter/material.dart';

class KidsPage extends StatelessWidget {
  const KidsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kids")),
      body: const Center(child: Text("Kids Page")),
    );
  }
}
