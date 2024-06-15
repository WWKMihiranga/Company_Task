import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import '../models/item.dart';
import '../utils/colors.dart';

class AddItemScreen extends StatefulWidget {
  // Define a StatefulWidget for adding a new item.
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  // Controllers for text fields.
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late int currentId; // Variable to hold the id of the new item.

  @override
  void initState() {
    super.initState();
    // Get the instance of ItemProvider to calculate the id for the new item.
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);
    currentId = itemProvider.lastItemIndex +
        1; // Initialize id1 with the last index + 1
  }

  void _saveItem() {
    // Trim the input values to remove leading and trailing spaces
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();

    // Check if title or description is empty.
    if (title.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Fill the Details'),
      ));
      return;
    }

    final newItem = Item(
      // Create a new item with provided details.
      id: "$currentId",
      title: _titleController.text,
      description: _descriptionController.text,
    );

    currentId++; // Increment id for the next item.

    // Add the new item to the list
    Provider.of<ItemProvider>(context, listen: false).addItem(newItem);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //confirmation message
      content: Text('Product was added Successfully'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter the Details', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              // Text field for full name.
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor:
                    PastelColors.pastel[100], // Use color from PastelColors.
              ),
            ),

            SizedBox(height: 16),

            TextField(
              // Text field for description.
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                filled: true,
                fillColor:
                    PastelColors.pastel[100], // Use color from PastelColors.
              ),
            ),

            SizedBox(height: 20), // Spacer.

            ElevatedButton(
              // Button for adding the item to the list.
              onPressed: _saveItem,
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
