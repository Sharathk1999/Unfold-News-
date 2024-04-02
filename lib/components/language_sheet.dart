import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/controller/news_controller.dart';

class LanguageSelectionBox extends StatelessWidget {
  const LanguageSelectionBox({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Select Language',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          LanguageItem(
            language: 'English',
            onTap: () {
              controller.setLanguage("en");
              Navigator.pop(context, 'English');
            },
          ),
          LanguageItem(
            language: 'Malayalam',
            onTap: () {
             controller.setLanguage("ml");
              Navigator.pop(context, 'Malayalam');
              print(controller.selectedLanguage);
            },
          ),
          // Add more language items as needed
        ],
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const LanguageItem({super.key, 
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          language,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.blue, // Adjust color as needed
          ),
        ),
      ),
    );
  }
}