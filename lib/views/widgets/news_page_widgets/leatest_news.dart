import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/providers/latest_news_provider/latest_news_state_provider.dart';
import 'package:test_flutter/providers/news_detail_provider/news_detail_state_provider.dart';
import 'package:test_flutter/resources/colors.dart';
import 'package:test_flutter/views/pages/news_details_page.dart';
import 'package:test_flutter/views/widgets/news_page_widgets/latest_news_content.dart';

class LatestNews extends ConsumerStatefulWidget {
  const LatestNews(this.height, {super.key});
  final double height;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeaturedNewsState();
}

class _FeaturedNewsState extends ConsumerState<LatestNews> {
  @override
  void initState() {
    super.initState();
    ref.read(latestNewsStateProvider.notifier).getLatestNews();
  }

  @override
  Widget build(BuildContext context) {
    final news = ref.watch(latestNewsStateProvider);
    return news.when(
      data: (data) => data.isEmpty  ? const Text('empty'): ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              ref
                  .read(newsDetailStateProvider.notifier)
                  .getArticle(data[index].id);
              ref
                  .read(latestNewsStateProvider.notifier)
                  .markOneRead(data[index].id);
              Navigator.push(
              context, MaterialPageRoute(builder:(context) =>  NewsDetailsPage('latest$index'),)
            );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: data[index].readed
                    ? CustomColors.greyBackground
                    : CustomColors.white,
              ),
              height: widget.height,
              child: LatestNewsContent(data[index], widget.height, index),
            ),
          ),
        ),
        itemCount: data.length,
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
