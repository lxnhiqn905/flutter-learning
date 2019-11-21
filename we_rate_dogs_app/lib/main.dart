import 'package:flutter/material.dart';
import 'package:we_rate_dogs_app/dog_list.dart';

/// import the modle
import 'dog_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Application title
      title: 'We Rate Dogs Application',

      /// Application theme
      theme: ThemeData(primaryColor: Colors.yellow),

      /// Application home page, take a title as a parameter
      home: HomePage(title: "We Rate Dogs"),
    );
  }
}

class HomePage extends StatefulWidget {
  /// A paramterter to take value to display title
  final String title;

  /// Contructor
  HomePage({Key key, this.title}) : super(key: key);

  /// Create state for Home page
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Make the mock data
  List<Dog> allDogs = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  /// Build widget to display home page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Access this widgets properties with 'widget'
        title: Text(
          widget.title,
        ),

        /// The backgroud of application
        backgroundColor: Colors.green,
      ),
      // List of dogs
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: Center(child: DogList(allDogs)),
      ),
    );
  }
}
