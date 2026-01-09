import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';
import 'restaurant_comments_form.dart';
import 'restaurant_comments_view.dart';

class RestuarantDetail extends StatefulWidget {
  const RestuarantDetail({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  State<RestuarantDetail> createState() => _RestuarantDetailState();
}

class _RestuarantDetailState extends State<RestuarantDetail> {

  void openAddCommentForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return RestaurantCommentsForm(
          onSubmit: (comment) {
            setState(() {
              widget.restaurant.comments.add(comment);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;

    return Scaffold(
      appBar: AppBar(
        title: Text('restuarant detail')
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.main,
        onPressed: openAddCommentForm,
        child: const Icon(Icons.add),
      ),
      
      body: Column(
        children: [

          Container(
            width: double.infinity,
            color: AppColors.main,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  restaurant.address,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [                  
                    RestaurantTypeChip(type: restaurant.type),
                    const SizedBox(width: 8),
                    StarsChip(rate: restaurant.avgRate),
                  ],
                ),
              ],
            ),
          ),
          
          Expanded(
            child: RestaurantCommentsView(
            comments: restaurant.comments
          )
          )
          

        ]
      ),
    );
  }
}
