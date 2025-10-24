import 'package:flutter/material.dart';

// Halaman awal aplikasi (Splash Screen)
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang senada dengan tema
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar karakter (placeholder dari network)
              // TODO: Ganti dengan gambar lokal dari assets
              // Contoh: Image.asset('assets/character.png')
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/189/189713.png',
                height: 250,
              ),
              const SizedBox(height: 40),

              // Judul atau sapaan
              const Text(
                'Selamat Datang di TokoKeren',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Temukan semua kebutuhanmu di sini!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 60),

              // Tombol untuk melanjutkan ke halaman utama
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman utama dan hapus halaman ini dari tumpukan
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
