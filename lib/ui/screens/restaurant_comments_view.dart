import 'package:flutter/material.dart';

import '../../models/restuarant_comment.dart';

class RestaurantCommentsView extends StatelessWidget {
  const RestaurantCommentsView({
    super.key,
    required this.comments,
  });

  final List<RestuarantComment> comments;

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return const Center(
        child: Text('No comments yet'),
      );
    }

    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            title: Text(comment.feedback),
            trailing: Text('${comment.star}'),
          ),
        );
      },
    );
  }
}
