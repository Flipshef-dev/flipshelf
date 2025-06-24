import 'package:flipshelf/models/book.dart';
import 'package:flipshelf/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = context.watch<ThemeProvider>();
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.onSurface.withAlpha(80),
        borderRadius: BorderRadius.circular(16),
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
    );
  }
}
