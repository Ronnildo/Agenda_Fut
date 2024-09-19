import 'package:app/src/core/repository.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<String> authUser(UserModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return "sucess";
    } on FirebaseAuthException catch (err) {
      if (err.code == "user-not-found") {
        return "email";
      } else if (err.code == "wrong-password") {
        return "senha";
      }
    }
    return "error";
  }

  Future<String> getUser() async{
    String? name = await _firebaseAuth.currentUser?.displayName;
    return name!;
  }
}
/**  flutter outdated & flutter pub upgrade & reload Windown*/
