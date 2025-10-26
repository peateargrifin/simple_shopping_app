import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class authserv {
  signgoogle() async {
   // final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? goguser = await GoogleSignIn().signIn();



    final GoogleSignInAuthentication gauth = await goguser!.authentication;


    final cred = GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );



    return await FirebaseAuth.instance.signInWithCredential(cred);
  }
}
