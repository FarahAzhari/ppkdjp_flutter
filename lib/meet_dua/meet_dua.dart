import 'package:flutter/material.dart';

class MeetDua extends StatelessWidget {
  const MeetDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meet Dua'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center),
          SizedBox(height: 20),
          Text('PPKD Batch 2'),
          Text('Mobile Programming Class'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [Text('We are in this together')]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [Text('We are in this together')]),
          ),
          Row(children: [Text('We are in this together')]),

          Container(
            // height: 40,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(12),
            width: double.infinity,
            // color: Colors.black, //Jangan letakkan ini di luar BoxDecoration jika menggunakan BoxDecoration
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(24)),
              border: Border.all(color: Colors.blue),
              // shape: BoxShape.circle
              gradient: LinearGradient(
                colors: [Colors.amber, Colors.redAccent],
              ),
            ),
            child: Column(
              children: [
                Text('Data', style: TextStyle(color: Colors.white)),
                Text('Data', style: TextStyle(color: Colors.white)),
                Text('Data', style: TextStyle(color: Colors.white)),
                Text('Data', style: TextStyle(color: Colors.white)),
                Text('Data', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(width: 20, height: 20, color: Colors.blue),
              ),
              Expanded(
                child: Container(width: 20, height: 20, color: Colors.red),
              ),
              Expanded(
                child: Container(width: 20, height: 20, color: Colors.green),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(width: 20, height: 20, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
