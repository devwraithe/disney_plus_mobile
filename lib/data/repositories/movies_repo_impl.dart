import 'package:dartz/dartz.dart';
import 'package:disney_plus/data/data_source/data_source.dart';
import 'package:disney_plus/domain/entities/movie_entity.dart';
import 'package:disney_plus/domain/repositories/movies_repo.dart';

import '../../core/errors/exception.dart';
import '../../core/errors/failure.dart';

class MoviesRepoImpl extends MoviesRepo {
  final DataSource dataSource;
  MoviesRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPlayingMovies() async {
    try {
      final result = await dataSource.getPlayingMovies();
      return Right(result.map((movie) => movie.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure("error fetching now_playing movies"));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      final result = await dataSource.getPopularMovies();
      return Right(result.map((movie) => movie.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure("error fetching popular movies"));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    try {
      final result = await dataSource.getTopRatedMovies();
      return Right(result.map((movie) => movie.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure("error fetching top rated movies"));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies() async {
    try {
      final result = await dataSource.getUpcomingMovies();
      return Right(result.map((movie) => movie.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure("error fetching upcming movies"));
    }
  }
}
