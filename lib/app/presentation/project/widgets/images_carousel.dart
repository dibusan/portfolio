import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/shared/__.dart';

class ImagesCarousel extends StatelessWidget {
  final List<String> allImages;
  final List<String> locals;
  final List<String> remotes;
  final Function(String image, bool onlyRemote)? onDelete;
  final bool enable;

  const ImagesCarousel({super.key, required this.allImages, this.locals = const [], this.remotes = const [], this.onDelete, this.enable = true});

  _imageOnlyLocal(String image) {
    return !remotes.contains(image) && locals.contains(image);
  }

  _imageOnlyRemote(String image) {
    return remotes.contains(image) && !locals.contains(image);
  }

  @override
  Widget build(BuildContext context) {
    Widget removeWidget(image) => Positioned(
          right: 10,
          top: 10,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey.withOpacity(0.8),
            child: IconButton(
              onPressed: () => onDelete?.call(image, _imageOnlyRemote(image)),
              icon: Icon(_imageOnlyRemote(image) ? Icons.cancel_outlined : Icons.remove_circle),
              iconSize: 16,
            ),
          ),
        );

    List<Widget> infoWidget(image) => [
          if (_imageOnlyLocal(image))
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: const Center(child: Text("Pending Uploading when save...")),
            ),
          if (_imageOnlyRemote(image))
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: const Center(child: Text("Pending Remove when save....")),
            ),
        ];

    return LayoutBuilder(builder: (context, constrains) {
      final dec = BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
      );
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: allImages.length == 1
            ? SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      decoration: dec,
                      child: ImageOnCache(
                        imageUrl: allImages.first,
                        boxDecoration: dec,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ...infoWidget(allImages.first),
                    if (onDelete != null && enable) removeWidget(allImages.first)
                  ],
                ),
              )
            : CarouselSlider(
                options: CarouselOptions(height: 300.0, autoPlay: true, viewportFraction: 0.6),
                items: allImages.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: constrains.maxWidth * 0.8,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: dec,
                        child: Stack(
                          children: [
                            ImageOnCache(
                              imageUrl: i,
                              boxDecoration: dec,
                              fit: BoxFit.cover,
                            ),
                            ...infoWidget(i),
                            if (onDelete != null && enable) removeWidget(i)
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
      );
    });
  }
}
