import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/components/language_sheet.dart';

import '../../controller/news_controller.dart';
import 'widgets/theme_dialog.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile (updating soon)',
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 80,
                  child: Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //! Implement sign out functionality
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'John Honai',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'john.honai@gmail.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            _buildOptionItem(
              context,
              icon: CupertinoIcons.color_filter,
              label: 'Change Theme',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const ThemeDialog();
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            Obx(
              () => _buildOptionItem(
                context,
                icon: CupertinoIcons.globe,
                label: 'Select Language (${controller.selectedLanguage})',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Dialog(
                        child: LanguageSelectionBox(),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
