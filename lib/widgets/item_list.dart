import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../screens/detail_screen.dart';
import '../utils/colors.dart';

import '../providers/item_provider.dart';

class ItemList extends StatelessWidget {
  // Define a StatefulWidget for displaying a list of items.
  final List<Item> items;

  ItemList(
      { // Constructor
      required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length, // Total number of items in the list.
      itemBuilder: (ctx, index) {
        return Card(
          color: PastelColors.pastel[200], // Background color of the card.
          child: ListTile(
            title: Text(
              items[index].title,
              style: TextStyle(
                color: PastelColors.pastel[800], // Color of the title text.
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                // Navigate to DetailScreen when item is tapped.
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: items[index]),
                ),
              );
            },
            trailing: IconButton(
              // Trailing icon button for deleting the item.
              icon: Icon(
                Icons.delete,
                color: PastelColors.pastel[800],
                size: 32,
              ), // Delete icon.
              onPressed: () {
                // Delete the item from the list
                Provider.of<ItemProvider>(context, listen: false)
                    .deleteItem(items[index].id);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  // Display a confirmation message.
                  content: Text('Deleted successfully'),
                ));
              },
            ),
          ),
        );
      },
    );
  }
}
