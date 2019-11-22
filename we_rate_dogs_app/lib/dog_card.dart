import 'package:flutter/material.dart';
import 'package:we_rate_dogs_app/dog_detail_page.dart';

import 'dog_model.dart';

/// This is custom widget to display the dog
/// Input is Dog informations
/// Because need control the rate point so using state to manage it
class DogCard extends StatefulWidget {
  // The dog information, will be set throught contructor
  final Dog dog;

  // Contructor
  const DogCard({Key key, this.dog}) : super(key: key);

  @override
  _DogCardState createState() => _DogCardState();
}

/// State of the widget
/// Will be render the image URL for each dog
class _DogCardState extends State<DogCard> {
  // Store the image URL will be render
  String renderUrl;

  // We should init state before build the dog card
  @override
  void initState() {
    super.initState();
    renderDogImageUrl();
  }

  // Build the widget to display the dog information
  @override
  Widget build(BuildContext context) {
    /// Build a container to display the dog information
    return InkWell(
      onTap: showDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 115.0,
          // Using stack to contains multi widget
          child: Stack(
            children: <Widget>[
              // First item is dog information, using Positioned tag to store it
              Positioned(
                left: 50.0,
                child: dogInfo,
              ),
              // Second item is dog image, using Positioned tag to store it
              Positioned(
                top: 7.5,
                child: dogImage,
              )
            ],
          ),
        ),
      ),
    );
  }

  // The widget using to display dog image
  // This is getter
  Widget get dogImage {
    var dogAvatar = Hero(
        // Give a tag
        tag: widget.dog,
        child: Container(
            // Setting width-height
            width: 100.0,
            height: 100.0,

            // Decor the image
            decoration: BoxDecoration(
                // Shape
                shape: BoxShape.circle,
                image: DecorationImage(
                    // Setting fit
                    fit: BoxFit.cover,
                    image: NetworkImage(renderUrl ?? '')))));

    // Placeholder has size same with avatar
    var placeholder = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black54, Colors.black, Colors.blueGrey[600]],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'DOGGO',
        textAlign: TextAlign.center,
      ),
    );

    // Will be display dog avatar in this widget
    // Display placeholder before avatar
    return AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 10000),
    );
  }

  // The widget using to display dog information
  // This is getter
  Widget get dogInfo {
    return Container(
        // Setting width-height
        width: 290.0,
        height: 115.0,

        // Setting card information
        child: Card(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 64.0),
            // Wrap all to display in the column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Display the name
                Text(
                  widget.dog.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                // Display location
                Text(
                  widget.dog.location,
                  style: Theme.of(context).textTheme.subhead,
                ),
                // Display rating
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text(' ${widget.dog.rate} / 10')
                  ],
                )
              ],
            ),
          ),
        ));
  }

  // A method to execute render URL. This is async method
  void renderDogImageUrl() async {
    // Call method to render URL.
    await widget.dog.getImageUrl();

    // If widget not exist the avoid set state processing
    if (mounted) {
      // Set into state
      setState(() {
        renderUrl = widget.dog.imageUrl;
      });
    }
  }

  void showDogDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DogDetailPage(widget.dog);
    }));
  }
}
