import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppkdjp_flutter/meet_sebelas/helper/db_helper_menu.dart';
import 'package:ppkdjp_flutter/meet_sebelas/model/menu_model.dart';

class AddMenuPage extends StatefulWidget {
  final bool isEdit;
  final MenuModel? menuItem;
  const AddMenuPage({super.key, this.isEdit = false, this.menuItem});

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  bool _isAvailable = true;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.menuItem != null) {
      _nameController.text = widget.menuItem!.name;
      _descController.text = widget.menuItem!.description ?? '';
      _priceController.text = widget.menuItem!.price.toInt().toString();
      _categoryController.text = widget.menuItem!.category ?? '';
      _isAvailable = widget.menuItem!.isAvailable;
      if (widget.menuItem!.imageUrl != null) {
        _selectedImage = File(widget.menuItem!.imageUrl!);
      }
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Remove the selected image
  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  final DbHelperMenu dbHelper = DbHelperMenu();

  Future<void> _saveMenuItem() async {
    if (_formKey.currentState!.validate()) {
      // If editing, pass the current item's id, otherwise leave it null (new item).
      final menuItem = MenuModel(
        id:
            widget.isEdit
                ? widget.menuItem!.id
                : null, // Pass the id for editing
        name: _nameController.text.trim(),
        description: _descController.text.trim(),
        price: double.parse(_priceController.text),
        category: _categoryController.text.trim(),
        isAvailable: _isAvailable,
        imageUrl: _selectedImage?.path,
      );

      try {
        if (widget.isEdit) {
          await DbHelperMenu.updateMenu(menuItem);
        } else {
          await DbHelperMenu.createMenu(menuItem);
        }
        Navigator.pop(context, true); // Return success
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? "Edit Menu" : "Tambah Menu"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama Menu'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                maxLines: 2,
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Harga (Rp)'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Kategori'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child:
                    _selectedImage == null
                        ? Container(
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text("Tap untuk pilih gambar"),
                          ),
                        )
                        : Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                _selectedImage!,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                              onPressed: _removeImage, // Remove the image
                            ),
                          ],
                        ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                activeColor: Colors.deepOrangeAccent,
                title: const Text("Tersedia"),
                value: _isAvailable,
                onChanged: (value) {
                  setState(() {
                    _isAvailable = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMenuItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                child: Text(
                  widget.isEdit ? "Update" : "Simpan",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
