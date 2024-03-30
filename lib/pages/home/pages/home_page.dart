import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unfold_news/components/shimmer_news_tile.dart';
import 'package:unfold_news/components/shimmer_trending_card.dart';
import 'package:unfold_news/controller/news_controller.dart';
import 'package:unfold_news/core/time_ago.dart';
import 'package:unfold_news/pages/home/widgets/news_tile_widget.dart';
import 'package:unfold_news/pages/news_view/news_view_page.dart';
import 'package:unfold_news/pages/price/price_page.dart';

import '../widgets/trending_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              //AppBar custom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> const PricePage());
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(CupertinoIcons.cube,color: Colors.blueGrey,),
                    ),
                  ),
                  const Text(
                    "Unfold News",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.getNewsForYou();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.refresh_rounded,color: Colors.blueGrey,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => controller.isTrendingLoading.value ? const ShimmerTrendingCard(): Row(
                  children: controller.trendingNews.map((news) {
                    
                  return   TrendingCard(
                      title:
                         news.title!,
                      author: news.author ?? "author unknown",
                      imageUrl: news.urlToImage ?? "https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg",
                      tag: news.source!.name ?? "no tags",
                      time: timeAgo(DateTime.parse(news.publishedAt!)),
                      onTap: () {
                        Get.to(()=> NewsViewPage(news: news,));
                      },
                    );
                  }).toList(),
                ),)
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tech News  ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
               Obx(() =>controller.isNewsForYouLoading.value ? const ShimmerNewsTile(): Column(
                children: controller.newsForYou5.map((news) {
                  return  NewsTile(
                    title:
                        news.title!,
                    author: news.author ?? "author unknown",
                    imageUrl:news.urlToImage ??
                        "https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg",
                    time:  timeAgo(DateTime.parse(news.publishedAt!)),
                    onTap: () {
                      Get.to(()=> NewsViewPage(news: news));
                    },
                  );
                }).toList(),
              ),),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
               const SizedBox(height: 20),
               Obx(() =>controller.isBusinessNewsLoading.value ? const ShimmerNewsTile(): Column(
                children: controller.businessNews5.map((news) {
                  return  NewsTile(
                    title:
                        news.title!,
                    author: news.author ?? "author unknown",
                    imageUrl:news.urlToImage ??
                        "https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg",
                    time:  timeAgo(DateTime.parse(news.publishedAt!)),
                    onTap: () {
                      Get.to(()=> NewsViewPage(news: news));
                    },
                  );
                }).toList(),
              ),),
              
             
            ],
          ),
        ),
      ),
    );
  }
}


