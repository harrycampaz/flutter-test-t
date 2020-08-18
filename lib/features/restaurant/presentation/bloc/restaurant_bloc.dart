import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class RestauranBloc implements Bloc {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Stream<QuerySnapshot> restauranList(String search) =>
      Firestore.instance.collection("restaurants")
      .where("city", isEqualTo: search)
      .snapshots();


  void setHistorial(String search) async {
    await _auth.currentUser().then((user) {
      CollectionReference ref = _db.collection("users").document(user.uid).collection("historial");
      ref.add({
        "search": search,
        "created_at": DateTime.now()
      });
      
    });
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
  }

}