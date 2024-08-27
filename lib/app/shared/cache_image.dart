import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageOnCache extends StatelessWidget {
  final String imageUrl;
  final BoxDecoration boxDecoration;
  final Size? size;

  const ImageOnCache({
    super.key,
    required this.imageUrl,
    this.size,
    this.boxDecoration = const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (_, imageProvider) {
        final box = boxDecoration.copyWith(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        );
        return Container(width: size?.width, height: size?.height, decoration: box);
      },
      placeholder: (context, url) => Container(
        width: size?.width,
        height: size?.height,
        decoration: boxDecoration,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: size?.width,
        height: size?.height,
        decoration: boxDecoration,
        child: const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
