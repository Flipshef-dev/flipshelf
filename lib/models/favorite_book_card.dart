import 'package:flutter/material.dart';

class FavoriteBookCard extends StatefulWidget {
  const FavoriteBookCard({super.key});

  @override
  State<FavoriteBookCard> createState() => _FavoriteBookCardState();
}

class _FavoriteBookCardState extends State<FavoriteBookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("favorite"),
    );
  }
}