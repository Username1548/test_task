import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/providers/featured_news_proovider/featured_news_state_provider.dart';
import 'package:test_flutter/providers/news_detail_provider/news_detail_state_provider.dart';
import 'package:test_flutter/resources/text_styles.dart';
import 'package:test_flutter/views/pages/news_details_page.dart';
import 'package:test_flutter/views/widgets/common/image_widget.dart';

class FeaturedNews extends ConsumerStatefulWidget {
  const FeaturedNews({super.key});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeaturedNewsState();
}

class _FeaturedNewsState extends ConsumerState<FeaturedNews> {
  @override
  void initState() {
    super.initState();
    ref.read(featuredNewsStateProvider.notifier).getFeaturedNews();
  }

  @override
  Widget build(BuildContext context) {
    final featuredNews = ref.watch(featuredNewsStateProvider);
    return PageView.builder(
      itemCount: featuredNews.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          ref
              .read(newsDetailStateProvider.notifier)
              .getArticle(featuredNews[index].id);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailsPage('fetured$index'),
              ));
        },
        child: Stack(children: [
          ImageWidget('fetured$index',
              height: MediaQuery.sizeOf(context).height,
              imageUrl:
                  featuredNews[index].imageUrl,
              // imageUrl: data[index].imageUrl,
              width: MediaQuery.sizeOf(context).width),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(microseconds: 1),
                style:TextStyles.text28
                    ,
                child: Text(
                  featuredNews[index].title,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
