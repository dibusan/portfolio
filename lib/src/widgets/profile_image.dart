import 'package:flutter/cupertino.dart';

class RoundProfileImage extends StatelessWidget {
  final String profileImageUrl;

  const RoundProfileImage({super.key, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double imageWidth = screenWidth / 6;
    double imageRadius = imageWidth / 2;


    return SizedBox(
      width: imageWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageRadius),
        child: Image.network(profileImageUrl),
      ),
    );
  }
}
