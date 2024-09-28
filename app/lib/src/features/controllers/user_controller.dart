import 'package:app/src/core/repository.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends Repository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> adduser(UserModel user) async {}

  Future createUser(UserModel user) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      await userCredential.user!.updateDisplayName(user.name);
    } on FirebaseAuthException catch (err) {
      if (err.code == "weak-password") {
        throw const AuthException("Senha muito fraca").message;
      } else if (err.code == 'email-already-in-use') {
        throw const AuthException("E-mail já cadastrado").message;
      } else if (err.code == 'invalid-email') {
        throw const AuthException("E-mail inválido").message;
      } else if (err.code == 'operation-not-allowed') {
        throw const AuthException("Operação não realizada").message;
      } else {
        throw err.code;
      }
    }
  }

  Future authUser(UserModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-credential") {
        throw const AuthException("Senha Incorreta").message;
      } else if (err.code == "invalid-email") {
        throw const AuthException("E-mail Inválido").message;
      } else if (err.code == "channel-error") {
        throw const AuthException("Campos vazios").message;
      } else if (err.code == "too-many-requests") {
        throw const AuthException("Tente novamente em instantes").message;
      } else if (err.code == "wrong-password") {
        throw const AuthException("Senha muito curta").message;
      } else if (err.code == "user-not-found") {
        throw const AuthException("E-mail não cadastrado").message;
      } else {
        throw Exception(err.code);
      }
    }
  }

  Future<String> getUser() async {
    String? name = _firebaseAuth.currentUser?.displayName;
    return name!;
  }
}
/**  flutter outdated & flutter pub upgrade & reload Windown*/
