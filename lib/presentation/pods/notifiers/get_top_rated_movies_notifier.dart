import 'package:disney_plus/domain/entities/movie_entity.dart';
import 'package:disney_plus/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetTopRatedMoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final GetTopRatedMoviesUsecase usecase;

  GetTopRatedMoviesNotifier(this.usecase) : super([]) {
    getTopRatedMovies();
  }

  Future<void> getTopRatedMovies() async {
    final result = await usecase.call();
    result.fold(
      (failure) => debugPrint("error fetching top rated movies"),
      (data) => state = data,
    );
  }
}
