import 'dart:ui';

import 'package:flipshelf/models/book.dart';
import 'package:flutter/material.dart';

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
    id: 1,
    title: 'One Piece',
    author: 'Eiichiro Oda',
    coverColor: Color(0xFFB91C1C),
    coverImage: 'assets/images/onepiece.png',
    aboutAuthor:
        "J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publication, Salinger published several short stories in Story magazine",
    rating: 3,
    price: 100.0,
    overview:
        "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults but is often read by adolescents for its theme of angst, alienation and as a critique......",
  ),
  Book(
    id: 2,
    title: 'Attack on Titan',
    author: 'Hajime Isayama',
    coverColor: Color(0xFF0B588E),
    coverImage: 'assets/images/aot.png',
    aboutAuthor:
        "Hajime Isayama is a Japanese manga artist best known for the manga series Attack on Titan.",
    rating: 4,
    overview:
        "Attack on Titan is a Japanese manga series written and illustrated by Hajime Isayama. Set in a world where humanity lives inside cities surrounded by enormous walls...",
    price: 100.0,
  ),
  Book(
    id: 3,
    title: 'Naruto',
    author: 'Masashi Kishimoto',
    coverColor: Color(0xFFDC2626),
    coverImage: 'assets/images/naruto.png',
    aboutAuthor:
        "Masashi Kishimoto is a Japanese manga artist known for creating the Naruto series.",
    rating: 4,
    overview:
        "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja...",
    price: 100.0,
  ),
  Book(
    id: 4,
    title: 'Demon Slayer',
    author: 'Koyoharu Gotouge',
    coverColor: Color.fromARGB(255, 147, 51, 234),
    coverImage: 'assets/images/Demon_Slayer.jpg',
    aboutAuthor:
        "Koyoharu Gotouge is a Japanese manga artist known for the series Demon Slayer.",
    rating: 4.1,
    overview:
        "Demon Slayer follows Tanjiro Kamado, a young boy who becomes a demon slayer after his family is slaughtered...",
  ),
  Book(
    id: 5,
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
  Book(
    id: 6,
    title: 'God Of War 3',
    author: 'Matthew Stover',
    coverColor: Color(0xFFE4A91D),
    coverImage: 'assets/images/gow3.png',
    aboutAuthor:
        "Matthew Stoveris the New York Times bestselling author of the God Of War franchise",
    rating: 4.2,
    price: 80,
    overview:
        "God of War is an action-adventure video game series, the first era of which was loosely based on Greek mythology.",
  ),
  Book(
    id: 7,
    title: 'God Of War ',
    author: 'Matthew Stover',
    coverColor: Color(0xFFE4A91D),
    coverImage: 'assets/images/gow.png',
    aboutAuthor:
        "Matthew Stoveris the New York Times bestselling author of the God Of War franchise",
    rating: 4.2,
    price: 80,
    overview:
        "God of War is an action-adventure video game series, the first era of which was loosely based on Greek mythology.",
  ),
];

final List<Book> all = [
  Book(
    id: 1,
    title: 'One Piece',
    author: 'Eiichiro Oda',
    coverColor: Color(0xFFB91C1C),
    coverImage: 'assets/images/onepiece.png',
    aboutAuthor:
        "J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publication, Salinger published several short stories in Story magazine",
    rating: 3,
    price: 100.0,
    overview:
        "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults but is often read by adolescents for its theme of angst, alienation and as a critique......",
  ),
  Book(
    id: 2,
    title: 'Attack on Titan',
    author: 'Hajime Isayama',
    coverColor: Color(0xFF0B588E),
    coverImage: 'assets/images/aot.png',
    aboutAuthor:
        "Hajime Isayama is a Japanese manga artist best known for the manga series Attack on Titan.",
    rating: 4,
    overview:
        "Attack on Titan is a Japanese manga series written and illustrated by Hajime Isayama. Set in a world where humanity lives inside cities surrounded by enormous walls...",
    price: 100.0,
  ),
  Book(
    id: 3,
    title: 'Naruto',
    author: 'Masashi Kishimoto',
    coverColor: Color(0xFFDC2626),
    coverImage: 'assets/images/naruto.png',
    aboutAuthor:
        "Masashi Kishimoto is a Japanese manga artist known for creating the Naruto series.",
    rating: 4,
    overview:
        "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja...",
    price: 100.0,
  ),
  Book(
    id: 4,
    title: 'Demon Slayer',
    author: 'Koyoharu Gotouge',
    coverColor: Color.fromARGB(255, 147, 51, 234),
    coverImage: 'assets/images/Demon_Slayer.jpg',
    aboutAuthor:
        "Koyoharu Gotouge is a Japanese manga artist known for the series Demon Slayer.",
    rating: 4.1,
    overview:
        "Demon Slayer follows Tanjiro Kamado, a young boy who becomes a demon slayer after his family is slaughtered...",
  ),
  Book(
    id: 5,
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
  Book(
    id: 6,
    title: 'God Of War 3',
    author: 'Matthew Stover',
    coverColor: Color(0xFFE4A91D),
    coverImage: 'assets/images/gow3.png',
    aboutAuthor:
        "Matthew Stoveris the New York Times bestselling author of the God Of War franchise",
    rating: 4.2,
    price: 80,
    overview:
        "God of War is an action-adventure video game series, the first era of which was loosely based on Greek mythology.",
  ),
  Book(
    id: 7,
    title: 'God Of War ',
    author: 'Matthew Stover',
    coverColor: Color(0xFFE4A91D),
    coverImage: 'assets/images/gow.png',
    aboutAuthor:
        "Matthew Stoveris the New York Times bestselling author of the God Of War franchise",
    rating: 4.2,
    price: 80,
    overview:
        "God of War is an action-adventure video game series, the first era of which was loosely based on Greek mythology.",
  ),
  Book(
    id: 8,
    title: 'One Piece',
    author: 'Eiichiro Oda',
    coverColor: Color(0xFFB91C1C),
    coverImage: 'assets/images/onepiece.png',
    aboutAuthor:
        "J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publication, Salinger published several short stories in Story magazine",
    rating: 3,
    price: 100.0,
    overview:
        "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults but is often read by adolescents for its theme of angst, alienation and as a critique......",
  ),
  Book(
    id: 9,
    title: 'Attack on Titan',
    author: 'Hajime Isayama',
    coverColor: Color(0xFF0B588E),
    coverImage: 'assets/images/aot.png',
    aboutAuthor:
        "Hajime Isayama is a Japanese manga artist best known for the manga series Attack on Titan.",
    rating: 4,
    overview:
        "Attack on Titan is a Japanese manga series written and illustrated by Hajime Isayama. Set in a world where humanity lives inside cities surrounded by enormous walls...",
    price: 100.0,
  ),
  Book(
    id: 10,
    title: 'Naruto',
    author: 'Masashi Kishimoto',
    coverColor: Color(0xFFDC2626),
    coverImage: 'assets/images/naruto.png',
    aboutAuthor:
        "Masashi Kishimoto is a Japanese manga artist known for creating the Naruto series.",
    rating: 4,
    overview:
        "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja...",
    price: 100.0,
  ),
  Book(
    id: 11,
    title: 'Demon Slayer',
    author: 'Koyoharu Gotouge',
    coverColor: Color.fromARGB(255, 147, 51, 234),
    coverImage: 'assets/images/Demon_Slayer.jpg',
    aboutAuthor:
        "Koyoharu Gotouge is a Japanese manga artist known for the series Demon Slayer.",
    rating: 4.1,
    overview:
        "Demon Slayer follows Tanjiro Kamado, a young boy who becomes a demon slayer after his family is slaughtered...",
  ),
  Book(
    id: 12,
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
  Book(
    id: 13,
    title: 'God Of War 3',
    author: 'Matthew Stover',
    coverColor: Color(0xFFE4A91D),
    coverImage: 'assets/images/gow3.png',
    aboutAuthor:
        "Matthew Stoveris the New York Times bestselling author of the God Of War franchise",
    rating: 4.2,
    price: 80,
    overview:
        "God of War is an action-adventure video game series, the first era of which was loosely based on Greek mythology.",
  ),
  Book(
    id: 14,
    title: 'God Of War ',
    author: 'Matthew Stover',
    coverColor: Color(0xFFE4A91D),
    coverImage: 'assets/images/gow.png',
    aboutAuthor:
        "Matthew Stoveris the New York Times bestselling author of the God Of War franchise",
    rating: 4.2,
    price: 80,
    overview:
        "God of War is an action-adventure video game series, the first era of which was loosely based on Greek mythology.",
  ),
];
final List<Book> books = [
  Book(
    id: 1,
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
    id: 2,
    title: 'Attack on Titan',
    author: 'Hajime Isayama',
    coverColor: Color(0xFF0B588E),
    coverImage: 'assets/images/aot.png',
    aboutAuthor:
        "Hajime Isayama is a Japanese manga artist best known for the manga series Attack on Titan.",
    rating: 4,
    overview:
        "Attack on Titan is a Japanese manga series written and illustrated by Hajime Isayama. Set in a world where humanity lives inside cities surrounded by enormous walls...",
  ),
  Book(
    id: 3,
    title: 'Naruto',
    author: 'Masashi Kishimoto',
    coverColor: Color(0xFFDC2626),
    coverImage: 'assets/images/naruto.png',
    aboutAuthor:
        "Masashi Kishimoto is a Japanese manga artist known for creating the Naruto series.",
    rating: 4,
    overview:
        "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja...",
  ),
  Book(
    id: 4,
    title: 'God Of War 3',
    author: 'Matthew Stover',
    coverColor: Color(0xFFE4A91D),
    coverImage: 'assets/images/gow3.png',
    aboutAuthor:
        "Matthew Stoveris the New York Times bestselling author of the God Of War franchise",
    rating: 4.5,
    overview:
        "God of War is an action-adventure video game series, the first era of which was loosely based on Greek mythology.",
  ),
];

final List<Book> newArrivals = [
  Book(
    id: 4,
    title: 'Story of Roronoa Zoro',
    author: 'Eiichiro Oda',
    coverColor: Color.fromARGB(255, 61, 220, 36),
    coverImage: 'assets/images/zoro.png',
    aboutAuthor:
        "Eiichiro Oda is a Japanese manga artist and the creator of the series One Piece.",
    rating: 3.5,
    overview:
        "The story follows Roronoa Zoro, a skilled swordsman who dreams of becoming the world's greatest swordsman...",
  ),
  Book(
    id: 5,
    title: 'Demon Slayer',
    author: 'Koyoharu Gotouge',
    coverColor: Color.fromARGB(255, 147, 51, 234),
    coverImage: 'assets/images/Demon_Slayer.jpg',
    aboutAuthor:
        "Koyoharu Gotouge is a Japanese manga artist known for the series Demon Slayer.",
    rating: 4.5,
    overview:
        "Demon Slayer follows Tanjiro Kamado, a young boy who becomes a demon slayer after his family is slaughtered...",
  ),
  Book(
    id: 6,
    title: 'God Of War ',
    author: 'Matthew Stover',
    coverColor: Color(0xFFE4A91D),
    coverImage: 'assets/images/gow.png',
    aboutAuthor:
        "Matthew Stoveris the New York Times bestselling author of the God Of War franchise",
    rating: 4.2,
    overview:
        "God of War is an action-adventure video game series, the first era of which was loosely based on Greek mythology.",
  ),
];
