import 'package:flutter/material.dart';

class TugasEmpatFlutter extends StatelessWidget {
  const TugasEmpatFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Started')),
      body: ListView(
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
            ],
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.catching_pokemon),
            title: Text('Pokemon'),
            subtitle: Text('Rp500.000'),
            trailing: Icon(Icons.add),
            tileColor: Colors.grey[200],
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.umbrella),
            title: Text('Umbrella'),
            subtitle: Text('Rp50.000'),
            trailing: Icon(Icons.add),
            tileColor: Colors.grey[200],
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.umbrella),
            title: Text('Umbrella'),
            subtitle: Text('Rp50.000'),
            trailing: Icon(Icons.add),
            tileColor: Colors.grey[200],
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.umbrella),
            title: Text('Umbrella'),
            subtitle: Text('Rp50.000'),
            trailing: Icon(Icons.add),
            tileColor: Colors.grey[200],
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.umbrella),
            title: Text('Umbrella'),
            subtitle: Text('Rp50.000'),
            trailing: Icon(Icons.add),
            tileColor: Colors.grey[200],
            onTap: () {},
          ),
        ],
      ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 40),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('1 of 9'),
      //       Text('Before we get started - fill out this form...'),
      //       SizedBox(height: 20),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             'Full Name',
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           ),
      //           TextField(
      //             decoration: InputDecoration(
      //               hintText: 'Jane Doe',
      //               // border: UnderlineInputBorder(),
      //               isDense: true,
      //               enabledBorder: UnderlineInputBorder(
      //                 // Normal border (not focused)
      //                 borderSide: BorderSide(color: Colors.grey),
      //               ),
      //               focusedBorder: UnderlineInputBorder(
      //                 // Border when the field is focused (clicked/tapped)
      //                 borderSide: BorderSide(
      //                   color: Colors.blue,
      //                   width: 1,
      //                 ), // highlight color
      //               ),
      //             ),
      //           ),
      //           SizedBox(height: 15),
      //           Text(
      //             'Email',
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           ),
      //           TextField(
      //             decoration: InputDecoration(
      //               hintText: 'janedoe@mail.com',
      //               // border: UnderlineInputBorder(),
      //               isDense: true,
      //               enabledBorder: UnderlineInputBorder(
      //                 // Normal border (not focused)
      //                 borderSide: BorderSide(color: Colors.grey),
      //               ),
      //               focusedBorder: UnderlineInputBorder(
      //                 // Border when the field is focused (clicked/tapped)
      //                 borderSide: BorderSide(
      //                   color: Colors.blue,
      //                   width: 1,
      //                 ), // highlight color
      //               ),
      //             ),
      //           ),
      //           SizedBox(height: 15),
      //           Text(
      //             'Phone Number',
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           ),
      //           TextField(
      //             decoration: InputDecoration(
      //               hintText: '08123456789',
      //               // border: UnderlineInputBorder(),
      //               isDense: true,
      //               enabledBorder: UnderlineInputBorder(
      //                 // Normal border (not focused)
      //                 borderSide: BorderSide(color: Colors.grey),
      //               ),
      //               focusedBorder: UnderlineInputBorder(
      //                 // Border when the field is focused (clicked/tapped)
      //                 borderSide: BorderSide(
      //                   color: Colors.blue,
      //                   width: 1,
      //                 ), // highlight color
      //               ),
      //             ),
      //           ),
      //           SizedBox(height: 15),
      //           Text(
      //             'Description',
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           ),
      //           TextField(
      //             decoration: InputDecoration(
      //               // hintText: '08123456789',
      //               // border: UnderlineInputBorder(),
      //               isDense: true,
      //               enabledBorder: UnderlineInputBorder(
      //                 // Normal border (not focused)
      //                 borderSide: BorderSide(color: Colors.grey),
      //               ),
      //               focusedBorder: UnderlineInputBorder(
      //                 // Border when the field is focused (clicked/tapped)
      //                 borderSide: BorderSide(
      //                   color: Colors.blue,
      //                   width: 1,
      //                 ), // highlight color
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
