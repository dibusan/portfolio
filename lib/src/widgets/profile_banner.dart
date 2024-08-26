import 'package:flutter/cupertino.dart';

class ProfileBanner extends StatelessWidget {
  final String bannerUrl;

  const ProfileBanner({super.key, required this.bannerUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.sizeOf(context).width,
      // height: MediaQuery.sizeOf(context).height / 5,
      child: AspectRatio(
        aspectRatio: 4 / 1,
        child: Image.network(bannerUrl),
      ),
    );
  }
}
//https://picsum.photos/1920/240
//https://picsum.photos/1440/480