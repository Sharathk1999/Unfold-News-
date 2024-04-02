import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrendingWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String packageLink;

  TrendingWidget({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.packageLink,
  });
}

class TrendingWidgetsPage extends StatelessWidget {
  final List<TrendingWidget> trendingWidgets = [
    TrendingWidget(
      title: 'Flutter Swiper',
      description:
          'A package to create beautiful, customizable swiper widgets in Flutter.',
      imageUrl:
          'https://pub.dev/packages/flutter_card_swiper/versions/7.0.0/gen-res/gen/swiping.webp',
      packageLink: 'https://pub.dev/packages/flutter_card_swiper',
    ),
    TrendingWidget(
      title: 'Awesome Snackbar Content',
      description:
          'Uplift your snackbar experience with various alert messages i.e. success, failure, help or warning with unique UI design.',
      imageUrl:
          'https://user-images.githubusercontent.com/43790152/169776704-cc6ac8d8-ebd7-4cf1-8239-5d4678b65bc4.png',
      packageLink: 'https://pub.dev/packages/awesome_snackbar_content',
    ),
    // Add more trending widgets as needed
  ];

  TrendingWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Trending Flutter Widgets',style: TextStyle(fontFamily: "Raleway",fontSize: 16),),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            itemCount: trendingWidgets.length,
            itemBuilder: (context, index) {
              TrendingWidget widget = trendingWidgets[index];
              return GestureDetector(
                onTap: ()async {
                  final Uri url =
                      Uri.parse(trendingWidgets[index].packageLink);

                  
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  
                },
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            widget.imageUrl,
                            height: constraints.maxWidth < 600 ? 150 : 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: constraints.maxWidth < 600 ? 16 : 18,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: constraints.maxWidth < 600 ? 14 : 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
