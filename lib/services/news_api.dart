
import 'package:news_app_/models/article_model.dart';
import 'package:dio/dio.dart';



class NewsApi {
  final Dio dio;

  NewsApi(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737&category=$category');
      Map<String, dynamic> jsondata = response.data;

      List<dynamic> articles = jsondata['articles'];
      List<ArticleModel> articleList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            img: article['urlToImage'],
            title: article['title'],
            subtitle: article['description']);
        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
