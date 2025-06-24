import 'package:flutter/material.dart';

Widget buildStarRating(double rating) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: List.generate(5, (index) {
      if (index < rating.floor()) {
        return const Icon(Icons.star_rounded, color: Colors.amber, size: 18);
      } else if (index < rating && rating % 1 != 0) {
        return const Icon(
          Icons.star_half_rounded,
          color: Colors.amber,
          size: 18,
        );
      } else {
        return const Icon(
          Icons.star_outline_rounded,
          color: Colors.amber,
          size: 18,
        );
      }
    }),
  );
}