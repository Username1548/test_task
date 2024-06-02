import 'package:flutter/material.dart';
import 'package:test_flutter/resources/colors.dart';
import 'package:test_flutter/resources/screen_size.dart';
import 'package:test_flutter/resources/text_styles.dart';
import 'package:test_flutter/views/widgets/news_page_widgets/custom_app_bar.dart';
import 'package:test_flutter/views/widgets/news_page_widgets/featured_news.dart';
import 'package:test_flutter/views/widgets/news_page_widgets/leatest_news.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final _controller = ScrollController();
  late double _height;
  late double _fontSize;
  late double _targetHeight;
  late double _initialHeight;
  final double _maxFontSize = 28;
  final double _minFontSize = 16;

  @override
  void initState() {
    super.initState();
    final height = ScreenSize.height ?? 0;
    _targetHeight = height * 0.12;
    _initialHeight = height * 0.33;
    _height = _initialHeight;
    _fontSize = _maxFontSize;
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    double maxScrollExtent = _controller.position.maxScrollExtent;
    double currentScroll = _controller.position.pixels;

    double scrollFraction = currentScroll / maxScrollExtent;
    double adjustedScrollFraction = scrollFraction * 2.5; // Increase the impact

    setState(() {
      _height = _initialHeight -
          (adjustedScrollFraction * (_initialHeight - _targetHeight));
      if (_height < _targetHeight) {
        _height = _targetHeight;
      } else if (_height > _initialHeight) {
        _height = _initialHeight;
      }
      _fontSize =
          _maxFontSize - (scrollFraction * 2 * (_maxFontSize - _minFontSize));

      if (_fontSize < _minFontSize) {
        _fontSize = _minFontSize;
      } else if (_fontSize > _maxFontSize) {
        _fontSize = _maxFontSize;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 87, right: 20),
            child: CustomAppBar(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    'Featured',
                    style:
                        TextStyles.text28.copyWith(color: CustomColors.black),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(microseconds: 1),
                  height: _height,
                  child: FeaturedNews(_fontSize),
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
                    height: MediaQuery.sizeOf(context).height,
                    child: LatestNews(_targetHeight))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
