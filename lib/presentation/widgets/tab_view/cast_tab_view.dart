import 'package:disney_plus/presentation/pods/states/movie_cast_states.dart';
import 'package:disney_plus/presentation/widgets/cast_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../pods/notifiers/get_movie_cast_notifier.dart';

class CastTabView extends ConsumerStatefulWidget {
  final int movieId;
  const CastTabView({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  @override
  CastTabViewState createState() => CastTabViewState();
}

class CastTabViewState extends ConsumerState<CastTabView> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(movieCastProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.getMovieCast(movieId: widget.movieId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 23,
      ),
      child: Consumer(
        builder: (_, ref, __) {
          final movieCast = ref.watch(movieCastProvider);
          if (movieCast is MovieCastLoading) {
            return const CupertinoActivityIndicator(
              color: Colors.red,
            );
          } else if (movieCast is MovieCastLoaded) {
            final cast = movieCast.movie;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final castMember in cast)
                  CastItem(
                    name: castMember.name,
                    image: castMember.profilePath == null
                        ? "https://www.nailseatowncouncil.gov.uk/wp-content/uploads/blank-profile-picture-973460_1280-600x600.jpg"
                        : "https://www.themoviedb.org/t/p/original/${castMember.profilePath}",
                    character: castMember.character,
                  ),
              ],
            );
          } else if (movieCast is MovieCastError) {
            return Text(
              movieCast.message,
              style: AppTextTheme.textTheme.bodyLarge,
            );
          } else {
            const SizedBox();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
