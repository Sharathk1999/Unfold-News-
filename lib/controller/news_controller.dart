import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  RxString selectedLanguage = "en".obs;

  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isBusinessNewsLoading = false.obs;
  RxBool isReading = false.obs;

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
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&language=${selectedLanguage.value}&apiKey=${dotenv.env["NEWS_API_KEY"]}";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          trendingNews.add(NewsModel.fromJson(news));
        }
      }
    } catch (e) {
      log("$e");
    }
    isTrendingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&language=${selectedLanguage.value}&apiKey=${dotenv.env["NEWS_API_KEY"]}";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          newsForYou.add(NewsModel.fromJson(news));
        }
        newsForYou5.value = newsForYou.sublist(0, 5).obs;
      }
    } catch (e) {
      log("$e");
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBusinessNewsLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=tesla&language=${selectedLanguage.value}&sortBy=publishedAt&apiKey=${dotenv.env["NEWS_API_KEY"]}";
    //"https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=${dotenv.env["NEWS_API_KEY"]}";

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        businessNews.clear();
        for (var news in articles) {
          businessNews.add(NewsModel.fromJson(news));
        }
        if (businessNews.length == 1) {
          businessNews5.value = businessNews;
        }
        businessNews5.value = businessNews.sublist(0, 5).obs;
      }
    } catch (e) {
      log("$e");
    }
    isBusinessNewsLoading.value = false;
  }

  Future<void> searchNews(String searchKey) async {
    isNewsForYouLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=$searchKey&sortBy=popularity&apiKey=${dotenv.env["NEWS_API_KEY"]}";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
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
    } catch (e) {
      log("$e");
    }
    isNewsForYouLoading.value = false;
  }

  void setLanguage(String language) {
    selectedLanguage.value = language;
    getBusinessNews();
  }

  Future<void> textToAudio(String content) async {
    if (!isReading.value) {
      isReading.value = true;
      await flutterTts.setLanguage("${selectedLanguage.value}-IN");

      await flutterTts.setSpeechRate(0.5);

      await flutterTts.setPitch(1.0);

      await flutterTts.speak(content);
    } else {
      await flutterTts.stop();
      isReading.value = false;
    }
  }
}
