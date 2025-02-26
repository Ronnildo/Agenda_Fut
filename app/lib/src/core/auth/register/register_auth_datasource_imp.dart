import 'package:app/src/core/auth/auth_user_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class RegisterAuthDataSourceImp implements AuthUserDataSource {

  FirebaseAuth _firebaseAuth;
  RegisterAuthDataSourceImp(this._firebaseAuth);

  @override
  Future<void> createUser(UserEntity userEntity) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
            email: userEntity.email, password: userEntity.password)
        .then((v) async {
      await v.user!.updateDisplayName(userEntity.name);
      print("Success");
    }).onError((e, stackTrace) {
      print(e);
    });
  }

  @override
  Future<void> deleteUser() async {}

  @override
  Future<void> resetPasswordUser() async {}

  @override
  Future<void> signInUser() async {}

  @override
  Future<void> signOutUser() async {}
}
