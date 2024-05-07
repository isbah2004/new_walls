import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:new_walls/fullscreen/full_screen.dart';

class FullViewTile extends StatelessWidget {
  final String imageUrl;
  final String placeholder;
  const FullViewTile(
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
                builder: (context) => FullScreen(
                  imageUrl: imageUrl,
                  placeholder: placeholder,
                ),
              ),
            );
          },
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            placeholder: (context, url) =>
                Lottie.asset(placeholder, fit: BoxFit.fill, repeat: true),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
