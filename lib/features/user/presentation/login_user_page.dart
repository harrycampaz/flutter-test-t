import 'package:flutter/material.dart';

class LoginUserPage extends StatefulWidget {
  @override
  _LoginUserPageState createState() => _LoginUserPageState();
}

class _LoginUserPageState extends State<LoginUserPage> with SingleTickerProviderStateMixin {
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
    return  Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                  //color: const Color(0xFF66BB6A),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5.0,
                  ),]
              ),
              height: 340,
              padding: const EdgeInsets.only(top:28.0, left: 10, right: 10),

              child: Column(
                children: <Widget>[
                  _buildAddEmail(),
                  SizedBox(height: 15,),
                  _buildAddPassword(),
                  SizedBox(height: 45,),
                  _buildAddSubmit(),
                  SizedBox(height: 15,),

                ],
              ),
            ),

          ],
        )
    );;
  }


  _buildAddEmail(){
    return TextField(

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email,),
        hintText: "E-mail",
        border: UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
      ),

    );
  }

  _buildAddPassword(){
    return TextField(

      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline,),
          hintText: "Password"
      ),

    );
  }

  _buildAddSubmit() {
    return Container(
      width: 400,
      height: 50,
      child: RaisedButton(
          color: Colors.blue,
          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          onPressed: (){

          }),
    );
  }
}
