import 'package:fashion_world/ordersPages/reviewhive.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class ViewReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Review>('reviews');
    final reviews = box.values.toList();

    return Scaffold(
      appBar: AppBar(title: Text('View Reviews')),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return ListTile(
            title: Text(review.text),
          );
        },
      ),
    );
  }
}
