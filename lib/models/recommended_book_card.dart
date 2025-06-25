import 'package:flipshelf/models/book.dart';
import 'package:flutter/material.dart';

class RecommendedBookCard extends StatefulWidget {
  final Book book;
  const RecommendedBookCard({super.key, required this.book});

  @override
  State<RecommendedBookCard> createState() => _RecommendedBookCardState();
}

class _RecommendedBookCardState extends State<RecommendedBookCard> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/book_view", arguments: widget.book);
      },
      child: Container(
        width: 160,
        margin: EdgeInsets.only(top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(150),
              blurRadius: 8,
              offset: const Offset(0, 0.2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Image of the book
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                height: 190,
                widget.book.coverImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Book details
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  // Price and ratings
                  Row(
                    children: [
                      Text(
                        "\$${widget.book.price}",
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withAlpha(180),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 14),
                      Icon(Icons.star_rounded, size: 20, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        widget.book.rating.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
