import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/repositories/news/repository.dart';

final featuredNewsStateProvider =
    StateNotifierProvider<FeaturedNewsNotifier, AsyncValue<List<Article>>>(
  (ref) {
    final repository = ref.read(newsRepositoryProvider);
    return FeaturedNewsNotifier(repository);
  },
);

class FeaturedNewsNotifier extends StateNotifier<AsyncValue<List<Article>>> {
  FeaturedNewsNotifier(this.repository) : super(const AsyncLoading());
  final AbstractNewsRepository repository;
  getFeaturedNews() async {
    final featuredArticles = await repository.getFeaturedArticles();
    state = AsyncData(featuredArticles);
  }
}
