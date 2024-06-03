import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/repositories/news/repository.dart';

final latestNewsStateProvider =
    StateNotifierProvider<LatestNewsStateProvider, List<Article>>(
  (ref) {
    final repository = ref.read(newsRepositoryProvider);
    return LatestNewsStateProvider(repository);
  },
);

class LatestNewsStateProvider extends StateNotifier<List<Article>> {
  LatestNewsStateProvider(this.repository) : super([]);
  final AbstractNewsRepository repository;
  getLatestNews() async {
    final latestArticles = await repository.getLatestArticles();
    state = latestArticles;
  }

  markAllRead() {
    state = state.map((e) => e.copyWith(readed: true)).toList();
  }

  markOneRead(String id) {
    state =
        state.map((e) => (id == e.id) ? e.copyWith(readed: true) : e).toList();
  }
}
