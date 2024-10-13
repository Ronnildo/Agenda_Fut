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
      switch(err.code){
        case "weak-password":
          throw const AuthException("Senha muito fraca").message;
        case "email-already-in-use":
          throw const AuthException("E-mail já cadastrado").message;
        case "invalid-email":
          throw const AuthException("E-mail inválido").message;
        case "operation-not-allowed":
           throw const AuthException("Operação não realizada").message;
        case "channel-error":
           throw const AuthException("Preencha as informações corretamente.").message;
      }
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
      switch (err.code){
        case "invalid-credential":
          throw const AuthException("E-mail não cadastrado ou senha incorreta").message;
        case "invalid-email":
          throw const AuthException("E-mail Inválido").message;
        case "channel-error":
          throw const AuthException("Preencha corretamente as informações.").message;
        case "too-many-requests":
          throw const AuthException("Tente novamente em instantes").message;
        case "wrong-password":
          throw const AuthException("Senha muito curta").message;
        case "user-not-found":
          throw const AuthException("E-mail não cadastrado").message;
        default:
          throw Exception(err.code);
          
      }
    }
  }

  Future<String> getUser() async {
    String? name = _firebaseAuth.currentUser?.displayName;
    return name!;
  }

  Future uploadImageUser(String pathImage) async {
    try{
      await _firebaseAuth.currentUser?.updatePhotoURL(pathImage);
      return "sucess";
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
    
  }

  Future<String> loadImagePerfil() async {
     try{
      String? photo = _firebaseAuth.currentUser?.photoURL;
      return photo!;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }
}
/**  flutter outdated & flutter pub upgrade & reload Windown*/
