import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/repositories/news/repository.dart';

final latestNewsStateProvider =
    StateNotifierProvider<LatestNewsStateProvider, AsyncValue<List<Article>>>(
  (ref) {
    final repository = ref.read(newsRepositoryProvider);
    return LatestNewsStateProvider(repository);
  },
);

class LatestNewsStateProvider extends StateNotifier<AsyncValue<List<Article>>> {
  LatestNewsStateProvider(this.repository) : super(const AsyncLoading());
  final AbstractNewsRepository repository;
  getLatestNews() async {
    final latestArticles = await repository.getLatestArticles();
    state = AsyncData(latestArticles);
  }

  markAllRead() {
    if (state.value != null) {
      state =
          AsyncData(state.value!.map((e) => e.copyWith(readed: true)).toList());
    }
  }

  markOneRead(String id) {
    if (state.value != null) {
      state = AsyncData(state.value!
          .map((e) => (id == e.id) ? e.copyWith(readed: true) : e)
          .toList());
    }
  }
}
