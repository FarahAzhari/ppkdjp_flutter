import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/meet_16/database/db_helper.dart';
import 'package:ppkdjp_flutter/meet_16/model/siswa_model.dart';

class SiswaScreen extends StatefulWidget {
  const SiswaScreen({super.key});

  @override
  State<SiswaScreen> createState() => _SiswaScreenState();
}

class _SiswaScreenState extends State<SiswaScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  List<SiswaModel> listSiswa = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await DbHelper.getAllSiswa();
    setState(() {
      listSiswa = data;
    });
  }

  Future<void> saveData() async {
    final name = _nameController.text;
    final age = int.tryParse(_ageController.text) ?? 0;

    if (name.isNotEmpty && age > 0) {
      await DbHelper.createSiswa(SiswaModel(name: name, age: age));
      _nameController.clear();
      _ageController.clear();
      loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pendaftaran Siswa')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Umur'),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: saveData, child: Text('Save')),
            Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: listSiswa.length,
                itemBuilder: (context, index) {
                  final data = listSiswa[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${data.id}')),
                    title: Text(data.name),
                    subtitle: Text('Umur: ${data.age}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
