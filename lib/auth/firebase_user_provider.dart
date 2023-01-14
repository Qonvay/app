import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class QonvayAppV15FirebaseUser {
  QonvayAppV15FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

QonvayAppV15FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<QonvayAppV15FirebaseUser> qonvayAppV15FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<QonvayAppV15FirebaseUser>(
      (user) {
        currentUser = QonvayAppV15FirebaseUser(user);
        return currentUser!;
      },
    );
