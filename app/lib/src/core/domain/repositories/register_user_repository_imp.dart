
import 'package:app/src/core/auth/register/register_auth_datasource_imp.dart';
import 'package:app/src/core/domain/entities/user_entity.dart';

import '../../../features/pages/register/domain/repositories/user_repository.dart';

class RegisterUserRepositoryImp implements UserRepository{

  final RegisterAuthDataSourceImp _registerAuthDataSourceImp;

  RegisterUserRepositoryImp(this._registerAuthDataSourceImp);

  @override
  Future<void> saveUser(UserEntity userEntity) async {
    _registerAuthDataSourceImp.createUser(userEntity);
  }

}