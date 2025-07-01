import 'package:flipshelf/models/book.dart';
import 'package:flipshelf/services/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BookCard extends StatefulWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {


  @override
  Widget build(BuildContext context) {
  final favoriteProvider = Provider.of<FavoriteProvider>(context);
  final isFavorite = favoriteProvider.isFavorite(widget.book);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(bottom: 4, right: 6),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(widget.book.coverImage),
                fit: BoxFit.cover,
                //     height: double.infinity,
              ),
              boxShadow: [
                BoxShadow(
                  // color: const Color.fromARGB(144, 0, 0, 0),
                  color: widget.book.coverColor,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton.filledTonal(
                  style: IconButton.styleFrom(
                    minimumSize: Size(20, 20),
                    fixedSize: Size(30, 30),
                    backgroundColor: Colors.transparent,
                    overlayColor: Colors.transparent,
                  ),
                  iconSize: 22,
                  onPressed: () => {
                    favoriteProvider.toggleFavorite(widget.book)
                  },
                  icon: Icon(
                    isFavorite
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          widget.book.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                widget.book.author,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary.withAlpha(240),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "\$${widget.book.price}",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary.withAlpha(240),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
