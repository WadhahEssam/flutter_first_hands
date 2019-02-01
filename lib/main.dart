import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// (=>) used for one line functions
void main() => runApp(MyApp());

// in flutter almost everything is a widget including layout
// padding, alignment.
class MyApp extends StatelessWidget {
  @override
  // this is called the scaffold widget that provides
  // a default app bar, title
  // the widget main job is to provide a build() method
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'This is the first flutter app',
      home: Scaffold(
        // the app bar here is a widget, so as the Text
        appBar: AppBar(title: Text('Startups name generator')),
        // the center widget centers everything in the body
        // pascal case is like toUpperCaseFirstLetter
        body: Center(child: RandomWords()),
      )
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
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}