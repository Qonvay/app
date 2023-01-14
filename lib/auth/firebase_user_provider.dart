import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class QonvayFirebaseUser {
  QonvayFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

QonvayFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<QonvayFirebaseUser> qonvayFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<QonvayFirebaseUser>((user) => currentUser = QonvayFirebaseUser(user));
