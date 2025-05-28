import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //date formatting
import 'package:ppkdjp_flutter/constant/app_color.dart';
import 'package:ppkdjp_flutter/constant/app_style.dart';

class TugasTujuhFlutter extends StatefulWidget {
  const TugasTujuhFlutter({super.key});
  @override
  State<TugasTujuhFlutter> createState() => _TugasTujuhFlutterState();
}

class _TugasTujuhFlutterState extends State<TugasTujuhFlutter> {
  // Navigation index for Drawer
  int _selectedMenuIndex = 0;

  // Variables for input states
  bool _isChecked = false;
  bool _isDarkMode = false;
  String? _selectedCategory;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Menu titles for drawer
  List<Widget> get _menuTitles => [
    Center(
      child: Text(
        'Syarat dan Ketentuan',
        style: AppStyle.fontBold().copyWith(
          fontSize: 24,
          color: _isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    ),
    Center(
      child: Text(
        'Mode Gelap',
        style: AppStyle.fontBold().copyWith(
          fontSize: 24,
          color: _isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    ),
    Center(
      child: Text(
        'Pilih Kategori Produk',
        style: AppStyle.fontBold().copyWith(
          fontSize: 24,
          color: _isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    ),
    Center(
      child: Text(
        'Pilih Tanggal Lahir',
        style: AppStyle.fontBold().copyWith(
          fontSize: 24,
          color: _isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    ),
    Center(
      child: Text(
        'Atur Pengingat',
        style: AppStyle.fontBold().copyWith(
          fontSize: 24,
          color: _isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    ),
  ];

  /// Function select menu on Drawer
  void _selectMenu(int index) {
    setState(() {
      _selectedMenuIndex = index;
    });
    Navigator.pop(context); //close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Color(0xff1E1E1E) : Colors.white,
      appBar: AppBar(
        backgroundColor: _isDarkMode ? Color(0xff1E1E1E) : Colors.white,
        iconTheme: IconThemeData(
          color: _isDarkMode ? Colors.white : Colors.black,
        ),
        title: Text(
          "Form Tugas 7",
          style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      drawer: _buildDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _menuTitles[_selectedMenuIndex], //dynamic title
          ),
          _buildSelectedForm(),
        ],
      ),
    );
  }

  /// Method to build Drawer
  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: AppColor.army1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/cat.png'),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: AppStyle.fontBold(
                        fontSize: 16,
                      ).copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'john.doe@mail.com',
                      style: AppStyle.fontNormal(
                        fontSize: 14,
                      ).copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text('Checkbox'),
            selected: _selectedMenuIndex == 0,
            selectedColor: AppColor.army1,
            onTap: () => _selectMenu(0),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Switch'),
            selected: _selectedMenuIndex == 1,
            selectedColor: AppColor.army1,
            onTap: () => _selectMenu(1),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_drop_down_circle),
            title: const Text('Dropdown'),
            selected: _selectedMenuIndex == 2,
            selectedColor: AppColor.army1,
            onTap: () => _selectMenu(2),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Date Picker'),
            selected: _selectedMenuIndex == 3,
            selectedColor: AppColor.army1,
            onTap: () => _selectMenu(3),
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Time Picker'),
            selected: _selectedMenuIndex == 4,
            selectedColor: AppColor.army1,
            onTap: () => _selectMenu(4),
          ),
        ],
      ),
    );
  }

  /// Method to build form from selected Drawer
  Widget _buildSelectedForm() {
    switch (_selectedMenuIndex) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CheckboxListTile(
              activeColor: AppColor.army1,
              title: Text(
                "Saya menyetujui semua persyaratan yang berlaku",
                style: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    _isChecked
                        ? "Lanjutkan pendaftaran diperbolehkan"
                        : "Anda belum bisa melanjutkan",
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SwitchListTile(
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.white,
              activeColor: Colors.white,
              activeTrackColor: AppColor.army1,
              title: Text(
                "Aktifkan Mode Gelap",
                style: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    _isDarkMode ? "Mode Gelap Aktif" : "Mode Terang Aktif",
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DropdownButton<String>(
                    dropdownColor: AppColor.army1,
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                    focusColor: AppColor.army1,
                    hint: Text(
                      "Pilih Kategori",
                      style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    value: _selectedCategory,
                    items:
                        ["Elektronik", "Pakaian", "Makanan", "Lainnya"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            if (_selectedCategory != null)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Anda memilih kategori: $_selectedCategory",
                      style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.army1,
                foregroundColor: Colors.white,
              ),
              onPressed: _pickDate,
              child: Text(
                "Pilih Tanggal Lahir",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            if (_selectedDate != null)
              Text(
                "Tanggal Lahir: ${_formatDate(_selectedDate!)}",
                style: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
          ],
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.army1,
                foregroundColor: Colors.white,
              ),
              onPressed: _pickTime,
              child: Text("Pilih Waktu Pengingat"),
            ),
            SizedBox(height: 20),
            if (_selectedTime != null)
              Text(
                "Pengingat diatur pukul: ${_formatTime(_selectedTime!)}",
                style: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
          ],
        );
      default:
        return Text("Pilih menu dari drawer.");
    }
  }

  // Async Function to show DatePicker
  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.army1,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColor.army1),
            ),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  // Async Function to show TimePicker
  Future<void> _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.army1,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColor.army1),
            ),
          ),
          child: child!,
        );
      },
    );
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  // Formatting Date using intl package
  String _formatDate(DateTime date) {
    return DateFormat('d MMMM yyyy', 'id_ID').format(date);
  }

  // Formatting Time using intl package
  String _formatTime(TimeOfDay time) {
    // Convert TimeOfDay to DateTime for formatting
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    // Format time in hh:mm a (e.g. 07:30 AM)
    return DateFormat.jm('en_US').format(dt);
  }
}
