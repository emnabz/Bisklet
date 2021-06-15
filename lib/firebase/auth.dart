import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create Accoun
  Future<String> createAccount({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Account created";
    } on FirebaseAuthException catch (e) {
      print("exception");
      print(e);
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else if (e.code == 'unknown') {
        return 'Please fill all the fields.';
      }
    } catch (e) {
      return "Error occurred";
    }
  }

  //Sign in user
  Future<String> signIN({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      }
        else if (e.code == 'unknown') {
        return 'Please fill all the fields.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  //Reset Password
  Future<String> resetPassword({String email}) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      return "Error occurred";
    } catch (e) {
      return "Email sent";
      
    }
  }

  //SignOut
  void signOut() {
    auth.signOut();
  }
}
