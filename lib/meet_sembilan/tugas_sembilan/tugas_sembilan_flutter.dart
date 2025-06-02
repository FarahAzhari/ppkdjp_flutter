import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/meet_sembilan/tugas_sembilan/list_map.dart';
import 'package:ppkdjp_flutter/meet_sembilan/tugas_sembilan/list_widget.dart';
import 'package:ppkdjp_flutter/meet_sembilan/tugas_sembilan/model_widget.dart';

class TugasSembilanFlutter extends StatelessWidget {
  const TugasSembilanFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Custom AppBar color
        elevation: 0,
        title: Text(
          'Tugas Sembilan Flutter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Padding for the entire body
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCustomButton(context, "List", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListWidget()),
                );
              }),
              SizedBox(height: 16), // Space between buttons
              _buildCustomButton(context, "List and Map", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListMap()),
                );
              }),
              SizedBox(height: 16),
              _buildCustomButton(context, "Model", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModelWidget()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Custom reusable button builder function
  Widget _buildCustomButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple, // Button color
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 12,
        ), // Padding inside button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        elevation: 5, // Button shadow
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white, // Text color
          fontSize: 18, // Text size
          fontWeight: FontWeight.w500, // Text weight
        ),
      ),
    );
  }
}
