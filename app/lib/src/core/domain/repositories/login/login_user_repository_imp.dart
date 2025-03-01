import 'package:app/src/core/domain/datasources/remote/user_remote_datasource.dart';
import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:app/src/features/pages/login/domain/repositories/login_user_repository.dart';

class LoginUserRepositoryImp implements LoginUserRepository {
  final UserRemoteDataSource _userRemoteDataSourceImp;

  LoginUserRepositoryImp(this._userRemoteDataSourceImp);
  
  @override
  Future<void> loginUser(UserEntity user) async {
    _userRemoteDataSourceImp.login(user);
  }

  
}
