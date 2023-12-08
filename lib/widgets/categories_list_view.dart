import 'package:flutter/material.dart';
import 'package:news_app_/models/category_model.dart';
import 'package:news_app_/widgets/category_card.dart';

class ListViewCategory extends StatelessWidget {
  ListViewCategory({super.key});

  final List<CategoryModel> category = [
    CategoryModel(image: 'assets/1.png', categoryName: 'entertainment'),
    CategoryModel(image: 'assets/2.png', categoryName: 'business'),
    CategoryModel(image: 'assets/3.png', categoryName: 'sports'),
    CategoryModel(image: 'assets/4.png', categoryName: 'Science'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'technology')
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(14),
        child: Container(
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: category[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemCount: category.length)));
  }
}
