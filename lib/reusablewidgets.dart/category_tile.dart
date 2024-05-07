import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_walls/theme/theme_data.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String placeholder;
  final String categoryName;
  final VoidCallback onTap;
  const CategoryTile(
      {super.key,
      required this.imageUrl,
      required this.placeholder,
      required this.categoryName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  Lottie.asset(placeholder, fit: BoxFit.fill, repeat: true),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error), // Error widget
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                height: 30,
                decoration: const BoxDecoration(color: AppTheme.textBackground),
                child: Text(
                  categoryName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
