/*
File: News View
Description: View file to view the news in the UI
*/
import 'package:flutter/material.dart';
import 'package:news_app/helpers/article_webview.dart';
import 'package:news_app/helpers/my_navigator.dart';
import 'package:news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel articleModel;
  const NewsTile({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    final img = articleModel.image;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          if (articleModel.link != null && articleModel.link!.isNotEmpty) {
            myNavigator(
              context,
              screen: ArticleWebView(url: articleModel.link!),
            );
          }
        },
        child: Column(
          children: [
            //Widget to view the image of the news
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:
                  (img != null &&
                      img.isNotEmpty &&
                      (img.endsWith('.jpg') ||
                          img.endsWith('.jpeg') ||
                          img.endsWith('.png') ||
                          img.endsWith('.webp')))
                  ? Image.network(
                      articleModel.image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      "assets/general.jpeg",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
            ),
            //Title
            Text(
              articleModel.title ?? 'General News',
              style: TextStyle(color: Colors.black, fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            //Subtitle
            Text(
              articleModel.subTitle ?? '',
              style: TextStyle(color: Colors.grey, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            //Sized box to separate between news
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
