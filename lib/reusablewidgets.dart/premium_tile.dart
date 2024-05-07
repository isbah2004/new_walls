import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_walls/fullscreen/full_screen.dart';
import 'package:new_walls/theme/theme_data.dart';

class PremiumTile extends StatelessWidget {
  final String imageUrl, placeholder;
  const PremiumTile(
      {super.key, required this.imageUrl, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FullScreen(imageUrl: imageUrl, placeholder: placeholder),
              ),
            );
          },
          child: Stack(
            fit:StackFit.expand,
            children: [
              CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    Lottie.asset(placeholder, fit: BoxFit.fill, repeat: true),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppTheme.textBackground,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Watch a short\nad to unlock',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
