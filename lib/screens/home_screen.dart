import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import '../utils/colors.dart';
import 'add_item_screen.dart';
import '../widgets/item_list.dart';

class HomeScreen extends StatelessWidget {
  // Define a StatefulWidget for the home screen.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            // Add button to navigate to AddItemScreen.
            icon: Icon(Icons.add, color: Colors.white, size: 26),
            onPressed: () {
              // Navigate to AddItemScreen on button press.
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddItemScreen()));
            },
          ),
        ],
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // Title for the contact list.
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Contact List',
                    style: TextStyle(
                        fontSize: 24, // Set a font size
                        fontWeight: FontWeight.bold, // Bold the title
                        color: PastelColors
                            .pastel[800] // Set a color for the title

                        ),
                  ),
                ),

                SizedBox(height: 10), // Spacer.

                Expanded(
                  // Display the list of items.
                  child: ItemList(items: itemProvider.items),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
