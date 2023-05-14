import 'package:equatable/equatable.dart';

import '../../domain/entities/movie_info_entity.dart';

class MovieInfoModel extends Equatable {
  final int id, budget, revenue, runtime;
  final String title, tagline, overview, posterPath, backdropPath, releaseDate;
  final List genres, productionCompanies;

  const MovieInfoModel({
    required this.id,
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.title,
    required this.tagline,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.genres,
    required this.productionCompanies,
  });

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) {
    return MovieInfoModel(
      id: json['id'],
      budget: json['budget'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      title: json['title'],
      tagline: json['tagline'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      genres: json['genres'],
      productionCompanies: json['production_companies'],
    );
  }

  MovieInfoEntity toEntity() {
    return MovieInfoEntity(
      id: id,
      budget: budget,
      revenue: revenue,
      runtime: runtime,
      title: title,
      tagline: tagline,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      genres: genres,
      productionCompanies: productionCompanies,
    );
  }

  @override
  List<Object?> get props => [
        id,
        budget,
        revenue,
        runtime,
        title,
        overview,
        posterPath,
        backdropPath,
        releaseDate,
        genres,
        productionCompanies,
      ];
}
