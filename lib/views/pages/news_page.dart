import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/resources/screen_size.dart';
import 'package:test_flutter/views/widgets/news_page_widgets/news_widget.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSize.width = MediaQuery.sizeOf(context).width;
    ScreenSize.height = MediaQuery.sizeOf(context).height;
    return const Scaffold(
      body: NewsWidget(),
    );
  }
}
