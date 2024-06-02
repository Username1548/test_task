import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/providers/latest_news_provider/latest_news_state_provider.dart';
import 'package:test_flutter/resources/colors.dart';
import 'package:test_flutter/resources/text_styles.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            child: Image.asset(
                      'assets/back_arrow.png',
                      color: CustomColors.black,
                    ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Notifications',
            style: TextStyles.text18.copyWith(color: CustomColors.black),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
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
    );
  }
}
