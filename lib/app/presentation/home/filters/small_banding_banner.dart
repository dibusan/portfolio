import 'package:flutter/cupertino.dart';
import 'package:portfolio_eriel/app/shared/cache_image.dart';

class SmallBrandingBanner extends StatelessWidget {
  const SmallBrandingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageOnCache(
      size: const Size(double.maxFinite, 100),
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      imageUrl:
          "https://avatars.githubusercontent.com/u/135989773?s=400&u=346fc3819db685124f01e4ac11060ae1d6c76f55&v=4",
    );
  }
}
