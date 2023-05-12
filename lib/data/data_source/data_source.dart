import '../models/movie_model.dart';

abstract class DataSource {
  Future<List<MovieModel>> getPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpcomingMovies();
}
