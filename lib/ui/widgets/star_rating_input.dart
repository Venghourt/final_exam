import 'package:flutter/material.dart';

class StarRatingInput extends StatelessWidget {
  const StarRatingInput({
    super.key,
    required this.rating,
    required this.onRatingChanged,
    this.maxStars = 5,
  });

  final int rating;
  final int maxStars;
  final ValueChanged<int> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(maxStars, (index) {
        final starIndex = index + 1;

        return IconButton(
          icon: Icon(
            Icons.star,
            color: starIndex <= rating ? const Color.fromARGB(255, 255, 191, 0) : Colors.grey,
            size: 32,
          ),
          onPressed: () {
            onRatingChanged(starIndex);
          },
        );
      }),
    );
  }
}
