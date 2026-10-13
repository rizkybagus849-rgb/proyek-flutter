
import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetLayoutApp());
}

class WidgetLayoutApp extends StatelessWidget {
  const WidgetLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget dan Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final namaController = TextEditingController();
  final passwordController = TextEditingController();
  String pesan = '';

  @override
  void dispose() {
    namaController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    setState(() {
      if (namaController.text.trim().isEmpty ||
          passwordController.text.isEmpty) {
        pesan = 'Nama pengguna dan password wajib diisi.';
      } else {
        pesan = 'Halo, ${namaController.text}! Login simulasi berhasil.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Widget dan Layout'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Contoh Widget Flutter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.widgets, size: 35, color: Colors.teal),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Flutter menggunakan widget untuk membangun tampilan aplikasi.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.account_balance,
                      size: 75,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Candi Borobudur',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Contoh widget bertingkat yang menggabungkan '
                    'Card, Padding, Column, Container, dan Text.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Login Sederhana',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: namaController,
            decoration: const InputDecoration(
              labelText: 'Nama pengguna',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: login,
            child: const Text('LOGIN'),
          ),
          if (pesan.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(pesan),
            ),
        ],
      ),
    );
  }
}
