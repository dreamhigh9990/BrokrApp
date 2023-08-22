class ReviewModel {
  final String id;
  final String writerUsername;
  final double writerRating;
  final String content;
  final String date;

  ReviewModel(
      {required this.id,
      required this.writerUsername,
      required this.writerRating,
      required this.content,
      required this.date});
}
