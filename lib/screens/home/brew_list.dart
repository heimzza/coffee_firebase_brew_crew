import 'package:brew_crew_firebase/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    return brews == null
        ? Container()
        : ListView.builder(
            itemCount: brews.length,
            itemBuilder: (context, index) {
              return BrewTile(brew: brews[index]);
            },
          );
  }
}
