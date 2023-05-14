import 'package:dartz/dartz.dart';
import 'package:disney_plus/core/errors/failure.dart';
import 'package:disney_plus/domain/entities/movie_cast_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/movies_repo_impl.dart';
import '../repositories/movies_repo.dart';

class GetMovieCastUsecase {
  final MoviesRepo repo;
  GetMovieCastUsecase(this.repo);

  Future<Either<Failure, List<MovieCastEntity>>> call(String movieId) async {
    return await repo.getMovieCast(movieId);
  }
}

// movies repository provider
final movieCastUsecase = Provider<GetMovieCastUsecase>(
  (ref) => GetMovieCastUsecase(ref.watch(moviesRepositoryProvider)),
);
