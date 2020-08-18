import 'package:flutter/material.dart';
import 'package:tyga/features/historial/domain/Historial.dart';


class HistorialHolder extends StatefulWidget {

  final Historial historial;

  const HistorialHolder({Key key, this.historial}) : super(key: key);

  @override
  _HistorialHolderState createState() => _HistorialHolderState();
}

class _HistorialHolderState extends State<HistorialHolder> with SingleTickerProviderStateMixin {


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
    return ListTile(
      title: Text(widget.historial.search),
    );
  }
}
