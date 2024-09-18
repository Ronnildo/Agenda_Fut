import 'package:app/src/core/repository.dart';
import 'package:app/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController extends Repository {
  CollectionReference _users = FirebaseFirestore.instance.collection("atletas");
  @override
  Future<void> adduser(UserModel user) async {
    return _users
        .add(user.toJosn())
        .then((value) => print("Atleta Inserido com sucesso"))
        .catchError((err) => print(err));
  }

  Future<void> createUser(UserModel user) async {
    // final credential = await FirebaseAuth.instance.signInAnonymously();
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } on FirebaseAuthException catch (err) {
      if (err.code == "weak-password") {
        print('The password provided is too weak.');
      } else if (err.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
/**  flutter outdated & flutter pub upgrade & reload Windown*/
