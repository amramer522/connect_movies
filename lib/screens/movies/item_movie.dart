import 'package:connect_movies/screens/movies/model.dart';
import 'package:flutter/material.dart';

class ItemMovie extends StatelessWidget {
  final Movie model;

  const ItemMovie({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [Expanded(child: Image.network(model.backdropPath)), Text(model.title)],
      ),
    );
  }
}
