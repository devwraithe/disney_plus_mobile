import 'package:cached_network_image/cached_network_image.dart';
import 'package:disney_plus/presentation/pods/notifiers/get_movie_info_notifier.dart';
import 'package:disney_plus/presentation/pods/states/movie_info_states.dart';
import 'package:disney_plus/presentation/widgets/tab_view/cast_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_theme.dart';
import '../widgets/icon_button.dart';
import '../widgets/tab_view/details_tab_view.dart';

class MovieInfo extends ConsumerStatefulWidget {
  final String movieId;
  const MovieInfo({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  @override
  MovieInfoState createState() => MovieInfoState();
}

class MovieInfoState extends ConsumerState<MovieInfo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabItemStyle = AppTextTheme.textTheme.bodyMedium?.copyWith(
    letterSpacing: 2,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  final List<Widget> _tabs = [
    const Tab(text: "DETAILS"),
    const Tab(text: "CAST"),
    const Tab(text: "TRAILERS"),
    const Tab(text: "SUGGESTIONS"),
  ];

  @override
  void initState() {
    super.initState();
    final notifier = ref.read(movieInfoProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.getMovieInfo(movieId: widget.movieId);
    });

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  int _selectedTabBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Consumer(
        builder: (_, ref, __) {
          final movieInfo = ref.watch(movieInfoProvider);
          if (movieInfo is MovieInfoLoading) {
            return const CupertinoActivityIndicator(
              color: Colors.red,
            );
          } else if (movieInfo is MovieInfoLoaded) {
            final movie = movieInfo.movie;

            final List genres =
                movie.genres.map((item) => item['name']).toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://www.themoviedb.org/t/p/original/${movieInfo.movie.backdropPath}",
                    height: 340,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieInfo.movie.title,
                          style: AppTextTheme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          children: [
                            Text(
                              DateFormat('y')
                                  .format(DateTime.parse(movie.releaseDate)),
                              style: AppTextTheme.textTheme.bodySmall,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "•",
                              style: AppTextTheme.textTheme.bodySmall,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "${movie.runtime} Minutes",
                              style: AppTextTheme.textTheme.bodySmall,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "•",
                              style: AppTextTheme.textTheme.bodySmall,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              genres
                                  .toString()
                                  .substring(1, genres.toString().length - 1),
                              style: AppTextTheme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {},
                                child: const Text(
                                  "Watch Trailer",
                                  style: TextStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            const DIconButton(icon: "add"),
                            const SizedBox(width: 14),
                            const DIconButton(icon: "download"),
                            const SizedBox(width: 14),
                            const DIconButton(icon: "external-link"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          movieInfo.movie.tagline,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 31),
                  SizedBox(
                    height: 36,
                    child: TabBar(
                      controller: _tabController,
                      tabs: _tabs,
                      onTap: (index) {
                        setState(() => _selectedTabBar = index);
                      },
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3.86,
                      indicatorColor: AppColors.white,
                      unselectedLabelColor: AppColors.grey,
                      labelColor: AppColors.white,
                      labelStyle: tabItemStyle,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 18),
                    ),
                  ),
                  Builder(builder: (_) {
                    if (_selectedTabBar == 0) {
                      return DetailsTabView(
                        title: movie.title,
                        overview: movie.overview,
                        year: movie.releaseDate,
                        genre: genres,
                        budget: movie.budget,
                        revenue: movie.revenue,
                        runtime: movie.runtime,
                      );
                    } else if (_selectedTabBar == 1) {
                      return CastTabView(
                        movieId: movie.id,
                      );
                    } else if (_selectedTabBar == 2) {
                      return Container();
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
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
