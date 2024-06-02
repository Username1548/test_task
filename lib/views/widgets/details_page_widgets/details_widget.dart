import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/resources/colors.dart';
import 'package:test_flutter/resources/screen_size.dart';
import 'package:test_flutter/resources/text_styles.dart';
import 'package:test_flutter/views/widgets/common/image_widget.dart';
import '../../../repositories/news/repository.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(this.tag, this.article, {super.key});
  final Article article;
  final String tag;

  @override
  Widget build(BuildContext context) {
    

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: (ScreenSize.height ?? 0) * 0.55,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(children: [
              ImageWidget(
                tag,
                height: (ScreenSize.height ?? 0) * 0.55,
                width: MediaQuery.sizeOf(context).width,
                imageUrl: article.imageUrl,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 87, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/back_arrow.png',
                      color: CustomColors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 40),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    article.title,
                    style:
                        TextStyles.text28.copyWith(color: CustomColors.white),
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 21, top: 20),
            child: Text(
              article.description ?? 'No description',
              style: TextStyles.text16.copyWith(color: CustomColors.black),
            ),
          )
        ],
      ),
    );
  }
}
