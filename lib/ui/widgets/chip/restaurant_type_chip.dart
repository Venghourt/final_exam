import 'package:flutter/material.dart';

import '../../../models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  const RestaurantTypeChip({
    super.key,
    required this.type,
  });

  final RestaurantType type;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(type.name.toUpperCase()),
      backgroundColor: type.color,
    );
  }
}
