import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String business;

  const User({
    required this.uid,
    required this.username,
    required this.email,
    required this.business,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
        'business': business,
      };

  static User fromSnap(DocumentSnapshot e) {
    var jn = e.data() as Map<String, dynamic>;

    return User(
      uid: jn['uid'],
      username: jn['username'],
      email: jn['email'],
      business: jn['business'],
    );
  }
}
