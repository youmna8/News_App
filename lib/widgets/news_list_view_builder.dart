
import 'package:flutter/material.dart';
import 'package:news_app_/models/article_model.dart';
import 'package:news_app_/services/news_api.dart';
import 'package:news_app_/widgets/news_list_view.dart';
import 'package:dio/dio.dart';


class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key, required this.category,
  });
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsApi(Dio()).getNews(category:widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, Snapshot) {
          if (Snapshot.hasData) {
            return NewsListView(
              articles: Snapshot.data!,
            );
          } else if (Snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text('oops  was an error, try later'),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
