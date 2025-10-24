import 'package:flutter/material.dart';

// Halaman Profil Pengguna
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          // Header Profil
          const Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=500'),
              ),
              SizedBox(height: 10),
              Text(
                'Freya Jayawardana',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'freyaj@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Menu List
          _buildProfileMenuItem(icon: Icons.person_outline, title: 'Edit Profil'),
          _buildProfileMenuItem(icon: Icons.location_on_outlined, title: 'Alamat Pengiriman'),
          _buildProfileMenuItem(icon: Icons.history, title: 'Riwayat Pesanan'),
          _buildProfileMenuItem(icon: Icons.payment, title: 'Metode Pembayaran'),
          _buildProfileMenuItem(icon: Icons.notifications_outlined, title: 'Notifikasi'),
          _buildProfileMenuItem(icon: Icons.settings_outlined, title: 'Pengaturan'),
          const Divider(),
          _buildProfileMenuItem(icon: Icons.help_outline, title: 'Pusat Bantuan'),
          _buildProfileMenuItem(icon: Icons.logout, title: 'Keluar', isLogout: true),
        ],
      ),
    );
  }

  // Widget helper untuk membuat item menu di profil
  Widget _buildProfileMenuItem({required IconData icon, required String title, bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.grey[600]),
      title: Text(
        title,
        style: TextStyle(color: isLogout ? Colors.red : Colors.black87),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        // Aksi ketika item di-tap
      },
    );
  }
}
