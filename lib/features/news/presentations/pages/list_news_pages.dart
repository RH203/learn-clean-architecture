import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_archi/core/injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/presentations/bloc/news_bloc.dart';

class ListNewsPages extends StatefulWidget {
  const ListNewsPages({super.key});

  @override
  State<ListNewsPages> createState() => _ListNewsPagesState();
}

class _ListNewsPagesState extends State<ListNewsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<NewsBloc>()..add(FetchTopHeadlinesNews()),

        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.articles[index].title ?? ''),
                    subtitle: Text(state.articles[index].description ?? ''),
                  );
                },
              );
            } else if (state is NewsError) {
              return Center(child: Text(state.message));
            }

            return Text("Gagal mengambil berita");
          },
        ),
      ),
    );
  }
}
