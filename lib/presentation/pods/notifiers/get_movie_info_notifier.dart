import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/get_movie_info_usecase.dart';
import '../states/movie_info_states.dart';

class GetMovieInfoNotifier extends StateNotifier<MovieInfoState> {
  GetMovieInfoNotifier({
    required this.usecase,
  }) : super(const MovieInfoInitial());
  final GetMovieInfoUsecase usecase;

  Future<void> getMovieInfo({required String movieId}) async {
    try {
      state = const MovieInfoLoading();
      final movieInfo = await usecase.call(movieId);
      movieInfo.fold(
        (failure) => MovieInfoError(failure.message),
        (data) => state = MovieInfoLoaded(data),
      );
    } catch (e) {
      state = MovieInfoError(e.toString());
    }
  }
}

// provider for this notifier
final movieInfoProvider =
    StateNotifierProvider<GetMovieInfoNotifier, MovieInfoState>((ref) {
  final usecase = ref.watch(movieInfoUsecase);
  return GetMovieInfoNotifier(usecase: usecase);
});
