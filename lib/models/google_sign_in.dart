import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogle {
  Future<UserCredential> signInWithGoogle({required String token}) async {
    final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleAccount!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    //TODO : Add user to firestore using classes
    // ! Create User Class
    // ! Check for user in firestore
    // ! If user exists, return user
    // ! If user does not exist, create user and return user
    return userCred;
  }
}
