import 'package:dartz/dartz.dart';
import 'package:disney_plus/core/errors/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/movies_repo_impl.dart';
import '../entities/movie_info_entity.dart';
import '../repositories/movies_repo.dart';

class GetMovieInfoUsecase {
  final MoviesRepo repo;
  GetMovieInfoUsecase(this.repo);

  Future<Either<Failure, MovieInfoEntity>> call(String movieId) async {
    return await repo.getMovieInfo(movieId);
  }
}

// movies repository provider
final movieInfoUsecase = Provider<GetMovieInfoUsecase>(
  (ref) => GetMovieInfoUsecase(
    ref.watch(moviesRepositoryProvider),
  ),
);
