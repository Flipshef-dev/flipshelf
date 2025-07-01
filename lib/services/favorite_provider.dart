import 'package:flutter/material.dart';
import 'package:flipshelf/models/book.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Book> _favorites = [];

  List<Book> get favorites => _favorites;

  bool isFavorite(Book book) => _favorites.any((b) => b.id == book.id);

  void toggleFavorite(Book book) {
    if (isFavorite(book)) {
      _favorites.removeWhere((b) => b.id == book.id);
    } else {
      _favorites.add(book);
    }
    notifyListeners();
  }
}