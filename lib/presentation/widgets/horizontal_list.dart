import 'package:disney_plus/core/theme/app_theme.dart';
import 'package:disney_plus/presentation/widgets/mini_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/movie_entity.dart';

class HorizontalList extends StatefulWidget {
  final String title;
  final List<MovieEntity> movies;

  const HorizontalList({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);
  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            widget.title,
            style: AppTextTheme.textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 168,
          child: ListView.separated(
            itemCount: widget.movies.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return GestureDetector(
                onTap: () => context.pushNamed('movie_info', pathParameters: {
                  'movie_id': movie.id.toString(),
                }),
                child: MiniCard(image: movie.posterPath),
              );
            },
          ),
        ),
      ],
    );
  }
}
