// Create a class named Item to represent an item.
class Item {
  final String id;
  final String title;
  final String description;

  Item({ // Constructor for the Item class.
    //All parameters are required and cannot be null.
    required this.id,
    required this.title,
    required this.description
  });
}