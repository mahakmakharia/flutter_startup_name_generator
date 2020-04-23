import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {

  static final String routeName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> startupNames = [];
  Set<String> favoriteNames = Set<String>();

  @override
  void initState() {
    super.initState();
    startupNames
        .addAll(List.generate(30, (index) => WordPair.random().asPascalCase));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Startup Names'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              // navigate to the favorites screen
              Navigator.pushNamed(context, FavoritesScreen.routeName,
                  arguments: favoriteNames);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index >= startupNames.length)
            startupNames.addAll(
                List.generate(20, (index) => WordPair.random().asPascalCase));
          final String startupName = startupNames[index];
          return ListTile(
            title: Text(startupName),
            trailing: IconButton(
              icon: favoriteNames.contains(startupName)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: favoriteNames.contains(startupName)
                  ? Colors.red
                  : Colors.black54,
              onPressed: () {
                // what happens when Icon is pressed
                print('$startupName pressed');
                setState(() {
                  favoriteNames.contains(startupName)
                      ? favoriteNames.remove(startupName)
                      : favoriteNames.add(startupName);
                });
              },
            ),
          );
        },
      ),
    );
  }
}