import 'package:flutter/material.dart';
import 'package:google_play_book3/models/book_model.dart';
import 'package:google_play_book3/services/temp_database.dart';
import 'package:google_play_book3/screens/book_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCollectionScreen extends StatelessWidget {
  const MyCollectionScreen({super.key});

  String getStatus(Book book) {
    if (book.progress == 0.0) return 'Belum Dibaca';
    if (book.progress < 1.0) return 'Sedang Dibaca';
    return 'Selesai Dibaca';
  }

  @override
  Widget build(BuildContext context) {
    final books = TempDatabase.myCollection;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Koleksi Saya"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: books.isEmpty
          ? const Center(child: Text("Belum ada buku di koleksi."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                final progress = (book.progress * 100).toStringAsFixed(0);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BookDetailScreen(book: book)),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 3,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          child: Image.asset(
                            book.coverImage,
                            height: 120,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(book.title,
                                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
                                Text(book.author,
                                    style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                                const SizedBox(height: 6),
                                LinearProgressIndicator(
                                  value: book.progress,
                                  backgroundColor: Colors.grey.shade300,
                                  color: Colors.blue,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Status: ${getStatus(book)} - $progress%",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
