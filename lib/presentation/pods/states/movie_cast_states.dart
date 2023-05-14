import '../../../domain/entities/movie_cast_entity.dart';

abstract class MovieCastState {
  const MovieCastState();
}

class MovieCastInitial extends MovieCastState {
  const MovieCastInitial();
}

class MovieCastLoading extends MovieCastState {
  const MovieCastLoading();
}

class MovieCastLoaded extends MovieCastState {
  final List<MovieCastEntity> movie;
  MovieCastLoaded(this.movie);
}

class MovieCastError extends MovieCastState {
  final String message;
  const MovieCastError(this.message);
}
