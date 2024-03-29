import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsController extends GetxController {
 
  RxList<NewsModel> trendingNews = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> businessNews = <NewsModel>[].obs;
  RxList<NewsModel> businessNews5 = <NewsModel>[].obs;

   RxBool isTrendingLoading = false.obs;
   RxBool isNewsForYouLoading = false.obs;
   RxBool isBusinessNewsLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getNewsForYou();
    getBusinessNews();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=14c7b4837f3645978b89d4c980b9d2e1";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          trendingNews.add(NewsModel.fromJson(news));
        }
        newsForYou5.value = newsForYou.sublist(0, 5).obs;
      }
      print(trendingNews);
    } catch (e) {
      print(e);
    }
     isTrendingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
     isNewsForYouLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=14c7b4837f3645978b89d4c980b9d2e1";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          newsForYou.add(NewsModel.fromJson(news));
        }
      }
      print(trendingNews);
    } catch (e) {
      print(e);
    }
    isNewsForYouLoading.value =false;
  }

  Future<void> getBusinessNews() async {
    isBusinessNewsLoading.value = true;
    var baseUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=14c7b4837f3645978b89d4c980b9d2e1";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          businessNews.add(NewsModel.fromJson(news));
        }
        businessNews5.value = businessNews.sublist(0, 5).obs;
      }
      print(trendingNews);
    } catch (e) {
      print(e);
    }
    isBusinessNewsLoading.value = false;
  }
}
