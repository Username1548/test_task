import 'package:test_flutter/repositories/news/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsDetailStateProvider =
    StateNotifierProvider<NewsDetailStateProvider, AsyncValue<Article>>(
  (ref) {
    final repository = ref.read(newsRepositoryProvider);
    return NewsDetailStateProvider(repository);
  },
);

class NewsDetailStateProvider extends StateNotifier<AsyncValue<Article>> {
  NewsDetailStateProvider(this.repository) : super(const AsyncLoading());
  final AbstractNewsRepository repository;
  getArticle(String id) async {
    try {
      final article = await repository.getArticle(id);
      state = AsyncData(article);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
