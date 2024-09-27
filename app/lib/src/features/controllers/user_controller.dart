import 'package:app/src/core/repository.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends Repository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> adduser(UserModel user) async {}

  Future<String> createUser(UserModel user) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      await userCredential.user!.updateDisplayName(user.name);
      return "sucess";
    } on FirebaseAuthException catch (err) {
      if (err.code == "weak-password") {
        return "password";
      } else if (err.code == 'email-already-in-use') {
        return "email";
      }
    } catch (e) {
      return "";
    }
    return "failed";
  }

  Future authUser(UserModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-credential") {
        throw const AuthException("Erro: Senha Incorreta").message;
      } else if (err.code == "invalid-email") {
        throw const AuthException("Erro: E-mail Inválido").message;
      } else if (err.code == "channel-error") {
        throw const AuthException("Erro: Campos vazios").message;
      } else if (err.code == "too-many-requests") {
        throw const AuthException("Erro: Tente novamente em instantes").message;
      } else if (err.code == "wrong-password") {
        throw const AuthException("Erro: Senha muito curta").message;
      } else if (err.code == "user-not-found") {
        throw const AuthException("Erro: E-mail não cadastrado").message;
      } else {
        throw Exception("Error: ${err.code}");
      }
    }
  }

  Future<String> getUser() async {
    String? name = _firebaseAuth.currentUser?.displayName;
    return name!;
  }
}
/**  flutter outdated & flutter pub upgrade & reload Windown*/
