import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HistorialBloc implements Bloc {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<QuerySnapshot> historialList(String id)  {

   return Firestore.instance.collection("users").document(id).collection("historial")
        .snapshots();
   
  }
      

  @override
  void dispose() {
    // TODO: implement dispose
  }

}