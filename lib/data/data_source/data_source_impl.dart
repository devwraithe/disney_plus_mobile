import 'dart:convert';

import 'package:disney_plus/data/data_source/data_source.dart';
import 'package:disney_plus/data/models/movie_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../core/api/api_paths.dart';
import '../../core/errors/exception.dart';
import '../models/movie_cast_model.dart';
import '../models/movie_model.dart';

class DataSourceImpl implements DataSource {
  final http.Client client;
  const DataSourceImpl(this.client);

  @override
  Future<List<MovieModel>> getPlayingMovies() async {
    final http.Response response = await client.get(
      Uri.parse(Api.nowPlayingMovies),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> movies = data.map<MovieModel>((movie) {
        return MovieModel.fromJson(movie);
      }).toList();
      return movies;
    } else {
      throw const ServerException("error fetching playing movies");
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final http.Response response = await client.get(
      Uri.parse(Api.popularMovies),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> movies = data.map<MovieModel>((movie) {
        return MovieModel.fromJson(movie);
      }).toList();
      return movies;
    } else {
      throw const ServerException("error fetching popular movies");
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final http.Response response = await client.get(
      Uri.parse(Api.topRatedMovies),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> movies = data.map<MovieModel>((movie) {
        return MovieModel.fromJson(movie);
      }).toList();
      return movies;
    } else {
      throw const ServerException("error fetching top rated movies");
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    final http.Response response = await client.get(
      Uri.parse(Api.upcomingMovies),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> movies = data.map<MovieModel>((movie) {
        return MovieModel.fromJson(movie);
      }).toList();
      return movies;
    } else {
      throw const ServerException("error fetching upcoming movies");
    }
  }

  @override
  Future<MovieInfoModel> getMovieInfo(String movieId) async {
    final http.Response response = await client.get(
      Uri.parse(Api.movieInfo(movieId)),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MovieInfoModel.fromJson(data);
    } else {
      throw const ServerException("error fetching upcoming movies");
    }
  }

  @override
  Future<List<MovieCastModel>> getMovieCast(String movieId) async {
    final http.Response response = await client.get(
      Uri.parse(Api.movieCast(movieId)),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['cast'];
      List<MovieCastModel> cast = data.map<MovieCastModel>((cast) {
        return MovieCastModel.fromJson(cast);
      }).toList();
      return cast;
    } else {
      throw const ServerException("error fetching upcoming movies");
    }
  }
}

// movies datasource provider
final moviesDataSourceProvider = Provider<DataSourceImpl>(
  (ref) => DataSourceImpl(
    http.Client(),
  ),
);
