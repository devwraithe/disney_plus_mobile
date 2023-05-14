import 'package:equatable/equatable.dart';

import '../../domain/entities/movie_cast_entity.dart';

class MovieCastModel extends Equatable {
  final String name, character;
  final String? profilePath;

  const MovieCastModel({
    required this.name,
    required this.character,
    this.profilePath,
  });

  factory MovieCastModel.fromJson(Map<String, dynamic> json) {
    return MovieCastModel(
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'],
    );
  }

  MovieCastEntity toEntity() {
    return MovieCastEntity(
      name: name,
      character: character,
      profilePath: profilePath,
    );
  }

  @override
  List<Object?> get props => [
        name,
        character,
        profilePath,
      ];
}
