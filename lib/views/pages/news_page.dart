import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/providers/latest_news_provider/latest_news_state_provider.dart';
import 'package:test_flutter/resources/colors.dart';
import 'package:test_flutter/resources/text_styles.dart';
import 'package:test_flutter/views/widgets/news_page_widgets/news_widget.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        leading: GestureDetector(
          child: Image.asset(
            'assets/back_arrow.png',
            color: CustomColors.black,
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyles.text18.copyWith(color: CustomColors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21),
            child: GestureDetector(
                onTap: () {
                  ref.read(latestNewsStateProvider.notifier).markAllRead();
                },
                child: Text(
                  'Mark all read',
                  style: TextStyles.text18.copyWith(color: CustomColors.black),
                )),
          )
        ],
      ),
      body: const NewsWidget(),
    );
  }
}
