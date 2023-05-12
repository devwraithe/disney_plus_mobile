import 'package:cached_network_image/cached_network_image.dart';
import 'package:disney_plus/core/theme/app_theme.dart';
import 'package:disney_plus/domain/entities/movie_entity.dart';
import 'package:disney_plus/presentation/pods/providers.dart';
import 'package:disney_plus/presentation/widgets/horizontal_list.dart';
import 'package:disney_plus/presentation/widgets/macro_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.914,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 26),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/vectors/disney.svg',
                      width: 68,
                      height: 24,
                    ),
                    SvgPicture.asset(
                      'assets/vectors/notification.svg',
                      width: 24,
                      height: 24,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Consumer(
                builder: (_, ref, __) {
                  final nowPlayingMovies = ref.watch(getPlayingMoviesProvider);

                  return nowPlayingMovies.isEmpty
                      ? const MacroShimmerLoading()
                      : SizedBox(
                          height: 210,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: nowPlayingMovies.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildCard(nowPlayingMovies, index);
                            },
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        );
                },
              ),
              const SizedBox(height: 32),
              Consumer(builder: (_, ref, __) {
                final popularMovies = ref.watch(getPopularMoviesNotifier);
                final topRatedMovies = ref.watch(getTopRatedMoviesNotifier);
                final upcomingMovies = ref.watch(getUpcomingMoviesNotifier);

                return Column(
                  children: [
                    HorizontalList(
                      title: "Popular from Disney",
                      movies: popularMovies,
                    ),
                    const SizedBox(height: 22),
                    HorizontalList(
                      title: "Top Rated from Disney",
                      movies: topRatedMovies,
                    ),
                    const SizedBox(height: 22),
                    HorizontalList(
                      title: "Upcoming from Disney",
                      movies: upcomingMovies,
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(final List<MovieEntity> movies, int index) {
    final movie = movies[index];

    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double scale = 1.0;
        if (_pageController.position.haveDimensions) {
          final double currentPage = _pageController.page ?? 0.0;
          scale = 1.0 - ((currentPage - index).abs() * 0.2);
          scale = scale.clamp(0.946, 1.0);
        }
        return Transform.scale(
          scale: scale,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: _pageController.position.haveDimensions ? 0 : 6.4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
