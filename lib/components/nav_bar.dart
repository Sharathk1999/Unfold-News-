import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 180,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.primaryContainer),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.index.value = 0;
                  },
                  child: Icon(
                    CupertinoIcons.home,
                    color: controller.index.value == 0
                        ? Theme.of(context).colorScheme.primary
                        :   Colors.blueGrey[200],
                    size: 30,
                  ),
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.index.value = 1;
                  },
                  child: Icon(
                    CupertinoIcons.search_circle_fill,
                    color: controller.index.value == 1
                        ? Theme.of(context).colorScheme.primary
                        : Colors.blueGrey[200],
                    size: 30,
                  ),
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.index.value = 2;
                  },
                  child: Icon(
                    CupertinoIcons.settings_solid,
                    color: controller.index.value == 2
                        ? Theme.of(context).colorScheme.primary
                        : Colors.blueGrey[200],
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
