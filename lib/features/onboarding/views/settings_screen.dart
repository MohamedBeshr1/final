import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLang = "EN";

  final Map<String, Map<String, String>> translations = {
    "EN": {"language": "Language", "title": "Settings"},
    "AR": {"language": "اللغة", "title": "الإعدادات"},
  };

  @override
  Widget build(BuildContext context) {
    final currentTranslations = translations[selectedLang]!;

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          currentTranslations["title"]!,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentTranslations["language"]!,
              style: const TextStyle(fontSize: 25),

            ),
            const SizedBox(width: 220,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                _buildLangButton("AR"),
                const SizedBox(width: 10),
                _buildLangButton("EN"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLangButton(String lang) {
    final bool isSelected = selectedLang == lang;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLang = lang;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : const Color(0xFFCCD5E1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          lang,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}