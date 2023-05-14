import '../../../domain/entities/movie_info_entity.dart';

abstract class MovieInfoState {
  const MovieInfoState();
}

class MovieInfoInitial extends MovieInfoState {
  const MovieInfoInitial();
}

class MovieInfoLoading extends MovieInfoState {
  const MovieInfoLoading();
}

class MovieInfoLoaded extends MovieInfoState {
  final MovieInfoEntity movie;
  MovieInfoLoaded(this.movie);
}

class MovieInfoError extends MovieInfoState {
  final String message;
  const MovieInfoError(this.message);
}
