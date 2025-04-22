import 'package:flutter/material.dart';
import 'package:google_play_book3/models/book_model.dart';
import 'package:google_play_book3/services/temp_database.dart';
import 'package:google_play_book3/screens/book_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  String _selectedSort = 'Judul (A-Z)';
  List<Book> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _applySort();
  }

  void _applySort() {
    _filteredBooks = List<Book>.from(TempDatabase.wishlist);

    switch (_selectedSort) {
      case 'Judul (A-Z)':
        _filteredBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Penulis (A-Z)':
        _filteredBooks.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'Genre':
        _filteredBooks.sort((a, b) => a.genre.compareTo(b.genre));
        break;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          // Dropdown Sort
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Text("Urutkan: "),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedSort,
                  items: const [
                    DropdownMenuItem(value: 'Judul (A-Z)', child: Text('Judul (A-Z)')),
                    DropdownMenuItem(value: 'Penulis (A-Z)', child: Text('Penulis (A-Z)')),
                    DropdownMenuItem(value: 'Genre', child: Text('Genre')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      _selectedSort = value;
                      _applySort();
                    }
                  },
                ),
              ],
            ),
          ),

          // List Wishlist
          Expanded(
            child: _filteredBooks.isEmpty
                ? const Center(child: Text("Wishlist kamu masih kosong."))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredBooks.length,
                    itemBuilder: (context, index) {
                      final book = _filteredBooks[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BookDetailScreen(book: book),
                            ),
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
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
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
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold)),
                                      Text(book.author,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey[700])),
                                      const SizedBox(height: 4),
                                      Text("Genre: ${book.genre}",
                                          style: const TextStyle(fontSize: 12)),
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
          ),
        ],
      ),
    );
  }
}
