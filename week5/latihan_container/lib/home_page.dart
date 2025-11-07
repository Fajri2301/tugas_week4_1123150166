import 'package:flutter/material.dart';

// Model data untuk sebuah produk
class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double rating;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}

// Halaman utama marketplace
class MarketplaceHomePage extends StatefulWidget {
  const MarketplaceHomePage({super.key});

  @override
  State<MarketplaceHomePage> createState() => _MarketplaceHomePageState();
}

class _MarketplaceHomePageState extends State<MarketplaceHomePage> {
  int _selectedIndex = 0;

  // Daftar dummy untuk kategori
  final List<String> _categories = [
    'Elektronik',
    'Fashion',
    'Rumah',
    'Kecantikan',
    'Olahraga',
    'Buku'
  ];

  // Daftar dummy untuk produk
  final List<Product> _products = [
    Product(name: 'Laptop Pro 15"', imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500', price: 1200.00, rating: 4.8),
    Product(name: 'Smartphone X', imageUrl: 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=500', price: 850.00, rating: 4.7),
    Product(name: 'Headphone Beats', imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500', price: 250.00, rating: 4.9),
    Product(name: 'Kamera Mirrorless', imageUrl: 'https://images.unsplash.com/photo-1519638831568-d9897f54ed69?w=500', price: 950.00, rating: 4.6),
    Product(name: 'Sepatu Lari', imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500', price: 120.00, rating: 4.5),
    Product(name: 'Smartwatch 2', imageUrl: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500', price: 300.00, rating: 4.7),
  ];

  // Daftar halaman yang akan ditampilkan oleh BottomNavigationBar
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageBody(), // Body untuk tab Beranda
    Text('Halaman Kategori'), // Placeholder untuk tab Kategori
    Text('Halaman Keranjang'), // Placeholder untuk tab Keranjang
    Text('Halaman Profil'), // Placeholder untuk tab Profil
  ];

  void _onItemTapped(int index) {
    // Navigasi ke halaman profil jika tab profil ditekan
    if (index == 3) {
      Navigator.pushNamed(context, '/profile');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // Tampilkan body sesuai dengan item yang dipilih di navbar
      body: _selectedIndex == 0 ? const HomePageBody() : Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        'TokoKeren',
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black54),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black54),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Kategori',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Keranjang',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}

// Body utama dari halaman Beranda, dipisahkan agar rapi
class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  // Daftar dummy untuk kategori (bisa diambil dari state di atas jika diperlukan)
  final List<String> get _categories => const [
    'Elektronik',
    'Fashion',
    'Rumah',
    'Kecantikan',
    'Olahraga',
    'Buku'
  ];

  // Daftar dummy untuk produk (bisa diambil dari state di atas jika diperlukan)
  List<Product> get _products => [
    Product(name: 'Laptop Pro 15"', imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500', price: 1200.00, rating: 4.8),
    Product(name: 'Smartphone X', imageUrl: 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=500', price: 850.00, rating: 4.7),
    Product(name: 'Headphone Beats', imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500', price: 250.00, rating: 4.9),
    Product(name: 'Kamera Mirrorless', imageUrl: 'https://images.unsplash.com/photo-1519638831568-d9897f54ed69?w=500', price: 950.00, rating: 4.6),
    Product(name: 'Sepatu Lari', imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500', price: 120.00, rating: 4.5),
    Product(name: 'Smartwatch 2', imageUrl: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500', price: 300.00, rating: 4.7),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(),
                _buildSectionTitle('Kategori'),
                _buildCategoryList(),
                _buildSectionTitle('Penawaran Spesial'),
                _buildPromoBanner(),
                _buildSectionTitle('Produk Unggulan'),
                _buildProductGrid(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari produk...',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 16.0 : 8.0, right: index == _categories.length - 1 ? 16.0 : 0),
            child: Chip(
              label: Text(_categories[index]),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.grey[300]!)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Image.network(
          'https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?w=800',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(product.rating.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
