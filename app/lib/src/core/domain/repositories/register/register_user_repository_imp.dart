
import 'package:app/src/core/domain/datasources/remote/user_remote_datasource.dart';
import 'package:app/src/core/domain/entities/user_entity.dart';

import '../../../../features/pages/register/domain/repositories/user_repository.dart';

class RegisterUserRepositoryImp implements UserRepository{

  final UserRemoteDataSource _registerAuthDataSourceImp;

  RegisterUserRepositoryImp(this._registerAuthDataSourceImp);

  @override
  Future<void> saveUser(UserEntity userEntity) async {
    _registerAuthDataSourceImp.saveUser(userEntity);
  }

}