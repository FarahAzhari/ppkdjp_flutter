import 'package:flutter/material.dart';

class TugasTujuhFlutter extends StatefulWidget {
  const TugasTujuhFlutter({super.key});

  @override
  State<TugasTujuhFlutter> createState() => _TugasTujuhFlutterState();
}

class _TugasTujuhFlutterState extends State<TugasTujuhFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Form Tugas 7"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('Checkbox'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.swipe),
              title: const Text('Switch'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.arrow_drop_down),
              title: const Text('Dropdown'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('Date Picker'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.timer_sharp),
              title: const Text('Time Picker'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
