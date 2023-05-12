import 'package:disney_plus/data/repositories/movies_repo_impl.dart';
import 'package:disney_plus/domain/entities/movie_entity.dart';
import 'package:disney_plus/domain/usecases/get_playing_movies_usecase.dart';
import 'package:disney_plus/domain/usecases/get_popular_movies_usecase.dart';
import 'package:disney_plus/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:disney_plus/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:disney_plus/presentation/pods/notifiers/get_playing_movies_notifier.dart';
import 'package:disney_plus/presentation/pods/notifiers/get_popular_movies_notifier.dart';
import 'package:disney_plus/presentation/pods/notifiers/get_upcoming_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../data/data_source/data_source_impl.dart';
import 'notifiers/get_top_rated_movies_notifier.dart';

final moviesRepo = Provider<MoviesRepoImpl>((ref) {
  final dataSource = ref.watch(Provider<DataSourceImpl>((ref) {
    return DataSourceImpl(http.Client());
  }));
  return MoviesRepoImpl(dataSource);
});

// === now playing movies === //
// usecase
final getPlayingMoviesUsecase = Provider<GetPlayingMoviesUsecase>((ref) {
  final repository = ref.watch(moviesRepo);
  return GetPlayingMoviesUsecase(repository);
});

// notifiers
final getPlayingMoviesProvider = StateNotifierProvider.autoDispose<
    GetPlayingMoviesNotifier, List<MovieEntity>>(
  (ref) => GetPlayingMoviesNotifier(
    ref.watch(getPlayingMoviesUsecase),
  ),
);

// === popular movies === //
// usecase
final getPopularMoviesUsecase = Provider<GetPopularMoviesUsecase>((ref) {
  final repository = ref.watch(moviesRepo);
  return GetPopularMoviesUsecase(repository);
});

// notifiers
final getPopularMoviesNotifier = StateNotifierProvider.autoDispose<
    GetPopularMoviesNotifier, List<MovieEntity>>(
  (ref) => GetPopularMoviesNotifier(
    ref.watch(getPopularMoviesUsecase),
  ),
);

// === top rated movies === //
final getTopRatedMoviesUsecase = Provider<GetTopRatedMoviesUsecase>((ref) {
  final repository = ref.watch(moviesRepo);
  return GetTopRatedMoviesUsecase(repository);
});

final getTopRatedMoviesNotifier = StateNotifierProvider.autoDispose<
    GetTopRatedMoviesNotifier, List<MovieEntity>>(
  (ref) => GetTopRatedMoviesNotifier(
    ref.watch(getTopRatedMoviesUsecase),
  ),
);

// === upcoming movies === //
final getUpcomingMoviesUsecase = Provider<GetUpcomingMoviesUsecase>((ref) {
  final repository = ref.watch(moviesRepo);
  return GetUpcomingMoviesUsecase(repository);
});

final getUpcomingMoviesNotifier = StateNotifierProvider.autoDispose<
    GetUpcomingMoviesNotifier, List<MovieEntity>>(
  (ref) => GetUpcomingMoviesNotifier(
    ref.watch(getUpcomingMoviesUsecase),
  ),
);
