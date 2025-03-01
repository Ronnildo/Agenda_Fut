// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/src/features/pages/login/domain/repositories/login_user_repository.dart';
import 'package:app/src/features/pages/login/domain/usecases/login_user_usecase.dart';

import '../../../../../core/domain/entities/user_entity.dart';

class LoginUserUseCaseImp implements LoginUserUseCase {
  final LoginUserRepository _loginUserRepository;

  LoginUserUseCaseImp(this._loginUserRepository);

  @override
  Future<void> call(UserEntity userEntity) async {
    if(userEntity.isValidEmail()){
      return _loginUserRepository.loginUser(userEntity);
    }
    throw Exception("Login Error");
  }
}
