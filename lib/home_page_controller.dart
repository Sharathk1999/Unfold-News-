import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/components/nav_bar.dart';
import 'package:unfold_news/controller/bottom_nav_controller.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: const BottomNavBar(),
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
    );
  }
}
