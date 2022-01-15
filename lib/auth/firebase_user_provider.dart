import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FinWalletS1FirebaseUser {
  FinWalletS1FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FinWalletS1FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FinWalletS1FirebaseUser> finWalletS1FirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<FinWalletS1FirebaseUser>(
        (user) => currentUser = FinWalletS1FirebaseUser(user));
