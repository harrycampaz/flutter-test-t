import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:tyga/features/historial/domain/Historial.dart';
import 'package:tyga/features/historial/presentation/bloc/historial_bloc.dart';
import 'package:tyga/features/historial/presentation/widget/historial_holder.dart';

class HistorialList extends StatefulWidget {
  final String uid;

  const HistorialList({Key key, this.uid}) : super(key: key);
  @override
  _HistorialListState createState() => _HistorialListState();
}

class _HistorialListState extends State<HistorialList> with SingleTickerProviderStateMixin {

  HistorialBloc historialBloc;

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

    historialBloc = BlocProvider.of<HistorialBloc>(context);

    return Container(
        margin:
        EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: StreamBuilder(
            stream: historialBloc.historialList(widget.uid),
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

    List<HistorialHolder> restaurantHolder = List<HistorialHolder>();
    restaurantListSnapshot.forEach((element) {
      Historial historial =Historial(
          search : element.data["search"],
      );

      restaurantHolder.add(HistorialHolder(historial: historial));
    });

    return restaurantHolder;

  }

}
