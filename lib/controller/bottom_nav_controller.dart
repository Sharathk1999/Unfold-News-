import 'package:get/get.dart';
import 'package:unfold_news/pages/article/pages/article_page.dart';
import 'package:unfold_news/pages/home/pages/home_page.dart';
import 'package:unfold_news/pages/profile/profile_page.dart';

class BottomNavController extends GetxController {
  RxInt index=0.obs;

  var pages = [
    const HomePage(),
    const ArticlePageView(),
    const ProfilePageView()
  ];
}