import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/meet_sebelas/helper/db_helper_menu.dart';
import 'package:ppkdjp_flutter/meet_sebelas/model/menu_model.dart';
import 'package:ppkdjp_flutter/meet_sebelas/tugas_sebelas_flutter/add_menu_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final DbHelperMenu dbHelper = DbHelperMenu();
  List<MenuModel> menuItems = [];

  @override
  void initState() {
    super.initState();
    loadMenuItems();
  }

  Future<void> loadMenuItems() async {
    final data = await DbHelperMenu.getAllMenu();
    setState(() {
      menuItems = data;
    });
  }

  Widget _buildMenuCard(MenuModel item) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  item.imageUrl != null && item.imageUrl!.isNotEmpty
                      ? Image.file(
                        File(item.imageUrl!),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      )
                      : Image.asset(
                        'assets/images/placeholder.png', // Your default image
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
            ),
            const SizedBox(width: 12),

            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  item.description != null && item.description!.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(item.description!),
                      )
                      : Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('Deskripsi: -'),
                      ),
                  const SizedBox(height: 4),
                  Text("Harga: Rp${item.price.toStringAsFixed(0)}"),
                  item.category != null && item.category!.isNotEmpty
                      ? Text("Kategori: ${item.category}")
                      : Text("Kategori: -"),
                  Text(
                    item.isAvailable ? "Tersedia" : "Stok Habis",
                    style: TextStyle(
                      color: item.isAvailable ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                // Edit Button
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => AddMenuPage(
                              isEdit: true,
                              menuItem: item, // Pass the menu item for editing
                            ),
                      ),
                    );
                    if (result == true) {
                      loadMenuItems(); // Refresh if item was edited
                    }
                  },
                ),
                // Delete Button
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    bool shouldDelete = await showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text('Konfirmasi Hapus'),
                            content: const Text(
                              'Apakah Anda yakin ingin menghapus menu ini?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text(
                                  'Batal',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text(
                                  'Hapus',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    );
                    if (shouldDelete) {
                      await DbHelperMenu.deleteMenu(item.id!);
                      loadMenuItems(); // Refresh after delete
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        title: const Text(
          "Menu Restoran",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body:
          menuItems.isEmpty
              ? const Center(child: Text("Belum ada menu."))
              : ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return _buildMenuCard(menuItems[index]);
                },
              ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddMenuPage()),
          );
          if (result == true) {
            loadMenuItems(); // Refresh if item was added
          }
        }, // Replace with form later
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Tambah Menu", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
