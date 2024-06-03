import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/repositories/news/repository.dart';

final featuredNewsStateProvider =
    StateNotifierProvider<FeaturedNewsNotifier, List<Article>>(
  (ref) {
    final repository = ref.read(newsRepositoryProvider);
    return FeaturedNewsNotifier(repository);
  },
);

class FeaturedNewsNotifier extends StateNotifier<List<Article>> {
  FeaturedNewsNotifier(this.repository) : super([]);
  final AbstractNewsRepository repository;
  getFeaturedNews() async {
    final featuredArticles = await repository.getFeaturedArticles();
    state = featuredArticles;
  }
}
