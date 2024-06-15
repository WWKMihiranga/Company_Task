import 'package:flutter/material.dart';
import '../../models/item.dart';

class ItemProvider with ChangeNotifier { //Define a class to manage the state of items.
  List<Item> _items = [ // Private list to store items.
    Item(id: '0', title: 'Kavindu Mihiranga', description: "I'm Kavindu Mihiranga. I love coding and learning new things. I'm passionate about the sotware industry. I enjoy playing computer games in my free time and spending time with loved ones."),
  ];

  List<Item> get items => _items; // Getter method

  void addItem(Item item) { // Method to add a new item.
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(String id) { // Method to delete an item by its id.
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  // Method for getting the last item's index
  int get lastItemIndex => _items.isNotEmpty ? _items.length - 1 : -1;
}

