import 'package:flutter/cupertino.dart';
import 'package:portfolio_eriel/app/shared/__.dart';

class BannerWithProfileImage extends StatelessWidget {
  final String profileImageUrl;
  final String bannerUrl;

  const BannerWithProfileImage({
    super.key,
    required this.profileImageUrl,
    required this.bannerUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: ProfileBanner(bannerUrl: bannerUrl),
        ),
        RoundProfileImage(profileImageUrl: profileImageUrl),
      ],
    );
  }
}
