import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:tyga/features/restaurant/domain/restaurant.dart';
import 'package:tyga/features/restaurant/presentation/bloc/restaurant_bloc.dart';
import 'package:tyga/features/restaurant/presentation/widget/restaurant_holder.dart';

class RestaurantSearchPage extends StatefulWidget {
  final String searchCity;

  const RestaurantSearchPage({Key key, this.searchCity}) : super(key: key);

  @override
  _RestaurantSearchPageState createState() => _RestaurantSearchPageState();
}

class _RestaurantSearchPageState extends State<RestaurantSearchPage>
    with SingleTickerProviderStateMixin {
  RestauranBloc restauranBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    restauranBloc = BlocProvider.of<RestauranBloc>(context);
    
    restauranBloc.setHistorial(widget.searchCity);

    return Container(
        margin:
            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: StreamBuilder(
            stream: restauranBloc.restauranList(widget.searchCity),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: Text("No hay restaurante"));
                  break;
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                  break;
                case ConnectionState.active:
                  return ListView(
                      children: _buildResult(snapshot.data.documents)
                  );
                  break;
                case ConnectionState.done:
                  return ListView(
                    children: _buildResult(snapshot.data.documents)
                  );
                  break;
                default:
                  return null;
              }
            }));
  }

  List<Widget> _buildResult(List<DocumentSnapshot> restaurantListSnapshot){

    List<RestaurantHolder> restaurantHolder = List<RestaurantHolder>();
    restaurantListSnapshot.forEach((element) {
      Restaurant restaurant =Restaurant(
        name: element.data["name"],
        city: element.data["city"]
      );

      restaurantHolder.add(RestaurantHolder(restaurant: restaurant));
    });

    return restaurantHolder;

  }
}
