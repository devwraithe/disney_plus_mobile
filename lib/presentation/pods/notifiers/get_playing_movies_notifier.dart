import 'package:disney_plus/domain/entities/movie_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/get_playing_movies_usecase.dart';

class GetPlayingMoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final GetPlayingMoviesUsecase usecase;

  GetPlayingMoviesNotifier(this.usecase) : super([]) {
    getPlayingMovies();
  }

  Future<void> getPlayingMovies() async {
    final result = await usecase.call();
    result.fold(
      (failure) => debugPrint("error fetching now_playing movies"),
      (data) => state = data,
    );
  }
}
