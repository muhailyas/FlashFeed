import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/core/utils/string_extension.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/home/widgets/news_card_widget.dart';
import '../../bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_added, color: Colors.black))
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: BlocBuilder<RemoteArticlesBlco, RemoteArticleState>(
              buildWhen: (previous, current) =>
                  current is CategorySelectedState,
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      onTap: () {
                        context
                            .read<RemoteArticlesBlco>()
                            .add(SelectCategoryEvent(selectedIndex: index));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: state is CategorySelectedState &&
                                    state.selectedIndex == index
                                ? Colors.black
                                : const Color.fromARGB(255, 238, 238, 238),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              categories[index].capitalizeFirstLetter(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: state is CategorySelectedState &&
                                          state.selectedIndex == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  itemCount: 3,
                );
              },
            ),
          ),
          BlocBuilder<RemoteArticlesBlco, RemoteArticleState>(
            buildWhen: (previous, current) => current is! CategorySelectedState,
            builder: (_, state) {
              if (state is RemoteArticleLoading) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state is RemoteArticlesError) {
                return const Center(child: Icon(Icons.refresh));
              }
              if (state is RemoteArticlesDone) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.articles!.length,
                  itemBuilder: (context, index) {
                    final news = state.articles![index];
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleDetail(news: news),
                              ));
                        },
                        child: NewsCardWidget(news: news));
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
