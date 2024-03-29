import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/models/news_model.dart';

import '../../core/time_ago.dart';

class NewsViewPage extends StatelessWidget {
  final NewsModel news;
  const NewsViewPage({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("Back"),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  // height: 330,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            news.urlToImage ??
                                "https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  news.title ?? "No title found for the content",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      timeAgo(DateTime.parse(news.publishedAt!)),
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                    const SizedBox(width: 10),
                    Text(
                      news.author ?? "author unknown",
                      style: TextStyle(
                          fontSize: 18,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // height: 30,
                  child: const Row(
                    children: [
                      // Obx(
                      //   () => newsController.isSpeeking.value
                      //       ? IconButton(
                      //           onPressed: () {
                      //             newsController.stop();
                      //           },
                      //           icon: Icon(
                      //             Icons.stop,
                      //             size: 50,
                      //           ),
                      //         )
                      //       : IconButton(
                      //           onPressed: () {
                      //             newsController.speak(
                      //                 news.description ?? "No Description");
                      //           },
                      //           icon: Icon(
                      //             Icons.play_arrow_rounded,
                      //             size: 50,
                      //           ),
                      //         ),
                      // ),
                      // Expanded(
                      //     child: Obx(
                      //   () => Lottie.asset(
                      //     'Assets/Animation/wave.json',
                      //     height: 70,
                      //     animate: newsController.isSpeeking.value,
                      //   ),
                      // ))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        news.description ?? news.content ?? "no description for the news",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
