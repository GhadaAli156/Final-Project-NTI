import 'package:flutter/material.dart';

import '../../../core/color_manager/color_manager.dart';

class FavoriteToggleIcon extends StatefulWidget {
  const FavoriteToggleIcon({super.key});

  @override
  State<FavoriteToggleIcon> createState() => _FavoriteToggleIconState();
}

class _FavoriteToggleIconState extends State<FavoriteToggleIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: isFavorite
            ? ShaderMask(
          shaderCallback: (Rect bounds) {
            return ColorManager.primaryColorGradient
                .createShader(bounds);
          },
          child: const Icon(
            Icons.favorite,
            size: 25,
            color: Colors.white,
          ),
        )
            : const Icon(
          Icons.favorite_border,
          size: 25,
          color: Colors.grey,
        ),
      ),
    );
  }
}
