import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/providers/news_detail_provider/news_detail_state_provider.dart';
import 'package:test_flutter/views/widgets/details_page_widgets/details_widget.dart';

class NewsDetailsPage extends ConsumerWidget {
  const NewsDetailsPage(this.tag, {super.key});
  final String tag;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article = ref.watch(newsDetailStateProvider);
    return Scaffold(
      body: article.when(
        data: (data) => DetailsWidget(tag, data),
        error: (error, stackTrace) => Center(child:Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
