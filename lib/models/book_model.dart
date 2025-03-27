class Book {
  final String title;
  final String author;
  final String coverImage;
  final String? genre;

  Book({
    required this.title,
    required this.author,
    required this.coverImage,
    this.genre,
  });
}
