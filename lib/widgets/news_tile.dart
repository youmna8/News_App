import 'package:flutter/material.dart';
import 'package:news_app_/models/article_model.dart';


class News extends StatelessWidget {
  const News({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              articleModel.img ?? "",
              height: 150,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            SizedBox(
              height: 12,
            ),
            Center(
                child: Text(
              articleModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                articleModel.subtitle ?? "",
                maxLines: 2,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ));
  }
}
