import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_archi/app_logger.dart';
import 'package:learn_clean_archi/features/news/domain/entity/article.dart';
import 'package:learn_clean_archi/features/news/presentations/bloc/news_bloc.dart';

class ListNewsPages extends StatefulWidget {
  const ListNewsPages({super.key});

  @override
  State<ListNewsPages> createState() => _ListNewsPagesState();
}

class _ListNewsPagesState extends State<ListNewsPages> {
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
            AppLogger.debug(state.articles.length);
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
                    return Card(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: article.urlToImage!,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.broken_image),
                            ),
                          ),
                          Text(
                            article.title!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final article = articlesWithoutImages[index];
                    return ListTile(title: Text(article.title ?? '-'));
                  }, childCount: articlesWithoutImages.length),
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
