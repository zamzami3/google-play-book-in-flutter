import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_play_book3/models/book_model.dart';
import 'package:google_play_book3/screens/book_detail_screen.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final bool showProgress;

  const BookCard({Key? key, required this.book, this.showProgress = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: book),
          ),
        );
      },
    child: Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              book.coverImage,
              width: 120,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          if (showProgress)
            LinearProgressIndicator(
              value: 0.0,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          const SizedBox(height: 5),
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    )
    );
  }
}
