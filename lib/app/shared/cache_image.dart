import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image_web/cached_network_image_web.dart';
import 'package:glass_kit/glass_kit.dart';

class ImageOnCache extends StatelessWidget {
  final String imageUrl;
  final BoxDecoration boxDecoration;
  final Size? size;
  final BoxFit fit;
  final Widget? errorWidget;

  const ImageOnCache({
    super.key,
    required this.imageUrl,
    this.size,
    this.fit = BoxFit.contain,
    this.boxDecoration = const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
    this.errorWidget,
  });


  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      httpHeaders: const {
        "Access-Control-Allow-Origin": "*",
      },
      useOldImageOnUrlChange: true,
      imageUrl: imageUrl,
      imageBuilder: (_, imageProvider) {
        final box = boxDecoration.copyWith(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
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
        child: errorWidget ??
            GlassContainer.clearGlass(
              borderRadius: boxDecoration.borderRadius?.resolve(TextDirection.ltr),
              borderColor: Colors.white,
            ),
      ),
    );
  }
}
