import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> registerUser({
    required String email,
    required String password,
    required String role,
  }) async {

    UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'email': email,
      'role': role,
    });
  }

  Future<UserCredential> loginUser({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<String> getUserRole() async {

    String uid = _auth.currentUser!.uid;

    DocumentSnapshot doc =
        await _firestore
            .collection('users')
            .doc(uid)
            .get();

    return doc['role'];
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}