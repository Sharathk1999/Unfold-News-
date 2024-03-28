import 'package:flutter/material.dart';
import 'package:unfold_news/presentation/home/widgets/news_tile_widget.dart';

import '../../../components/nav_bar.dart';
import '../widgets/trending_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const BottomNavBar(),
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
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.dashboard),
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
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.person),
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingCard(
                      title:
                          "ആടുജീവിതം കണ്ട് കമൽഹാസനും മണിരത്‌നവും; കമലിന്‍റെ റിവ്യൂ ഇങ്ങനെ; വീഡിയോ ആവേശത്തോടെ പങ്കുവച്ച് പൃഥ്വി",
                      author: "Robin",
                      imageUrl:
                          "https://static.moviecrow.com/marquee/the-goat-life-review-by-kamal-haasan-mani-ratnam/227738_thumb_665.jpg",
                      tag: "Trending no 1",
                      time: "2 hours ago",
                    ),
                    TrendingCard(
                      title:
                          "അഹമ്മദാബാദില്‍ മാത്രമല്ല ഹൈദരാബാദിലുമുണ്ട് 'ശര്‍മാജി'ക്ക് പിടി; ഹാര്‍ദ്ദക്കിന് വീണ്ടും കാണികളുടെ കൂവല്‍",
                      author: "Sudarshan",
                      imageUrl:
                          "https://static-ai.asianetnews.com/images/01ht1n3gbez2a1zwhwgzj00xmc/hyderabad-crowd-too-booed-hardikpandya_700x350xt.jpg",
                      tag: "Trending no 1",
                      time: "6 hours ago",
                    ),
                    TrendingCard(
                      title:
                          "പുഷ്പക് പറന്നിറങ്ങി; ആർഎൽവിയുടെ രണ്ടാം ലാൻഡിങ് പരീക്ഷണവും വിജയം",
                      author: "John Kuriyakose",
                      imageUrl:
                          "https://static-ai.asianetnews.com/images/01hsj0hdfxtvwbwvbf279n6wkc/pushpak_700x350xt.jpg",
                      tag: "Trending no 1",
                      time: "6 hours ago",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News For you",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  NewsTile(
                    title:
                        "ദൈവത്തിന്റെ പോരാളികള്‍.. അല്ലെങ്കില്‍ വേണ്ട, മുംബൈ ഇന്ത്യന്‍സ് പൊട്ടി! ഹൈദരാബാദിനെതിരെ പരാജയം 31 റണ്‍സിന്",
                    author: "Sai Manoj",
                    imageUrl:
                        "https://static-ai.asianetnews.com/images/01ht0b6ea9bjhazqgtg1zt5pmq/heinrich-klaasen--1-_700x350xt.jpg",
                    time: "5 hours ago",
                  ),
                  NewsTile(
                    title:
                        "ദൈവത്തിന്റെ പോരാളികള്‍.. അല്ലെങ്കില്‍ വേണ്ട, മുംബൈ ഇന്ത്യന്‍സ് പൊട്ടി! ഹൈദരാബാദിനെതിരെ പരാജയം 31 റണ്‍സിന്",
                    author: "Sai Manoj",
                    imageUrl:
                        "https://static-ai.asianetnews.com/images/01ht0b6ea9bjhazqgtg1zt5pmq/heinrich-klaasen--1-_700x350xt.jpg",
                    time: "5 hours ago",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tesla News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apple News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(),
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

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
