import 'package:flutter/material.dart';
import 'package:news_app_/widgets/categories_list_view.dart';
import 'package:news_app_/widgets/news_list_view_builder.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'News',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Cloud',
            style: TextStyle(color: Colors.red),
          ),
        ]),
      ),
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(child: ListViewCategory()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 3,
          ),
        ),
        NewsListViewBuilder(category: 'general',)
      ]),
    );
  }
}
