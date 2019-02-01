import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// remember ( always run the application ) 
// by F5 command so you can enable the hot reload
// in vs code.
// (=>) used for one line functions
void main() => runApp(MyApp());

// in flutter almost everything is a widget including layout
// padding, alignment.
class MyApp extends StatelessWidget {
  @override
  // this is called the scaffold widget that provides
  // a default app bar, title
  // the widget main job is to provide a build() mfethod
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

// <RandomWords> means that we are using the RandomWrods
// generic state class specialized with use with random
// words widget that I created
class RandomWordsState extends State<RandomWords> {
  final _suggestions  = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup names generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  // item builder defines a callback that is called once
  // every one list item is going to be created
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i)  {
        if (i.isOdd) return Divider(height: 16.0);
        final index = i ~/ 2;
        if (index >= _suggestions.length)  {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  
  // the library that i am using is the one that is 
  // creating the WordPair class that i am using
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
    );
  }
}

