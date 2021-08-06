import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'].toString();
    final mealDetail = DUMMY_MEALS.where((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(routeArgs['id'].toString()),
        ),
        body: Container(child: Text('hello' + routeArgs['id'].toString())));
  }
}
