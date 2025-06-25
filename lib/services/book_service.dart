// Just a skeleton file for future
import '../models/book.dart';

class BookService {
  static final BookService _instance = BookService._internal();
  factory BookService() => _instance;
  BookService._internal();

  final Map<String, Book> _books = {};

  Future<Book?> getBookById(String id) async {
    // If book is in cache, return it
    if (_books.containsKey(id)) {
      return _books[id];
    }

    // TODO: Implement api call for getting books 
    // for now return null if book not found
    return null;
  }

  // Method to add or update book in cache
  void updateBook(Book book) {
    _books[book.id.toString()] = book;
  }
}