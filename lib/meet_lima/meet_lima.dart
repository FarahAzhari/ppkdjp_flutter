import 'package:flutter/material.dart';

class MeetLima extends StatefulWidget {
  const MeetLima({super.key});

  @override
  State<MeetLima> createState() => _MeetLimaState();
}

class _MeetLimaState extends State<MeetLima> {
  int nilaiTambah = 0;
  bool tampilkanLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meet Lima'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          buildElevatedButton(),
          buildIconButton(),
          buildTextButton(),
          buildInkWell(),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                nilaiTambah++;
              });
            },
            child: Container(width: 200, height: 200, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }

  Column buildInkWell() {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.red,
          onTap: () {
            setState(() {
              nilaiTambah++;
            });
          },
          onLongPress: () {
            setState(() {
              nilaiTambah--;
            });
          },
          onDoubleTap: () {
            setState(() {
              nilaiTambah = 0;
            });
          },
          child: Image.asset('assets/images/cat.png', width: 200, height: 200),
        ),
      ],
    );
  }

  Column buildTextButton() {
    return Column(
      children: [
        tampilkanLoading ? CircularProgressIndicator() : SizedBox(),
        TextButton(
          onPressed: () {
            setState(() {
              tampilkanLoading = !tampilkanLoading;
            });
          },
          child: Text('Tampilkan Loading'),
        ),
      ],
    );
  }

  Column buildIconButton() {
    return Column(
      children: [
        nilaiWidget(),
        IconButton(
          onPressed: () {
            setState(() {
              nilaiTambah--;
            });
          },
          icon: Icon(Icons.minimize),
        ),
      ],
    );
  }

  Column buildElevatedButton() {
    return Column(
      children: [
        nilaiWidget(),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    nilaiTambah++;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Tambah'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Text nilaiWidget() {
    return Text(
      nilaiTambah.toString(),
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    );
  }
}
