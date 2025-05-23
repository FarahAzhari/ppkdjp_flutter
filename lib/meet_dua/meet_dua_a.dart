import 'package:flutter/material.dart';

class MeetDuaA extends StatelessWidget {
  const MeetDuaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meet Dua A')),
      body: SizedBox(
        height: 250,
        child: Column(
          children: [
            Text('PPKD Jakart Pusat Batch 2'),
            Spacer(),
            Text('Mobile Programming'),
            Spacer(),
            Text('Mobile Programming'),
            Spacer(),
            Text('Mobile Programming'),
            Container(width: 50, height: 50),
          ],
        ),
      ),
    );
  }
}
