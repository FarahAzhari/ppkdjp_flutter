import 'package:flutter/material.dart';

class TugasSatuFlutter extends StatelessWidget {
  const TugasSatuFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profil Saya'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Text('Nama: Farah Azhari', style: TextStyle(fontSize: 25)),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Icon(Icons.location_on, color: Colors.blue),
      //         Text(
      //           'Jakarta',
      //           style: TextStyle(fontSize: 22, color: Colors.blue),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Text(
      //           'I am a Flutter student.',
      //           style: TextStyle(
      //             fontSize: 18,
      //             fontStyle: FontStyle.italic,
      //             decoration: TextDecoration.underline,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.start, // Vertically centers content
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .center, // Optional: horizontally center the row
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU62Md2yC4lIg8Mt_ZUGEVBaoXR7apfYbWbQ&s',
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Farah Azhari',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          'Jakarta',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
