import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  // Use to store list suggestions to view
  final _suggestions = <WordPair>[];
  // Lable style of each item
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // Set store items had favorite
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'), // Titile of view
        actions: <Widget>[
          // Add button to access new page, _pushSaved will execute when pressed it
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(), // Build list view to display
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // Each 1 item, then do ...
        itemBuilder: (context, i) {
          // With index is odd number, display divider instead of content
          if (i.isOdd) return Divider();

          // Because skip odd number, so re-index to access array
          //  1 -> 2 skip, 2 -> access 1, 3 -> skip, 4 -> access 2
          final index = i ~/ 2;

          // If index is large with length of _suggestions then append 10 items to list
          if (index >= _suggestions.length) {
            // using generateWordPairs of english_words libary to create 10 label and append into list
            _suggestions.addAll(generateWordPairs().take(10));
          }
          // Build widget for each item
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    // Check item is favorite or not
    final bool _alreadySaved = _saved.contains(pair);

    // Return 1 item to display at 1 row in list view
    return ListTile(
      // Lable
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      // Icon
      trailing: Icon(
          // If alreadySaved then display red heart icon
          _alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: _alreadySaved ? Colors.red : null),
      // Event tap on item
      onTap: () {
        setState(() {
          // If has ben favorite then remove it
          if (_alreadySaved) {
            _saved.remove(pair);
          } else {
            // Else add to set item saved
            _saved.add(pair);
          }
        });
      },
    );
  }

  // Build new page and add into Navigator
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder:
            nextPageContent, // Call method to build Widget display at next screen
      ),
    );
  }

  // Next page will display
  Widget nextPageContent(BuildContext context) {
    return Scaffold(
      // Add 6 lines from here...
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: savedItemsWidget(context)),
    ); // ... to here.
  }

  // Widget contains the saved items
  List<Widget> savedItemsWidget(BuildContext context) {
    final Iterable<ListTile> tiles = _saved.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return divided;
  }
}

class RandomWords extends StatefulWidget {
  @override
  // Create State for itself
  RandomWordsState createState() => RandomWordsState();
}
