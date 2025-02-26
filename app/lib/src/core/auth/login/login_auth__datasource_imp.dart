import 'package:app/src/core/auth/auth_user_datasource.dart';

import '../../domain/entities/user_entity.dart';

class LoginAuthRegisterDataSourceImp implements AuthUserDataSource {
  @override
  Future<void> createUser(UserEntity userEntity) async {}

  @override
  Future<void> deleteUser() async {}

  @override
  Future<void> resetPasswordUser() async {}

  @override
  Future<void> signInUser() async {}

  @override
  Future<void> signOutUser() async {}
}
