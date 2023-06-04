import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

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
      print(e.toString());
      return null;
    }
  }

  // create a new document for the user with the uid
  // Future databaseSave(String fullName, String gender, String college, String role, String picture, String token) async {
  //
  //   try {
  //     FirebaseUser user = await _auth.currentUser();
  //     await DatabaseService(uid: user.uid).newUserData(fullName, gender, college, role, picture);
  //     await DatabaseService(uid: user.uid).updateUserToken(token);
  //     return user;
  //   }
  //   catch(e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password, String fullName, String gender, String college, String role, String picture) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = result.user;

      // await DatabaseService(uid: user.uid).newUserData(fullName, gender, college, role, picture);

      return _userFromFirebase(user!);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  // reset password
  Future sendPasswordResetEmail(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

}