import 'package:flutter/material.dart';
import 'package:google_play_book3/models/book_model.dart';
import 'package:google_play_book3/widgets/book_category_section.dart';
import 'package:google_play_book3/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Book> _fiction = [
    Book(
      id: '1',
      title: 'Selamat Tinggal',
      author: 'Tere Liye',
      coverImage: 'assets/images/selamat_tinggal.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '2',
      title: 'Semua Karena Cinta',
      author: 'Eddy Nugroho',
      coverImage: 'assets/images/karena_cinta.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '3',
      title: 'Dipersulit oleh Pikiran Sendiri',
      author: 'Eddy Nugroho',
      coverImage: 'assets/images/dipersulit_oleh_pikiran_sendiri.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '4',
      title: 'Hujan Terakhir: Cerita Pendek',
      author: 'Shabrina Kasmira',
      coverImage: 'assets/images/hujan_terakhir.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '5',
      title: 'Merah Muda',
      author: 'Faiha Khansa Alifah',
      coverImage: 'assets/images/merah_muda.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,

    ),
    Book(
      id: '6',
      title: 'Saat Abraham BERCERITA Tentang Bintang-Bintang di Malam Itu',
      author: 'Janta Andri Imulyi',
      coverImage: 'assets/images/abraham_bercerita.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
  ];

  final List<Book> _geezAnnBooks = [
    Book(
      id: '7',
      title: 'Geez & Ann #1',
      author: 'Rintik Sedu',
      coverImage: 'assets/images/geez_ann_1.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '8',
      title: 'Geez & Ann #2',
      author: 'Rintik Sedu',
      coverImage: 'assets/images/geez_ann_2.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '9',
      title: 'Geez & Ann #3',
      author: 'Rintik Sedu',
      coverImage: 'assets/images/geez_ann_3.webp',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
  ];

  final List<Book> _recommendedBooks = [
    Book(
      id: '10',
      title: 'Atomic Habits',
      author: 'James Clear',
      coverImage: 'assets/images/AtomicHabits.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Non-Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '11',
      title: 'Cerita Kemal dan Jamaah Masjid',
      author: 'Dais',
      coverImage: 'assets/images/kemal_dan_jamaah.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '12',
      title: 'Lampu Kota',
      author: 'Rahmah Kurniawan',
      coverImage: 'assets/images/lampu_kota.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
  ];

  final List<Book> _tamikochan = [
    Book(
      id: '13',
      title: 'TAMIKO CHAN (Bahasa Indonesia) #1',
      author: 'Missael Alejandro Reyes Burciaga',
      coverImage: 'assets/images/tamiko1.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Komik',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '14',
      title: 'TAMIKO CHAN (Bahasa Indonesia) #2',
      author: 'Missael Alejandro Reyes Burciaga',
      coverImage: 'assets/images/tamiko2.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Komik',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '15',
      title: 'TAMIKO CHAN (Bahasa Indonesia) #3',
      author: 'Missael Alejandro Reyes Burciaga',
      coverImage: 'assets/images/tamiko3.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Komik',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '16',
      title: 'TAMIKO CHAN (Bahasa Indonesia) #4',
      author: 'Missael Alejandro Reyes Burciaga',
      coverImage: 'assets/images/tamiko4.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Komik',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '17',
      title: 'TAMIKO CHAN (Bahasa Indonesia) #5',
      author: 'Missael Alejandro Reyes Burciaga',
      coverImage: 'assets/images/tamiko5.jpg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Komik',
      isInStore: true,
      isWishlisted: false,
    ),
  ];

  final List<Book> _pengasuhandankeluarga = [
    Book(
      id: '18',
      title: 'Ir. Soekarno',
      author:
          'Gilar Gandana, M.Pd. · Nurul Sinta Fauziah · Annisa Sukmawati · Risna Mardalena · Itsna Istiqomah · Dina Fydarliani',
      coverImage: 'assets/images/ir_soekarno.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Biografi',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '19',
      title: 'Pandai Bersyukur',
      author:
          'Gilar Gandana, M.Pd. · Sophia Choirotul Husniyyah · Zahra Ilya Sahara · Nafisah Islamiati · Asri Siti Allawiyyah · Dini Nuraeni Marwa',
      coverImage: 'assets/images/pandai_bersyukur.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Pengembangan Diri',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '20',
      title: 'Anak Hebat Dimulai dari Rumah: Cara Menanamkan Visi dan Disiplin',
      author: 'Amir Ma`ruf',
      coverImage: 'assets/images/anak_hebat_rumah.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Pengasuhan',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '21',
      title: 'Canggung Merawat Bayi?',
      author: 'Gema Indonesia Menyusui @tipsmenyusui',
      coverImage: 'assets/images/canggung_merawat_bayi.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Pengasuhan',
      isInStore: true,
      isWishlisted: false,
    ),
    Book(
      id: '22',
      title: 'Misteri Bawah Laut: Seri Petualangan Alam Semesta',
      author: 'Yayan Rika Harari',
      coverImage: 'assets/images/bawah_laut_petualangan.jpeg',
      isDownloaded: false,
      progress: 0.0,
      ownership: 'Belum dibaca',
      genre: 'Fiksi',
      isInStore: true,
      isWishlisted: false,
    ),
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
              backgroundImage: AssetImage('assets/images/default_profile.jpg'),
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
          BookCategorySection(title: 'Koleksi Sastra & Fiksi', books: _fiction),
          BookCategorySection(title: 'Geez & Ann Series', books: _geezAnnBooks),
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
        ],
      ),
    );
  }
}
