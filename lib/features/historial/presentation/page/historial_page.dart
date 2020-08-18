import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:tyga/features/historial/presentation/bloc/historial_bloc.dart';
import 'package:tyga/features/historial/presentation/widget/historial_list.dart';
class HistorialPage extends StatefulWidget {
  final String uid;

  const HistorialPage({Key key, this.uid}) : super(key: key);
  @override
  _HistorialPageState createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> with SingleTickerProviderStateMixin {
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
        bloc: HistorialBloc(),
        child: Scaffold(appBar: AppBar(title: Text("Historial"),),
        body: HistorialList(uid: widget.uid,)));
  }
}
