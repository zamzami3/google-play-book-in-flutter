import 'package:google_play_book3/models/book_model.dart';

class TempDatabase {
  static final List<Book> allBooks = [
    Book(
      id: '1',
      title: 'Selamat Tinggal',
      author: 'Tere Liye',
      coverImage: 'assets/images/selamat_tinggal.jpeg',
      genre: 'Fiksi',
    ),
    Book(
      id: '2',
      title: 'Atomic Habits',
      author: 'James Clear',
      coverImage: 'assets/images/AtomicHabits.jpeg',
      genre: 'Non-Fiksi',
    ),
    Book(
      id: '3',
      title: 'Geez & Ann #1',
      author: 'Rintik Sedu',
      coverImage: 'assets/images/geez_ann_1.jpg',
      genre: 'Romance',
    ),
    Book(
      id: '4',
      title: 'TAMIKO CHAN Vol. 1',
      author: 'Missael Alejandro',
      coverImage: 'assets/images/tamiko1.jpg',
      genre: 'Komik',
    ),
    Book(
      id: '5',
      title: 'Keep The Roses',
      author: 'Pipit Chie',
      coverImage: 'assets/images/keep_the_roses.jpg',
      genre: 'Dewasa Baru',
    ),
  ];

  static List<Book> myCollection = [];

  static List<Book> wishlist = [];

  static void downloadBook(Book book) {
    final downloaded = book.copyWith(isDownloaded: true, progress: 0.0);
    myCollection.add(downloaded);
  }

  static void updateProgress(Book book, double progress) {
    final index = myCollection.indexWhere((b) => b.id == book.id);
    if (index != -1) {
      myCollection[index] = myCollection[index].copyWith(progress: progress);
    }
  }

  static void addToWishlist(Book book) {
    final wish = book.copyWith(isWishlisted: true);
    wishlist.add(wish);
  }

  static void removeFromWishlist(Book book) {
    wishlist.removeWhere((b) => b.id == book.id);
  }

  static bool isInWishlist(Book book) {
    return wishlist.any((b) => b.id == book.id);
  }

  static bool isInCollection(Book book) {
    return myCollection.any((b) => b.id == book.id);
  }

  static Book? getBookById(String id) {
    return allBooks.firstWhere((b) => b.id == id, orElse: () => allBooks[0]);
  }
}
