import 'package:flutter/material.dart';
import '../models/item.dart';

class DetailScreen extends StatelessWidget { // Define a StatefulWidget for displaying details of an item.
  final Item item; // Displaying item.

  DetailScreen({ // Constructor of the class
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description", style: TextStyle(color: Colors.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( // Display title of the item
              item.title,
              style: TextStyle(
                fontSize: 24, // Set a font size
                fontWeight: FontWeight.bold, // Bold the title
              ),
            ),

            SizedBox(height: 16), // Spacer

            Text( // Display description of the item
              item.description,
              style: TextStyle(
                fontSize: 18, // Set a font size
              ),
            ),

          ],
        ),
      ),

    );
  }
}
