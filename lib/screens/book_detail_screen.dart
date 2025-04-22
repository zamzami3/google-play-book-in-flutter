import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_play_book3/models/book_model.dart';
import 'package:google_play_book3/services/temp_database.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  late Book currentBook;

  @override
  void initState() {
    super.initState();
    currentBook = widget.book;

    if (TempDatabase.isInCollection(currentBook)) {
      currentBook = TempDatabase.myCollection.firstWhere((b) => b.id == currentBook.id);
    }
  }

  void handleDownload() {
    setState(() {
      TempDatabase.downloadBook(currentBook);
      currentBook = currentBook.copyWith(isDownloaded: true, progress: 0.0);
    });
  }

  void handleStartReading() {
    setState(() {
      double newProgress = (currentBook.progress + 0.25).clamp(0.0, 1.0);
      TempDatabase.updateProgress(currentBook, newProgress);
      currentBook = currentBook.copyWith(progress: newProgress);
    });
  }

  void toggleWishlist() {
    setState(() {
      if (TempDatabase.isInWishlist(currentBook)) {
        TempDatabase.removeFromWishlist(currentBook);
        currentBook = currentBook.copyWith(isWishlisted: false);
      } else {
        TempDatabase.addToWishlist(currentBook);
        currentBook = currentBook.copyWith(isWishlisted: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final progressText = (currentBook.progress * 100).toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentBook.title),
        actions: [
          IconButton(
            icon: Icon(
              currentBook.isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: currentBook.isWishlisted ? Colors.red : Colors.grey,
            ),
            onPressed: toggleWishlist,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                currentBook.coverImage,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(currentBook.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('by ${currentBook.author}', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.category, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(currentBook.genre),
              ],
            ),
            const SizedBox(height: 10),
            if (currentBook.isDownloaded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                    value: currentBook.progress,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 5),
                  Text("Progress membaca: $progressText%"),
                ],
              ),
            const SizedBox(height: 20),
            _buildSectionHeader('About this eBook'),
            const SizedBox(height: 8),
            Text(
              'Contains two life motivation and romance short stories',
              style: GoogleFonts.roboto(
                fontSize: 14, 
                color: Colors.grey[800],
              ),
            ),
            const Divider(height: 32, thickness: 1),
            _buildSectionHeader('Ratings and Reviews'),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '4.6',
                  style: GoogleFonts.roboto(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRatingBar(5, 55),
                      _buildRatingBar(4, 25),
                      _buildRatingBar(3, 10),
                      _buildRatingBar(2, 5),
                      _buildRatingBar(1, 6),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: currentBook.isDownloaded ? handleStartReading : handleDownload,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(currentBook.isDownloaded ? "Baca Sekarang" : "Get Free"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$stars ★', 
            style: GoogleFonts.roboto(
              fontSize: 12, 
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
