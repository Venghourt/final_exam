// Widget to disaply a restaurant stars chip
import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {
  const StarsChip({
    super.key,
    required this.rate,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.star,
        size: 18,
        color: Colors.purple,
      ),
      label: Text(rate.toStringAsFixed(1)),
    );
  }
}
