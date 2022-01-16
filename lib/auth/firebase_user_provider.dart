import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Qonvay2FirebaseUser {
  Qonvay2FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

Qonvay2FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Qonvay2FirebaseUser> qonvay2FirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<Qonvay2FirebaseUser>(
        (user) => currentUser = Qonvay2FirebaseUser(user));
