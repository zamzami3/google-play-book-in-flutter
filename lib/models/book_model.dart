class Book {
  final String id;
  final String title;
  final String author;
  final String coverImage;
  final String genre;
  bool isDownloaded;
  double progress;
  String ownership;
  bool isInStore;
  bool isWishlisted;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverImage,
    required this.genre,
    this.isDownloaded = false,
    this.progress = 0.0,
    this.ownership = 'Belum dibaca',
    this.isInStore = true,
    this.isWishlisted = false,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? coverImage,
    String? genre,
    bool? isDownloaded,
    double? progress,
    String? ownership,
    bool? isInStore,
    bool? isWishlisted,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverImage: coverImage ?? this.coverImage,
      genre: genre ?? this.genre,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      progress: progress ?? this.progress,
      ownership: ownership ?? this.ownership,
      isInStore: isInStore ?? this.isInStore,
      isWishlisted: isWishlisted ?? this.isWishlisted,
    );
  }
}