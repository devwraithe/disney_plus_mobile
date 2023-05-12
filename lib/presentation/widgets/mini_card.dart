import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatefulWidget {
  final String image;
  const MiniCard({
    Key? key,
    required this.image,
  }) : super(key: key);
  @override
  State<MiniCard> createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: "https://www.themoviedb.org/t/p/original/${widget.image}",
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
        width: 110,
        height: 162,
      ),
    );
  }
}
