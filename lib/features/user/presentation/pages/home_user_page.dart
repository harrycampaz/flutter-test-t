import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:tyga/features/historial/presentation/page/historial_page.dart';
import 'package:tyga/features/restaurant/presentation/pages/restaurant_page.dart';
import 'package:tyga/features/restaurant/presentation/pages/restaurant_search_page.dart';
import 'package:tyga/features/user/presentation/bloc/user_bloc.dart';

class HomeUserPage extends StatefulWidget {
  @override
  _HomeUserPageState createState() => _HomeUserPageState();
}

class _HomeUserPageState extends State<HomeUserPage> with SingleTickerProviderStateMixin {

  UserBloc userBloc;
  TextEditingController searchController;
  String error;
  String uid;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();

    uid = "";
    error = "";

  }

  @override
  void dispose() {

    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

     userBloc.getUserID().then((value) {
       setState(() {
         uid = value;
       });
     });

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSearch(),
              SizedBox(height: 15,),
              _buildAddSubmit(),
              SizedBox(height: 15,),
              Text(error, style: TextStyle(color: Colors.red),),
              SizedBox(height: 25,),
              _buildHistorial()
            ],)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          userBloc.signOut();
        },
        tooltip: 'Salir',
        child: Icon(Icons.exit_to_app),
      ),
    );
  }

  _buildSearch(){
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,),
        hintText: "Ingresa tu ciudad",
        border: UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
      ),

    );
  }

  _buildAddSubmit() {
    return Container(
      width: 400,
      height: 50,
      child: RaisedButton(
          color: Colors.blue,
          child: Text("Buscar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          onPressed: (){

            print(searchController.text);
            if(searchController.text.isNotEmpty){
              String search = searchController.text;
              Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantPage(searchText: search)));
              setState(() {
                error = "";

              });
              searchController.text = "";

            }else {
              setState(() {
                error = "El Campo no debe estar vacio";
              });
            }

          }),
    );
  }

  _buildHistorial() {
    return Container(
      width: 400,
      height: 50,
      child: RaisedButton(
          color: Colors.green,
          child: Text("Historial", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HistorialPage(uid: uid,)));
          }),
    );
  }
}
