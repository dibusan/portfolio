import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/shared/cache_image.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class SmallBrandingBanner extends StatelessWidget {
  final Developer? developer;

  const SmallBrandingBanner({super.key, this.developer});

  @override
  Widget build(BuildContext context) {
    final url = developer?.profileImageUrl;
    return ImageOnCache(
      size: const Size(double.maxFinite, 100),
      boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      imageUrl: url ?? "",
      errorWidget: Image.asset(
        'assets/avatars/${developer?.id ?? "_"}.png',
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => GlassContainer.clearGlass(
          borderRadius: BorderRadius.circular(20),
          borderColor: Colors.white,
        ),
      ),
    );
  }
}
