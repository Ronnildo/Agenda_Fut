import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:app/src/core/domain/repositories/register_user_repository_imp.dart';

import 'register_user_usecase.dart';

class RegisterUserUseCaseImp implements RegisterUserUseCase {
  
  final RegisterUserRepositoryImp _registerUserRepositoryImp;

  RegisterUserUseCaseImp(this._registerUserRepositoryImp);


  @override
  Future<void> call(UserEntity user) async{
    if(user.isValidEmail() && user.isValidPassword()){
      return _registerUserRepositoryImp.saveUser(user);
    }
    throw Exception("Email ou senha inválidos");
  }
}