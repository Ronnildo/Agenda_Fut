
import 'package:app/src/core/domain/entities/user_entity.dart';

import '../../../features/pages/register/domain/repositories/user_repository.dart';
import '../datasources/remote/user_remote_datasource_imp.dart';

class UserRepositoryImp implements UserRepository{

  final UserRemoteDataSourceImp _remoteDataSource;

  UserRepositoryImp(this._remoteDataSource);

  @override
  Future<void> saveUser(UserEntity userEntity) async {
    _remoteDataSource.saveUser(userEntity);
  }

}