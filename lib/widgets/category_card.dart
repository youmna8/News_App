import 'package:flutter/material.dart';
import 'package:news_app_/models/category_model.dart';
import 'package:news_app_/views/category_view.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return CategoryView(category: category.categoryName,);
        }));
      },
      child: Container(
          height: 90,
          width: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(category.image)),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              category.categoryName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          )),
    );
  }
}
