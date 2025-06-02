import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List<String> categoryName = [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian Pria',
    'Pakaian Wanita',
    'Alat Tulis Kantor',
    'Buku & Majalah',
    'Peralatan Dapur',
    'Makanan Ringan',
    'Minuman',
    'Mainan Anak',
    'Peralatan Olahraga',
    'Produk Kesehatan',
    'Kosmetik',
    'Obat-obatan',
    'Aksesoris Mobil',
    'Perabot Rumah',
    'Sepatu & Sandal',
    'Barang Bekas',
    'Voucher & Tiket',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Custom AppBar color
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: categoryName.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8), // Space between items
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              leading: CircleAvatar(
                backgroundColor:
                    Colors.deepPurpleAccent, // Circle color for index
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                categoryName[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.deepPurple,
                size: 18,
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
