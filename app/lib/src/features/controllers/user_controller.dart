import 'package:app/src/core/repository.dart';
import 'package:app/src/models/position_model.dart';
import 'package:app/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController extends Repository {
  final FirebaseAuth auth;

  UserController({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  @override
  Future<void> adduser(UserModel user) async {}

  Future<String> createUser(UserModel user) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: user.email!.trim(),
        password: user.password!.trim(),
      );

      return "Success";
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case "weak-password":
          return "Senha muito fraca";
        case "email-already-in-use":
          return "E-mail já cadastrado";
        case "invalid-email":
          return "E-mail inválido";
        case "operation-not-allowed":
          return "Operação não realizada";
        case "channel-error":
          return "Preencha as informações corretamente.";
        default:
          return "Error";
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<String> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return "Verifique seu e-mail para redefir sua senha.";
    } on FirebaseException catch (err) {
      return err.message!;
    } catch (err) {
      rethrow;
    }
  }

  Future<String> uploadImageUser(String pathImage) async {
    try {
      await auth.currentUser?.updatePhotoURL(pathImage);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (err) {
      rethrow;
    }
  }

  Future<String> authUser(UserModel user) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return "Success";
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case "invalid-credential":
          return "E-mail não cadastrado ou senha incorreta";
        case "email-already-in-use":
          return "E-mail já cadastrado";
        case "invalid-email":
          return "E-mail inválido";
        case "too-many-requests":
          return "Tente novamente em instantes";
        case "channel-error":
          return "Preencha as informações corretamente.";
        case "user-not-found":
          return "E-mail não cadastrado";
        default:
          return "Error";
      }
    } catch (err) {
      rethrow;
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  String? getNameUser() {
    try {
      if (auth.currentUser?.displayName != null) {
        return auth.currentUser?.displayName;
      }
      return "";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      rethrow;
    }
  }

  Future getPositionUser() async {
    final userCredential = auth.currentUser;
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection("positions")
          .doc(userCredential!.uid)
          .get();
      if (doc.exists) {
        return PositionModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return PositionModel(position: "");
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  String? loadImagePerfil() {
    try {
      String? photo = auth.currentUser?.photoURL;
      if (photo == null) {
        return "";
      }
      return photo;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      rethrow;
    }
  }

  Future setPositionUser(String position) async {
    final userCredential = auth.currentUser;
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

  Future<String> updateDisplayName(String newName) async {
    final userCredential = auth.currentUser;
    try {
      if (userCredential?.displayName == null ||
          userCredential?.displayName != newName) {
        await userCredential?.updateDisplayName(newName);
        return "Success";
      } else {
        return "";
      }
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      rethrow;
    }
  }
}
/**  flutter outdated & flutter pub upgrade & reload Windown*/