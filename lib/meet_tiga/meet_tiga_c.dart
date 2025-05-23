import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/meet_tiga/meet_tiga_b.dart';

class MeetTigaC extends StatelessWidget {
  const MeetTigaC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Meet 3')),
      // body: ListView.builder(
      //   itemCount: 1,
      //   itemBuilder: (BuildContext context, int index) {
      //     return buildListUser();
      //     // Text(
      //     //   'data ke-$index',
      //     //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //     // );
      //   },
      // ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return buildListUser();
        },
      ),
    );
  }
}
