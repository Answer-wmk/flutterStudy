import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:wmktestapp/word/RandomWords.dart';

class RandomWordsState extends State<RandomWords> {
  //随机字母集合
  final _wordArray = <WordPair>[];
  //字体样式
  final TextStyle _wordFont = new TextStyle(fontSize: 10.0);
  //红心set集合
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('随机字母列表'),
        actions :<Widget>[new IconButton(icon: new Icon(Icons.list),onPressed: _seeSaved)],
      ),
      body: _buildWordArray(),
    );
  }

  Widget _buildWordArray() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _wordArray.length) {
          _wordArray.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_wordArray[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _wordFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _seeSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text( pair.asPascalCase, style: _wordFont, ),
              );
            },
          );
          final divided = ListTile.divideTiles( context: context, tiles: tiles, ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('收藏的随机字母'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}