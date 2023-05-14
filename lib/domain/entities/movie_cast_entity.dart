import 'package:equatable/equatable.dart';

class MovieCastEntity extends Equatable {
  final String name, character;
  final String? profilePath;

  const MovieCastEntity({
    required this.name,
    required this.character,
    this.profilePath,
  });

  @override
  List<Object?> get props => [
        name,
        character,
        profilePath,
      ];
}
