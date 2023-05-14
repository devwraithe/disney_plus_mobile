import 'package:disney_plus/presentation/pods/states/movie_cast_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/get_movie_cast_usecase.dart';

class GetMovieCastNotifier extends StateNotifier<MovieCastState> {
  GetMovieCastNotifier({
    required this.usecase,
  }) : super(const MovieCastInitial());
  final GetMovieCastUsecase usecase;

  Future<void> getMovieCast({required String movieId}) async {
    // try {
    state = const MovieCastLoading();
    final movieInfo = await usecase.call(movieId);
    movieInfo.fold(
      (failure) => MovieCastError(failure.message),
      (data) => state = MovieCastLoaded(data),
    );
    // } catch (e) {
    //   state = MovieCastError(e.toString());
    // }
  }
}

// provider for this notifier
final movieCastProvider =
    StateNotifierProvider<GetMovieCastNotifier, MovieCastState>((ref) {
  final usecase = ref.watch(movieCastUsecase);
  return GetMovieCastNotifier(usecase: usecase);
});
