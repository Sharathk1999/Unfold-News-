import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/controller/news_controller.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "search your preferred news",
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(() => controller.isNewsForYouLoading.value
              ? Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ) :
               GestureDetector(
                  onTap: () {
                    controller.searchNews(searchController.text.trim());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Icon(Icons.search),
                  ),
                ),),
        ],
      ),
    );
  }
}