import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/meet_sembilan/tugas_sembilan/model_widget.dart';

class ListMap extends StatefulWidget {
  const ListMap({super.key});

  @override
  State<ListMap> createState() => _ListMapState();
}

class _ListMapState extends State<ListMap> {
  List<Map<String, dynamic>> dataCategory = [
    {
      'categoryName': 'Buah-buahan',
      'icon': Icons.apple,
      'description': 'Berbagai jenis buah segar dan lokal.',
    },
    {
      'categoryName': 'Sayuran',
      'icon': Icons.eco,
      'description': 'Sayuran segar untuk kebutuhan sehari-hari.',
    },
    {
      'categoryName': 'Elektronik',
      'icon': Icons.electrical_services,
      'description': 'Peralatan elektronik dan gadget modern.',
    },
    {
      'categoryName': 'Pakaian Pria',
      'icon': Icons.male,
      'description': 'Koleksi busana dan aksesoris pria.',
    },
    {
      'categoryName': 'Pakaian Wanita',
      'icon': Icons.female,
      'description': 'Pakaian dan fashion untuk wanita.',
    },
    {
      'categoryName': 'Alat Tulis Kantor',
      'icon': Icons.edit,
      'description': 'Perlengkapan tulis dan perlengkapan kantor.',
    },
    {
      'categoryName': 'Buku & Majalah',
      'icon': Icons.book,
      'description': 'Buku bacaan, majalah, dan literatur lainnya.',
    },
    {
      'categoryName': 'Peralatan Dapur',
      'icon': Icons.kitchen,
      'description': 'Alat masak dan perlengkapan dapur.',
    },
    {
      'categoryName': 'Makanan Ringan',
      'icon': Icons.fastfood,
      'description': 'Camilan, keripik, dan makanan ringan lainnya.',
    },
    {
      'categoryName': 'Minuman',
      'icon': Icons.local_drink,
      'description': 'Minuman ringan, jus, dan air mineral.',
      'route': ModelWidget(),
    },
    {
      'categoryName': 'Mainan Anak',
      'icon': Icons.toys,
      'description': 'Mainan edukatif dan hiburan untuk anak-anak.',
    },
    {
      'categoryName': 'Peralatan Olahraga',
      'icon': Icons.fitness_center,
      'description': 'Peralatan dan perlengkapan olahraga.',
    },
    {
      'categoryName': 'Produk Kesehatan',
      'icon': Icons.health_and_safety,
      'description': 'Produk untuk mendukung kesehatan dan kebugaran.',
    },
    {
      'categoryName': 'Kosmetik',
      'icon': Icons.brush,
      'description': 'Produk kecantikan dan perawatan kulit.',
    },
    {
      'categoryName': 'Obat-obatan',
      'icon': Icons.medication,
      'description': 'Obat-obatan dan suplemen kesehatan.',
    },
    {
      'categoryName': 'Aksesoris Mobil',
      'icon': Icons.directions_car,
      'description': 'Aksesoris dan perlengkapan kendaraan.',
    },
    {
      'categoryName': 'Perabot Rumah',
      'icon': Icons.chair,
      'description': 'Furniture dan perabot rumah tangga.',
    },
    {
      'categoryName': 'Sepatu & Sandal',
      'icon': Icons.hiking,
      'description': 'Koleksi sepatu dan sandal untuk segala usia.',
    },
    {
      'categoryName': 'Barang Bekas',
      'icon': Icons.recycling,
      'description': 'Produk bekas layak pakai dan ramah kantong.',
    },
    {
      'categoryName': 'Voucher & Tiket',
      'icon': Icons.confirmation_num,
      'description': 'Voucher belanja, tiket konser, dan lainnya.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text("List in Map")),
      body: ListView.builder(
        itemCount: dataCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple.shade50,
              child: Icon(
                dataCategory[index]['icon'],
                color: Colors.deepPurple,
              ),
            ),
            title: Text(
              dataCategory[index]['categoryName'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              dataCategory[index]['description'],
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
            onTap: () {
              // handle tap if needed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => dataCategory[index]["route"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
