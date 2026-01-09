import 'package:flutter/material.dart';

import '../../models/restuarant_comment.dart';
import '../theme.dart';
import '../widgets/star_rating_input.dart';

class RestaurantCommentsForm extends StatefulWidget {
  const RestaurantCommentsForm({super.key, required this.onSubmit});

  final Function(RestuarantComment) onSubmit;

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  int stars = 0;
  final TextEditingController feedbackController = TextEditingController();
  String? errorText;

  void submitComment() {
    if (feedbackController.text.isEmpty) {
      setState(() {
        errorText = 'Enter your feedback';
      });
      return;
    }

    widget.onSubmit(
      RestuarantComment(star: stars, feedback: feedbackController.text),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'How was your dinner?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          StarRatingInput(
            rating: stars,
            onRatingChanged: (value) {
              setState(() {
                stars = value;
              });
            },
          ),

          const SizedBox(height: 12),

   
          TextField(
            controller: feedbackController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Any feedback?',
              errorText: errorText,
            ),
          ),

          const SizedBox(height: 16),

      
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.main),
              onPressed: submitComment,
              child: const Text('Comment'),
            ),
          ),
        ],
      ),
    );
  }
}
