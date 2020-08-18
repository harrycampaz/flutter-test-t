import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken)).then((onValue) => onValue.user);

    return user;

  }

  void signOut() async {
    await _auth.signOut().then((onValue) => print("Session Cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }
}