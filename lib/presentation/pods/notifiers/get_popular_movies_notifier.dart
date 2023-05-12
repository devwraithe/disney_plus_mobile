import 'package:disney_plus/domain/entities/movie_entity.dart';
import 'package:disney_plus/domain/usecases/get_popular_movies_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetPopularMoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final GetPopularMoviesUsecase usecase;

  GetPopularMoviesNotifier(this.usecase) : super([]) {
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    final result = await usecase.call();
    result.fold(
      (failure) => debugPrint("error fetching popular movies"),
      (data) => state = data,
    );
  }
}
