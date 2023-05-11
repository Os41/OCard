import '../Models/user.dart';

class AuthService {

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // // create user obj based on FirebaseUser
  // User _userFromFirebaseUser(FirebaseUser user) {
  //   return user != null ? User(uid: user.uid) : null;
  // }

  // auth change user stream
  Stream<User>? get user {
    return null;
    // _auth.onAuthStateChanged
    //     .map(_userFromFirebaseUser);
  }

  // // sign in with email & password
  // Future signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     FirebaseUser user = result.user;
  //
  //     bool _isUserEmailVerified = user.isEmailVerified;
  //     if (_isUserEmailVerified == false){
  //       return user.isEmailVerified;
  //     }else if (_isUserEmailVerified == true){
  //       return _userFromFirebaseUser(user);
  //     }
  //
  //   }
  //   catch(e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
  //
  // // create a new document for the user with the uid
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
  //
  // // register with email & password
  // Future registerWithEmailAndPassword(String email, String password, String fullName, String gender, String college, String role, String picture) async {
  //   try {
  //     AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     FirebaseUser user = result.user;
  //
  //     await DatabaseService(uid: user.uid).newUserData(fullName, gender, college, role, picture);
  //
  //     await user.sendEmailVerification();
  //
  //     await signOut();
  //
  //     return _userFromFirebaseUser(user);
  //   }
  //   catch(e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
  //
  // // sign out
  // Future signOut() async {
  //   try {
  //     FirebaseUser user = await _auth.currentUser();
  //     bool isAnonymous = user.isAnonymous;
  //     if (isAnonymous == true) {
  //       await DatabaseService(uid: user.uid).deleteUserData();
  //       return user.delete();
  //     }else {
  //       await googleSignIn.signOut();
  //       return await _auth.signOut();
  //     }
  //   }
  //   catch(e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
  //
  // //reset password
  // Future sendPasswordResetEmail(String email) async {
  //   return await _auth.sendPasswordResetEmail(email: email);
  // }

}