import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:tyga/features/user/presentation/login_user_page.dart';
import 'package:tyga/features/user/presentation/pages/home_user_page.dart';
import 'package:tyga/features/user/presentation/bloc/user_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  UserBloc userBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(

        child: StreamBuilder(
          stream: userBloc.authStatus,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (!snapshot.hasData || snapshot.hasError) {
              return Center(child: sigInGoogleUI());
            } else {
              print(snapshot.data);
              return HomeUserPage();
            }
          },
        )
      ),
    );
  }


  Widget sigInGoogleUI() {
    return
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Login with Gmail"),
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((onValue) {
                    print(onValue.displayName);

                  }).catchError((onError) {
                    print(onError);
                  });
                },

              )
            ],
          );

  }

}