import 'package:flutter/material.dart';

// Fungsi main() sebagai entry point untuk aplikasi Flutter
void main() {
  // Menjalankan aplikasi dengan widget MyApp sebagai root widget
  runApp(const MyApp());
}

// Kelas MyApp sebagai root widget dari aplikasi
class MyApp extends StatelessWidget {
  // Konstruktor const MyApp
  const MyApp({Key? key}) : super(key: key);

  // Metode build untuk membangun tata letak aplikasi
  @override
  Widget build(BuildContext context) {
    // MaterialApp sebagai material app dengan konfigurasi dasar
    return MaterialApp(
      title: 'Navigation Types Example', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna tema utama
      ),
      home: const HomeScreen(), // Halaman utama aplikasi
      routes: {
        '/second': (context) =>
            const SecondScreen(), // Route untuk halaman kedua
        '/third': (context) =>
            const ThirdScreen(), // Route untuk halaman ketiga
      },
    );
  }
}

// Kelas HomeScreen untuk menampilkan tombol navigasi di halaman pertama
class HomeScreen extends StatelessWidget {
  // Konstruktor const HomeScreen
  const HomeScreen({Key? key}) : super(key: key);

  // Metode build untuk membangun tata letak halaman
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Types Example'), // Judul halaman
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigasi ke layar kedua menggunakan Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Navigator.push'), // Tombol navigasi 1
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke layar ketiga dan menggantikan layar sebelumnya menggunakan Navigator.pushReplacement
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );
              },
              child:
                  const Text('Navigator.pushReplacement'), // Tombol navigasi 2
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke layar ketiga menggunakan Navigator.pushNamed
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Navigator.pushNamed'), // Tombol navigasi 3
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas SecondScreen untuk menampilkan halaman kedua dengan tombol kembali
class SecondScreen extends StatelessWidget {
  // Konstruktor const SecondScreen
  const SecondScreen({Key? key}) : super(key: key);

  // Metode build untuk membangun tata letak halaman
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'), // Judul halaman
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Second Screen!',
              style: TextStyle(fontSize: 18),
            ), // Teks sambutan
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kembali ke layar pertama menggunakan Navigator.pop
                Navigator.pop(context);
              },
              child: const Text('Go back'), // Tombol kembali
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas ThirdScreen untuk menampilkan halaman ketiga dengan tombol kembali dan membersihkan tumpukan
class ThirdScreen extends StatelessWidget {
  // Konstruktor const ThirdScreen
  const ThirdScreen({Key? key}) : super(key: key);

  // Metode build untuk membangun tata letak halaman
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'), // Judul halaman
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Third Screen!',
              style: TextStyle(fontSize: 18),
            ), // Teks sambutan
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kembali ke layar pertama dan hapus tumpukan menggunakan Navigator.popUntil
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text(
                  'Go back to Home and clear stack'), // Tombol kembali dan hapus tumpukan
            ),
          ],
        ),
      ),
    );
  }
}
