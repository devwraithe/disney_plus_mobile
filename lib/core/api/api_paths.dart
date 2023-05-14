class Api {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = "af233f03d0ac4520aa6ac7eeec7339ca";
  static const language = "en-US";
  static const attachment = "?api_key=$apiKey&language=$language&page=1";

  static String get nowPlayingMovies => '$baseUrl/movie/now_playing$attachment';
  static String get popularMovies => '$baseUrl/movie/popular$attachment';
  static String get topRatedMovies => '$baseUrl/movie/top_rated$attachment';
  static String get upcomingMovies => '$baseUrl/movie/upcoming$attachment';

  static String movieInfo(String movieId) =>
      '$baseUrl/movie/$movieId$attachment';
  static String movieCast(String movieId) =>
      '$baseUrl/movie/$movieId/credits$attachment';
}
