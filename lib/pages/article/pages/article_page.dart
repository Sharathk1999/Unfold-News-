import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/controller/news_controller.dart';
import 'package:unfold_news/pages/article/widgets/search_news_widget.dart';
import 'package:unfold_news/pages/news_view/news_view_page.dart';

import '../../../core/time_ago.dart';
import '../../home/widgets/news_tile_widget.dart';

class ArticlePageView extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ArticlePageView(),
      );
  const ArticlePageView({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              SearchNews(),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                children: controller.trendingNews.map((news) {
                  return NewsTile(
                    title: news.title ?? "no title for news",
                    author: news.author ?? "author unknown",
                    imageUrl: news.urlToImage ??
                        "https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg",
                    time: timeAgo(DateTime.parse(news.publishedAt!)),
                    onTap: () {
                      Get.to(
                        () => NewsViewPage(
                          news: news,
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
