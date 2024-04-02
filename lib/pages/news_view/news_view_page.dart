import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/controller/news_controller.dart';
import 'package:unfold_news/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/time_ago.dart';

class NewsViewPage extends StatelessWidget {
  final NewsModel news;
  const NewsViewPage({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
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
                          Icon(CupertinoIcons.chevron_back),
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
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                "https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg",
                                fit: BoxFit.cover,
                              );
                            },
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
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        controller.textToAudio(news.description ??
                            news.content ??
                            "No description available");
                      },
                      icon: Obx(
                        () => Icon(
                          controller.isReading.value
                              ? CupertinoIcons.waveform
                              : CupertinoIcons.mic,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.link,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(news.url!);

                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: const Text(
                          "view article",
                          style: TextStyle(
                              fontFamily: "Raleway", color: Colors.blue),
                        ))
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        news.description ??
                            news.content ??
                            "no description for the news",
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
