import 'package:dartz/dartz.dart';
import 'package:disney_plus/domain/entities/movie_entity.dart';

import '../../core/errors/failure.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<MovieEntity>>> getPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies();
}
