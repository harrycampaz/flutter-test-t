import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:tyga/features/restaurant/presentation/bloc/restaurant_bloc.dart';
import 'package:tyga/features/restaurant/presentation/pages/restaurant_search_page.dart';

class RestaurantPage extends StatefulWidget {

  final String searchText;

  const RestaurantPage({Key key, this.searchText}) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: RestauranBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text("Resultado: ${widget.searchText}")
          ,),
        body: RestaurantSearchPage(searchCity: widget.searchText,)
        ,),
    );
  }
}
