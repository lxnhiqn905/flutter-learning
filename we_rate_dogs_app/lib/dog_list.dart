import 'package:flutter/material.dart';
import 'package:we_rate_dogs_app/dog_card.dart';
import 'package:we_rate_dogs_app/dog_model.dart';

/// This is widget to display list of dogs

class DogList extends StatelessWidget {
  // List of dogs
  final List<Dog> listDogs;

  // Contructor
  DogList(this.listDogs);

  // Build the widget and return
  @override
  Widget build(BuildContext context) {
    return _buildListView(context);
  }

  // Build the list view to display
  ListView _buildListView(context) {
    return ListView.builder(
      // Build list items with length is length of list dogs
      itemCount: listDogs.length,
      // Build each item
      itemBuilder: (context, int index) {
        return DogCard(dog: listDogs[index]);
      },
    );
  }
}
