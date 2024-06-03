import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(this.tag,
      {super.key,
      required this.height,
      required this.imageUrl,
      required this.width});
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
          height: height,
          width: width,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.07,
                  height: MediaQuery.sizeOf(context).height * 0.04,
                  child: CircularProgressIndicator(
                      color: Colors.blue, value: downloadProgress.progress)),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
