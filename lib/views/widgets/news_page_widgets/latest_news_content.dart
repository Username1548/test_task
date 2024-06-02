import 'package:flutter/material.dart';
import 'package:test_flutter/extensions/date_time_extension.dart';
import 'package:test_flutter/repositories/news/models/article.dart';
import 'package:test_flutter/resources/colors.dart';
import 'package:test_flutter/resources/screen_size.dart';
import 'package:test_flutter/resources/text_styles.dart';
import 'package:test_flutter/views/widgets/common/image_widget.dart';

class LatestNewsContent extends StatelessWidget {
  const LatestNewsContent(this.article, this.height, this.index,{super.key});
  final Article article;
  final double height;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ImageWidget(
            'latest$index',
            height: height * 0.6,
            width: (ScreenSize.width ?? 0) * 0.22,
            imageUrl: article.imageUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 23),
          child: SizedBox(
            height: height * 0.6,
            width: (ScreenSize.width ?? 0) * 0.46,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.title,
                  style: TextStyles.text16.copyWith(color: CustomColors.black),
                  softWrap: true,
                  // overflow: TextOverflow.ellipsis,
                ),
                Text(
                  article.publicationDate.calculateTimeDifference(DateTime.now()),
                  style: TextStyles.text12.copyWith(color: CustomColors.grey),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
