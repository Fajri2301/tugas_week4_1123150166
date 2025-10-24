import 'package:flutter/material.dart';
import 'package:latihan_container/home_page.dart';
import 'package:latihan_container/profile_page.dart';
import 'package:latihan_container/splash_screen.dart';

// Fungsi utama yang akan dijalankan pertama kali
void main() {
  runApp(const MyApp());
}

// Kelas MyApp adalah widget utama dari aplikasi ini
class MyApp extends StatelessWidget {
  // Konstruktor untuk kelas MyApp
  const MyApp({super.key});

  // Metode build akan dipanggil oleh Flutter framework untuk merender UI
  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah widget dasar untuk aplikasi yang menggunakan Material Design
    return MaterialApp(
      // Judul aplikasi
      title: "Marketplace Keren",
      // Menyembunyikan banner debug
      debugShowCheckedModeBanner: false,
      // Tema global aplikasi
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins', // Menggunakan font Poppins
      ),
      // Halaman awal yang akan ditampilkan
      initialRoute: '/',
      // Definisi rute navigasi aplikasi
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MarketplaceHomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
