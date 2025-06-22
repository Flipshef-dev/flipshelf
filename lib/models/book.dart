import 'dart:ui';

class Book {
  final String id;
  final String title;
  final String author;
  final Color coverColor;
  final String coverImage;
  final String overview;
  final String aboutAuthor;
  final double rating;
  final double price;
  final List<String> categories;
  final int pageCount;
  final String publisher;
  final String publishedDate;
  final String language;
  final bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverColor,
    required this.coverImage,
    this.overview = '',
    this.aboutAuthor = '',
    this.rating = 0.0,
    this.price = 0.0,
    this.categories = const [],
    this.pageCount = 0,
    this.publisher = '',
    this.publishedDate = '',
    this.language = 'English',
    this.isFavorite = false,
  });

  // Factory method to create Book from JSON
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      coverColor: Color(json['coverColor']),
      coverImage: json['coverImage'],
      overview: json['overview'] ?? '',
      aboutAuthor: json['aboutAuthor'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      price: json['price']?.toDouble() ?? 0.0,
      categories: List<String>.from(json['categories'] ?? []),
      pageCount: json['pageCount'] ?? 0,
      publisher: json['publisher'] ?? '',
      publishedDate: json['publishedDate'] ?? '',
      language: json['language'] ?? 'English',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  // Method to convert Book to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'coverColor': coverColor,
      'coverImage': coverImage,
      'overview': overview,
      'aboutAuthor': aboutAuthor,
      'rating': rating,
      'price': price,
      'categories': categories,
      'pageCount': pageCount,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'language': language,
      'isFavorite': isFavorite,
    };
  }

  // Copy with method for updating book properties
  Book copyWith({
    String? id,
    String? title,
    String? author,
    Color? coverColor,
    String? coverImage,
    String? overview,
    String? aboutAuthor,
    double? rating,
    double? price,
    List<String>? categories,
    int? pageCount,
    String? publisher,
    String? publishedDate,
    String? language,
    bool? isFavorite,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverColor: coverColor ?? this.coverColor,
      coverImage: coverImage ?? this.coverImage,
      overview: overview ?? this.overview,
      aboutAuthor: aboutAuthor ?? this.aboutAuthor,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      categories: categories ?? this.categories,
      pageCount: pageCount ?? this.pageCount,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      language: language ?? this.language,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
