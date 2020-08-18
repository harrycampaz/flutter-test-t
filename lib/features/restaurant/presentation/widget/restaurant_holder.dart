import 'package:flutter/material.dart';
import 'package:tyga/features/restaurant/domain/restaurant.dart';

class RestaurantHolder extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantHolder({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
    );
  }
}
