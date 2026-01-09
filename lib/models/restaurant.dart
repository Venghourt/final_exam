import 'restaurant_type.dart';
import 'restuarant_comment.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<RestuarantComment> comments;

  Restaurant({
    required this.name,
    required this.address,
    required this.type,
    required this.comments,
  });

  double get avgRate {

    if (comments.isEmpty) {
      return 0;
    }
    
    int totalStar = 0;

    for (final comment in comments) {
      totalStar += comment.star;
    }

    return totalStar / comments.length;
  }
}
