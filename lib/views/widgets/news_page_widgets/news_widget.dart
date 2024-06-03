import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/providers/featured_news_proovider/featured_news_state_provider.dart';
import 'package:test_flutter/providers/latest_news_provider/latest_news_state_provider.dart';
import 'package:test_flutter/resources/colors.dart';
import 'package:test_flutter/resources/text_styles.dart';
import 'package:test_flutter/views/widgets/news_page_widgets/featured_news.dart';
import 'package:test_flutter/views/widgets/news_page_widgets/leatest_news.dart';

class NewsWidget extends ConsumerStatefulWidget {
  const NewsWidget({super.key});
  @override
  ConsumerState<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends ConsumerState<NewsWidget> {

  @override
  void initState() {
    super.initState();

    ref.read(featuredNewsStateProvider.notifier).getFeaturedNews();
    ref.read(latestNewsStateProvider.notifier).getLatestNews();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [          
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    'Featured',
                    style:
                        TextStyles.text28.copyWith(color: CustomColors.black),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: const FeaturedNews()
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'Latest news',
                    style:
                        TextStyles.text20.copyWith(color: CustomColors.black),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    
                    child: LatestNews(MediaQuery.of(context).size.height * 0.12))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
