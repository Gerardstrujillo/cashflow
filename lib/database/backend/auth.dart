import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cashflow/database/models/user.dart' as model;

class Auth {
  // BD
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // AUTH USER
  final FirebaseAuth auth = FirebaseAuth.instance;

  // USERS AUTH UID
  Future<model.User> getUserDetails() async {
    User docUser = auth.currentUser!;

    DocumentSnapshot doc = await firestore.collection('users').doc(docUser.uid).get();
    return model.User.fromSnap(doc);
  }

  // SIGN UP USER
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String business,
  }) async {
    String res = 'Ocurrió algún error';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          business.isNotEmpty) {
        // USERS STORE
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // MODEL USER
        model.User user = model.User(
            username: username,
            uid: cred.user!.uid,
            email: email,
            business: business);

        // ADD USER TO OUR DATABASE
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // LOGGIN IN USER
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Ocurrió algún error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'success';
      } else {
        res = 'Complete los campos';
      } 
    // on FirebaseException catch (err) {
    //   if (err.code == 'invalid-email') {
    //     res = 'Complete los campos';
    //   } else if (err.code == 'weak-password') {
    //     res = 'La contraseña debe tener 6 caracteres';
    //   }
    // }
    } catch (err) {
      res = err.toString();
    } 
    return res;
  }
}
