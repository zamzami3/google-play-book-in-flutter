import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_play_book3/services/temp_database.dart';
import 'package:google_play_book3/screens/book_detail_screen.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  final List<String> tabs = const [
    'Ebook Terlaris',
    'Ebook Promo',
    'Ebook Baru',
    'Ebook Gratis',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Belanja"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            indicatorColor: Colors.blue,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) => BookListTab(title: tab)).toList(),
        ),
      ),
    );
  }
}

class BookListTab extends StatelessWidget {
  final String title;

  const BookListTab({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final books = TempDatabase.allBooks;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
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
            elevation: 2,
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
                        Text(book.title, style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
                        Text(book.author,
                            style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                        const SizedBox(height: 4),
                        Text("Genre: ${book.genre}", style: const TextStyle(fontSize: 12)),
                        Text("Kategori: $title", style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
