

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("App"),
      ),
      body: RandomWords(),
    );
  }
}


class RandomWords extends StatefulWidget {

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {

  final List<WordPair> suggestions = <WordPair>[];
  final TextStyle biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    // final randomWord = WordPair.random();
    // return Text(randomWord.asPascalCase);

    return Scaffold(
      
      body: _buildSuggestions(),
    );
  }

  Widget  _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i){
        if (i.isOdd){
          return Divider();
        }
        final int index = i ~/ 2; //check even
        if (index >= suggestions.length){
          suggestions.addAll(generateWordPairs().take(10));
        }
        return buildRow(suggestions[index]);
      }
    );
  }

  Widget buildRow(WordPair wordPair){
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: biggerFont,
      ),
    );
  }

}