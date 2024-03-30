import 'dart:convert';
import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';
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

  FlutterTts flutterTts = FlutterTts();

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
        log(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          trendingNews.add(NewsModel.fromJson(news));
        }
      }
      log("$trendingNews");
    } catch (e) {
      log("$e");
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
        log(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          newsForYou.add(NewsModel.fromJson(news));
        }
        newsForYou5.value = newsForYou.sublist(0, 5).obs;
      }
      log("$trendingNews");
    } catch (e) {
      log("$e");
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBusinessNewsLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=14c7b4837f3645978b89d4c980b9d2e1";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        log(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          businessNews.add(NewsModel.fromJson(news));
        }
        businessNews5.value = businessNews.sublist(0, 5).obs;
      }
      log("$trendingNews");
    } catch (e) {
      log("$e");
    }
    isBusinessNewsLoading.value = false;
  }

  Future<void> searchNews(String searchKey) async {
    isNewsForYouLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=$searchKey&sortBy=popularity&apiKey=14c7b4837f3645978b89d4c980b9d2e1";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        log(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        newsForYou.clear();
        int i = 0;
        for (var news in articles) {
          i++;
          newsForYou.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
        log("Something went wrong in search news");
      }
      log("$trendingNews");
    } catch (e) {
      log("$e");
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> textToAudio(String content) async {
    await flutterTts.setLanguage("en-IN");

    await flutterTts.setSpeechRate(0.5);

    await flutterTts.setPitch(1.0);

    await flutterTts.speak(content);
  }
}


//14c7b4837f3645978b89d4c980b9d2e1
