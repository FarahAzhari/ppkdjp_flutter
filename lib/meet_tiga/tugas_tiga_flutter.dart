import 'package:flutter/material.dart';

class TugasTigaFlutter extends StatelessWidget {
  const TugasTigaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Started')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1 of 9'),
            Text('Before we get started - fill out this form...'),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Jane Doe',
                    // border: UnderlineInputBorder(),
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      // Normal border (not focused)
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // Border when the field is focused (clicked/tapped)
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ), // highlight color
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'janedoe@mail.com',
                    // border: UnderlineInputBorder(),
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      // Normal border (not focused)
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // Border when the field is focused (clicked/tapped)
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ), // highlight color
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '08123456789',
                    // border: UnderlineInputBorder(),
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      // Normal border (not focused)
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // Border when the field is focused (clicked/tapped)
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ), // highlight color
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    // hintText: '08123456789',
                    // border: UnderlineInputBorder(),
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      // Normal border (not focused)
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // Border when the field is focused (clicked/tapped)
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ), // highlight color
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            Text('How are you feeling today?'),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 12, // horizontal space between items
              mainAxisSpacing: 12, // vertical space between items
              // padding: EdgeInsets.symmetric(horizontal: 16), // padding around the grid
              childAspectRatio: 1, // width : height = 3:2
              children: [
                Container(
                  color: Colors.grey[200],
                  child: Stack(children: [Center(child: Text('Happy'))]),
                ),
                Container(
                  color: Colors.grey[200],
                  child: Stack(children: [Center(child: Text('Excited'))]),
                ),
                Container(
                  color: Colors.grey[200],
                  child: Stack(children: [Center(child: Text('Curious'))]),
                ),
                Container(
                  color: Colors.grey[200],
                  child: Stack(children: [Center(child: Text('Sad'))]),
                ),
                Container(
                  color: Colors.grey[200],
                  child: Stack(
                    children: [Center(child: Text('Not Interested'))],
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  child: Stack(children: [Center(child: Text('Angry'))]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
