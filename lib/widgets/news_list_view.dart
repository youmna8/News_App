import 'package:flutter/material.dart';
import 'package:news_app_/models/article_model.dart';
import 'package:news_app_/widgets/news_tile.dart';



class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.articles,
  });
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: News(
            articleModel: articles[index],
          ));
    }));
  }
}
