import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:tyga/features/user/data/authRepository.dart';

class UserBloc implements Bloc {

  final _authRepository = AuthRepository();

  Stream <FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> signIn(){
    return _authRepository.signInFirebase();
  }

  getUserID()  {
    return  FirebaseAuth.instance.currentUser().then((value) => value.uid);
  }


  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {

  }

}