import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/utils/date_utils.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({super.key, required this.news});
  final ArticleEntity news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_rounded)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_add_outlined)),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(news.urlToImage!),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 197, 197, 193),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Center(
                        child: Text(
                      "TRENDING",
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    news.title!,
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(news.author!,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 17,
                              fontWeight: FontWeight.w400)),
                      Text(
                        formatDateTime(DateTime.parse(news.publishedAt!)),
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    news.content!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
