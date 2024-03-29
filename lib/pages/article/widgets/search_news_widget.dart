import 'package:flutter/material.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({super.key});

  @override
  Widget build(BuildContext context) {
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
          // Obx(() => newsController.isNewsForULoading.value
          //     ? Container(
          //         width: 50,
          //         height: 50,
          //         padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: Theme.of(context).colorScheme.primary,
          //         ),
          //         child: CircularProgressIndicator(
          //           color: Colors.white,
          //         ),
          //       ) :
               InkWell(
                  onTap: () {
                    // newsController.searchNews(searchController.text);
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
                ),
        ],
      ),
    );
  }
}