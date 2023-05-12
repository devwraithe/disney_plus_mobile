import 'package:dartz/dartz.dart';
import 'package:disney_plus/core/errors/failure.dart';
import 'package:disney_plus/domain/entities/movie_entity.dart';

import '../repositories/movies_repo.dart';

class GetUpcomingMoviesUsecase {
  final MoviesRepo repo;
  GetUpcomingMoviesUsecase(this.repo);

  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await repo.getUpcomingMovies();
  }
}
