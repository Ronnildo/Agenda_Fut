import 'dart:io';

import 'package:app/src/core/repository.dart';
import 'package:app/src/models/position_model.dart';
import 'package:app/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      switch (err.code) {
        case "weak-password":
          throw const AuthException("Senha muito fraca").message;
        case "email-already-in-use":
          throw const AuthException("E-mail já cadastrado").message;
        case "invalid-email":
          throw const AuthException("E-mail inválido").message;
        case "operation-not-allowed":
          throw const AuthException("Operação não realizada").message;
        case "channel-error":
          throw const AuthException("Preencha as informações corretamente.")
              .message;
      }
    }
  }

  Future uploadImageUser(String pathImage) async {
    try {
      await _firebaseAuth.currentUser?.updatePhotoURL(pathImage);
      return "sucess";
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future authUser(UserModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case "invalid-credential":
          throw const AuthException("E-mail não cadastrado ou senha incorreta")
              .message;
        case "invalid-email":
          throw const AuthException("E-mail Inválido").message;
        case "channel-error":
          throw const AuthException("Preencha corretamente as informações.")
              .message;
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

  Future getNameUser() async {
    final userCredential = _firebaseAuth.currentUser;
    try {
      if (userCredential!.displayName == null) {
        return "";
      } else {
        return userCredential.displayName;
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future getPhoneUser() async {
    final userCredential = _firebaseAuth.currentUser;
    try {
      if (userCredential!.phoneNumber == null) {
        return "";
      } else {
        return userCredential.phoneNumber;
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future getPositionUser() async {
    final userCredential = _firebaseAuth.currentUser;
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection("positions")
          .doc(userCredential!.uid)
          .get();
      return PositionModel.fromJson(doc.data() as Map<String, dynamic>);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future loadImagePerfil() async {
    try {
      String? photo = _firebaseAuth.currentUser?.photoURL;
      return photo!;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future setPositionUser(String position) async {
    final userCredential = _firebaseAuth.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection("positions")
          .doc(userCredential!.uid)
          .set({"position": position});
      return "sucess";
    } on FirebaseException catch (err) {
      throw Exception(err.code);
    }
  }

  Future updateDisplayName(String newName) async {
    final userCredential = _firebaseAuth.currentUser;
    try {
      if (userCredential!.displayName == null ||
          userCredential.displayName != newName) {
        await userCredential.updateDisplayName(newName);
        return "sucess";
      } else {
        return "";
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
/**  flutter outdated & flutter pub upgrade & reload Windown*/
