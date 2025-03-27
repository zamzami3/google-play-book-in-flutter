import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Saya', 
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/default_profile.jpeg'),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 3),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            Text(
              'Hai, User!', 
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10),
            
            Text(
              'User', 
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.grey[700]
              ),
            ),
            Text(
              'user@gmail.com', 
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey[600]
              ),
            ),
            
            const SizedBox(height: 30),
            _buildProfileOption(Icons.person, 'Edit Profil'),
            _buildProfileOption(Icons.settings, 'Pengaturan'),
            _buildProfileOption(Icons.help, 'Bantuan'),
            _buildProfileOption(Icons.logout, 'Keluar')
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: GoogleFonts.roboto(),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
      },
    );
  }
}