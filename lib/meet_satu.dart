import 'package:flutter/material.dart';

class MeetSatu extends StatelessWidget {
  const MeetSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Pertemuan 1'),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('Gambar 1')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Gambar 2')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('Gambar 3')],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Pertemuan 1',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            'PPKD Batch 2',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text(
            'Mobile Programming',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            'Nama Toko',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'Toko saya bernama',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              children: [
                TextSpan(text: '@TokoKu', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Gambar 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gambar 2',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),

          Text(
            'Gambar 3 Gambar 3 Gambar 3 Gambar 3 Gambar 3 Gambar 3',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email, color: Colors.grey, size: 25),
              Text(
                'Email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
