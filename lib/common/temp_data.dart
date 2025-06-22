import 'dart:ui';

import 'package:flipshelf/models/book.dart';

final List<String> recentSearches = [
    "One Piece",
    "One Piece",
    "One Piece",
    "Eiichiro Oda",
    "Eiichiro Oda",
    "Eiichiro Oda",
    "God of War",
    "God of War",
    "Matthew Stover",
    "Matthew Stover",
    "Matthew Stover",
];


final List<Book> recommended = [
    Book(
      id: "1",
      title: 'One Piece',
      author: 'Eiichiro Oda',
      coverColor: Color(0xFFB91C1C),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publication, Salinger published several short stories in Story magazine",
      rating: 3,
      overview:
          "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults but is often read by adolescents for its theme of angst, alienation and as a critique......",
    ),
    Book(
      id: "2",
      title: 'Attack on Titan',
      author: 'Hajime Isayama',
      coverColor: Color(0xFF059669),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "Hajime Isayama is a Japanese manga artist best known for the manga series Attack on Titan.",
      rating: 4,
      overview:
          "Attack on Titan is a Japanese manga series written and illustrated by Hajime Isayama. Set in a world where humanity lives inside cities surrounded by enormous walls...",
    ),
    Book(
      id: "3",
      title: 'Naruto',
      author: 'Masashi Kishimoto',
      coverColor: Color(0xFFDC2626),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "Masashi Kishimoto is a Japanese manga artist known for creating the Naruto series.",
      rating: 4,
      overview:
          "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja...",
    ),
    Book(
      id: "4",
      title: 'Demon Slayer',
      author: 'Koyoharu Gotouge',
      coverColor: Color.fromARGB(255, 147, 51, 234),
      coverImage: 'assets/images/zoro.png',
      aboutAuthor:
          "Koyoharu Gotouge is a Japanese manga artist known for the series Demon Slayer.",
      rating: 4.1,
      overview:
          "Demon Slayer follows Tanjiro Kamado, a young boy who becomes a demon slayer after his family is slaughtered...",
    ),
    Book(
      id: "5",
      title: 'My Hero Academia',
      author: 'Kohei Horikoshi',
      coverColor: Color(0xFF0891B2),
      coverImage: 'assets/images/onepiece.png',
      aboutAuthor:
          "Kohei Horikoshi is a Japanese manga artist known for creating My Hero Academia.",
      rating: 4.2,
      overview:
          "My Hero Academia follows Izuku Midoriya, a boy born without superpowers in a world where they have become commonplace...",
    ),
  ];

