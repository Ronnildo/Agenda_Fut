import 'package:app/src/core/domain/datasources/remote/user_remote_datasource.dart';
import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      debugPrint("Success");
    }).onError((e, stackTrace) {
      debugPrint(e.toString());
    });
  }

  @override
  Future<void> login(UserEntity userEntity) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password,
    ).then((v){
      debugPrint("success");
    }).onError((e, strackTrace){
      debugPrint(e.toString());
    });
  }
}
