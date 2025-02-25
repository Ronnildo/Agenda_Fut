import 'package:app/src/core/domain/datasources/remote/user_remote_datasource.dart';
import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  UserRemoteDataSourceImp(this._firebaseAuth);

  @override
  Future<void> saveUser(UserEntity userEntity) async {
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
}
