import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  // TODO : create private field for user class
  // TODO : create getter for user class
  // TODO : create setter for user class

  Future<void> signInWithEMailAndPassword(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    // ! await set user
  }

  Future<void> resetPass() async {
    await _auth.sendPasswordResetEmail(email: "drboucharebsarah@gmail.com");
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String token,
  }) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _auth.currentUser!.updateDisplayName(name);
    //TODO : Add user to firestore using classes
    // ? set the user model
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
