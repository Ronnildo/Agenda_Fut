import 'package:app/src/core/domain/entities/user_entity.dart';

abstract class AuthUserDataSource {
  Future<void> createUser(UserEntity userEntity);
  Future<void> signInUser();
  Future<void> signOutUser();
  Future<void> deleteUser();
  Future<void> resetPasswordUser();
}