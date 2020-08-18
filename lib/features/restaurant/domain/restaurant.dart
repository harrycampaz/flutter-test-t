import 'package:flutter/material.dart';
class Restaurant {
  String id;
  String name;
  String city;


  Restaurant({
    Key key,
    @required this.name,
    @required this.city,
  });
}