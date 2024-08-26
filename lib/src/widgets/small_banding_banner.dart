import 'package:flutter/cupertino.dart';

class SmallBrandingBanner extends StatelessWidget {
  const SmallBrandingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network("https://fastly.picsum.photos/id/839/228/85.jpg?hmac=h3IkIz8u57tIxLe5_64XD4i0zkU0AJoJAv-sSV6AHNM"),
    );
  }
}