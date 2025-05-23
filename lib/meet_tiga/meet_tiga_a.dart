import 'package:flutter/material.dart';

class MeetTigaA extends StatelessWidget {
  const MeetTigaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Meet 3')),
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 100),
        // physics: BouncingScrollPhysics(),
        // physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [buildStack(), buildStack(), buildStack()]),
            ),
            Text('STACK'),
            SizedBox(height: 20),
            buildStack(),
            buildStack(),
            buildStack(),
            buildStack(),
            buildStack(),
          ],
        ),
      ),
    );
  }
}

Center buildStack() {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          // color: Colors.red,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
        Container(
          height: 200,
          width: 200,
          // color: Colors.yellow,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: Colors.yellow,
          ),
        ),
        Container(
          height: 100,
          width: 100,
          // color: Colors.green,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: Colors.green,
          ),
        ),
        Column(children: [Text('data 1'), Text('data 2'), Text('data 3')]),
      ],
    ),
  );
}
