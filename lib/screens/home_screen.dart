import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_play_book3/models/book_model.dart';
import 'package:google_play_book3/widgets/book_category_section.dart';
import 'package:google_play_book3/widgets/bottom_navigation.dart';
import 'package:google_play_book3/screens/book_detail_screen.dart';
import 'package:google_play_book3/screens/profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  // Dummy data buku
  final List<Book> _sastrafictionBooks = [
    Book(title: 'Selamat Tinggal', author: 'Tere Liye', coverImage: 'assets/images/selamat_tinggal.jpeg'),
    Book(title: 'Semua Karena Cinta', author: 'Eddy Nugroho', coverImage: 'assets/images/karena_cinta.jpeg'),
    Book(title: 'Dipersulit oleh Pikiran Sendiri', author: 'Eddy Nugroho', coverImage: 'assets/images/dipersulit_oleh_pikiran_sendiri.jpg'),
    Book(title: 'Hujan Terakhir: Cerita Pendek', author: 'Shabrina Kasmira', coverImage: 'assets/images/hujan_terakhir.jpg'),
    Book(title: 'Merah Muda', author: 'Faiha Khansa Alifah', coverImage: 'assets/images/merah_muda.jpg'),
    Book(title: 'Saat Abraham BERCERITA Tentang Bintang-Bintang di Maalam Itu', author: 'Janta Andri Imulyi', coverImage: 'assets/images/abraham_bercerita.jpg'),
  ];

  final List<Book> _geezAnnBooks = [
    Book(title: 'Geez & Ann #1', author: 'Rintik Sedu', coverImage: 'assets/images/geez_ann_1.jpg'),
    Book(title: 'Geez & Ann #2', author: 'Rintik Sedu', coverImage: 'assets/images/geez_ann_2.jpg'),
    Book(title: 'Geez & Ann #3', author: 'Rintik Sedu', coverImage: 'assets/images/geez_ann_3.webp'),
  ];

  final List<Book> _recommendedBooks = [
    Book(title: 'Atomic Habits', author: 'James Clear', coverImage: 'assets/images/AtomicHabits.jpeg'),
    Book(title: 'Cerita Kemal dan Jamaah Masjid', author: 'Dais', coverImage: 'assets/images/kemal_dan_jamaah.jpg'),
    Book(title: 'Lampu Kota', author: 'Rahmah Kurniawan', coverImage: 'assets/images/lampu_kota.jpeg'),
  ];

  final List<Book> _tamikochan = [
    Book(title: 'TAMIKO CHAN (Bahasa Indonesia) #1', author: 'Missael Alejandro Reyes Burciaga', coverImage: 'assets/images/tamiko1.jpg'),
    Book(title: 'TAMIKO CHAN (Bahasa Indonesia) #2', author: 'Missael Alejandro Reyes Burciaga', coverImage: 'assets/images/tamiko2.jpg'),
    Book(title: 'TAMIKO CHAN (Bahasa Indonesia) #3', author: 'Missael Alejandro Reyes Burciaga', coverImage: 'assets/images/tamiko3.jpg'),
    Book(title: 'TAMIKO CHAN (Bahasa Indonesia) #4', author: 'Missael Alejandro Reyes Burciaga', coverImage: 'assets/images/tamiko4.jpg'),
    Book(title: 'TAMIKO CHAN (Bahasa Indonesia) #5', author: 'Missael Alejandro Reyes Burciaga', coverImage: 'assets/images/tamiko5.jpg'),
  ];

  final List<Book> _pengasuhandankeluarga = [
    Book(title: 'Ir. Soekarno', author: 'Gilar Gandana, M.Pd. · Nurul Sinta Fauziah · Annisa Sukmawati · Risna Mardalena · Itsna Istiqomah · Dina Fydarliani', coverImage: 'assets/images/ir_soekarno.jpeg'),
    Book(title: 'Pandai Bersyukur', author: 'Gilar Gandana, M.Pd. · Sophia Choirotul Husniyyah · Zahra Ilya Sahara · Nafisah Islamiati · Asri Siti Allawiyyah · Dini Nuraeni Marwa', coverImage: 'assets/images/pandai_bersyukur.jpeg'),
    Book(title: 'Anak Hebat Dimulai dari Rumah: Cara Menanamkan Visi dan Disiplin', author: 'Amir Ma`ruf', coverImage: 'assets/images/anak_hebat_rumah.jpeg'),
    Book(title: 'Canggung Merawat Bayi?', author: 'Gema Indonesia Menyusui @tipsmenyusui', coverImage: 'assets/images/canggung_merawat_bayi.jpeg'),
    Book(title: 'Misteri Bawah Laut: Seri Petualangan Alam Semesta', author: 'Yayan Rika Harari', coverImage: 'assets/images/bawah_laut_petualangan.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Telusuri Buku',
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/default_profile.jpeg'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          BookCategorySection(
            title: 'Koleksi Sastra & Fiksi',
            books: _sastrafictionBooks,
          ),
          BookCategorySection(
            title: 'Geez & Ann Series',
            books: _geezAnnBooks,
          ),
          BookCategorySection(
            title: 'Disarankan untuk Anda',
            books: _recommendedBooks,
          ),
          BookCategorySection(
            title: 'Vol - 1 TAMIKO CHAN (Bahasa Indonesia)',
            books: _tamikochan,
          ),
          BookCategorySection(
            title: 'Pengasuhan & Keluarga',
            books: _pengasuhandankeluarga,
          ),
          // Tambahkan kategori lain sesuai kebutuhan
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}