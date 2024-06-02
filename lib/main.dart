import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/resources/colors.dart';
import 'package:test_flutter/views/pages/news_page.dart';

void main() {
  runApp(const ProviderScope(child: ForestVPNTestApp()));
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    double textScaleFactor = 1.0;
    if (width < 375) {
      textScaleFactor = 0.7;
    } else if (width >= 375 && width < 393) {
      textScaleFactor = 0.8;
    } else if (width >= 393 && width < 420) {
      textScaleFactor = 0.9;
    } else if (width >= 420 && width < 600) {
      textScaleFactor = 1.0;
    } else if (width >= 600 && width < 840) {
      textScaleFactor = 1.1;
    } else if (width >= 840) {
      textScaleFactor = 1.2;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.background,
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: TextScaler.linear(textScaleFactor)),
        child: child ?? const NewsPage(),
      ),
      title: 'ForestVPN test',
      home: const NewsPage(),
    );
  }
}
