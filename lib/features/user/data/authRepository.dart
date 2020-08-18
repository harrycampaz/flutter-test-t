import 'package:firebase_auth/firebase_auth.dart';
import 'firebaseAuthApi.dart';

class AuthRepository {

  final _firebaseAuth = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuth.signIn();

  signOut() => _firebaseAuth.signOut();

}