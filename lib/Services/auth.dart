import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:o_card/Services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // // create user obj based on FirebaseUser
  User? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return user;
  }

  // auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user = result.user;

      return _userFromFirebase(user);
    }
    catch(e) {
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      DatabaseService(uid: user!.uid).addNewUserData(email);
      return _userFromFirebase(user);
    }
    catch(e) {
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      return null;
    }
  }

  // reset password
  Future sendPasswordResetEmail(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

}