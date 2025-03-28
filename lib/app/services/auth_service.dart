import 'package:firebase_auth/firebase_auth.dart';
import 'package:tugas_flutter/app/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Untuk mendapatkan user yang sedang login
  User? get currentUser => _auth.currentUser;

  // Register user baru
  Future<UserModel?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user != null ? UserModel(uid: user.uid, email: user.email!) : null;
    } catch (e) {
      rethrow;
    }
  }

  // Login user
  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user != null ? UserModel(uid: user.uid, email: user.email!) : null;
    } catch (e) {
      rethrow;
    }
  }

  // Logout user
  Future<void> logout() async {
    await _auth.signOut();
  }
}
