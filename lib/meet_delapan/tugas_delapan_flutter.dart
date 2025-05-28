import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/constant/app_color.dart';
import 'package:ppkdjp_flutter/meet_tujuh/tugas_tujuh_flutter.dart';

class TugasDelapanFlutter extends StatefulWidget {
  const TugasDelapanFlutter({super.key});

  @override
  State<TugasDelapanFlutter> createState() => _TugasDelapanFlutterState();
}

class _TugasDelapanFlutterState extends State<TugasDelapanFlutter> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const TugasTujuhFlutter(), // Halaman dengan Drawer & Form
    const AboutPage(), // Halaman Tentang Aplikasi
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.army1,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Aplikasi Form Input',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Aplikasi ini dibuat untuk mengumpulkan data pengguna melalui form.',
            ),
            SizedBox(height: 20),
            Text('Pembuat: Farah Azhari'),
            Text('Versi: 1.0.0'),
          ],
        ),
      ),
    );
  }
}
