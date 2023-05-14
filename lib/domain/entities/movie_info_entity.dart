import 'package:equatable/equatable.dart';

class MovieInfoEntity extends Equatable {
  final int id, budget, revenue, runtime;
  final String title, tagline, overview, posterPath, backdropPath, releaseDate;
  final List genres, productionCompanies;

  const MovieInfoEntity({
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
