import 'package:flutter/material.dart';

class TugasLimaFlutter extends StatefulWidget {
  const TugasLimaFlutter({super.key});

  @override
  State<TugasLimaFlutter> createState() => _TugasLimaFlutterState();
}

class _TugasLimaFlutterState extends State<TugasLimaFlutter> {
  String name = 'Farah';
  String outputText = '';
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          restoreButton(),
          Text(outputText),
          SizedBox(height: 40),
          buildElevatedButton(),
          buildIconButton(),
          TextButton(onPressed: () {}, child: Text('Lihat Selengkapnya')),
        ],
      ),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          outputText = isVisible ? '' : 'Disukai';
          isVisible = !isVisible;
        });
      },
      icon: Icon(
        Icons.favorite,
        color: isVisible ? Colors.redAccent : Colors.grey[600],
      ),
    );
  }

  Column buildElevatedButton() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              outputText = 'Nama saya: $name';
              // isVisible = !isVisible;
            });
          },
          child: Text('Tampilkan Nama'),
        ),
      ],
    );
  }

  IconButton restoreButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          outputText = '';
        });
      },
      icon: Icon(Icons.restore),
    );
  }
}
