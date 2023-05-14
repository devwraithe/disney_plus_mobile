import 'package:disney_plus/data/models/movie_cast_model.dart';

import '../models/movie_info_model.dart';
import '../models/movie_model.dart';

abstract class DataSource {
  Future<List<MovieModel>> getPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<MovieInfoModel> getMovieInfo(String movieId);
  Future<List<MovieCastModel>> getMovieCast(String movieId);
}
