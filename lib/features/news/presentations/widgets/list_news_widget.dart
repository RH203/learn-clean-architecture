import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/presentations/bloc/news/news_bloc.dart';

class ListNewsWidget extends StatefulWidget {
  const ListNewsWidget({super.key});

  @override
  State<ListNewsWidget> createState() => _ListNewsWidgetState();
}

class _ListNewsWidgetState extends State<ListNewsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(FetchTopHeadlinesNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            final List<Article> articlesWithImage = state.articles
                .where((article) => article.urlToImage != null)
                .toList();

            final List<Article> articlesWithoutImages = state.articles
                .where((article) => article.urlToImage == null)
                .toList();

            return CustomScrollView(
              slivers: [
                SliverGrid.builder(
                  itemCount: articlesWithImage.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    final article = articlesWithImage[index];

                    return GestureDetector(
                      onTap: () {
                        context.push('/detail-news', extra: article);
                      },
                      child: Container(
                        width: 400,
                        height: 600,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 200,
                              width: 400,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                ),
                                child: Hero(
                                  tag: article.title!,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: article.urlToImage!,
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.broken_image),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 9, right: 9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title != null
                                        ? (article.title!.length > 60
                                              ? '${article.title!.substring(0, min(60, article.title!.length))}...'
                                              : article.title!)
                                        : 'No Title',

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Text(
                                          article.author != null &&
                                                  article.author!.contains(',')
                                              ? 'By ${article.author!.split(', ')[0]}'
                                              : article.author != null
                                              ? 'By ${article.author}'
                                              : 'By someone',

                                          style: TextStyle(fontSize: 11),
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                        Icon(
                                          Icons.verified_outlined,
                                          size: 12,
                                          color: Colors.blueAccent,
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: article.description!.substring(
                                        0,
                                        min(article.description!.length, 100),
                                      ),
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Read more.',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 9,
                                right: 9,
                                bottom: 10,
                              ),
                              child: Row(
                                spacing: 8,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: 20,
                                    color: Colors.blueAccent,
                                  ),
                                  Icon(
                                    Icons.comment,
                                    size: 20,
                                    color: Colors.blueAccent,
                                  ),
                                  Icon(
                                    Icons.share,
                                    size: 20,
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          }

          return Text("Gagal mengambil berita");
        },
      ),
    );
  }
}
