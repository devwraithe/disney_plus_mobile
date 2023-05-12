import 'package:disney_plus/domain/entities/movie_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/get_upcoming_movies_usecase.dart';

class GetUpcomingMoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final GetUpcomingMoviesUsecase usecase;

  GetUpcomingMoviesNotifier(this.usecase) : super([]) {
    getUpcomingMovies();
  }

  Future<void> getUpcomingMovies() async {
    final result = await usecase.call();
    result.fold(
      (failure) => debugPrint("error fetching upcoming movies"),
      (data) => state = data,
    );
  }
}
