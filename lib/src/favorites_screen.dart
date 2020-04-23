import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static final String routeName = '/favorites';
  final Set<String> favoriteNames;

  const FavoritesScreen({Key key, @required this.favoriteNames})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(favoriteNames);
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          title: Text(favoriteNames.toList()[index],),
        ),
        itemCount: favoriteNames.length,
      ),
    );
  }
}