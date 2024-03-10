// auth.dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Successful signup
    } catch (e) {
      return e.toString(); // Return error message
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Successful login
    } catch (e) {
      return e.toString(); // Return error message
    }
  }

  // Sign out
  Future signOut() async {
    await _auth.signOut();
  }

  // Check if user is signed in
  Stream<User?> get user => _auth.authStateChanges();
}
