import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(this.tag, {super.key, required this.height, required this.imageUrl, required this.width});
  final double height;
  final String imageUrl;
  final String tag;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag + imageUrl,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: height ,
          width: width ,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
