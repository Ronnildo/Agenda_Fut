import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:app/src/core/domain/repositories/user_repository_imp.dart';

import 'register_user_usecase.dart';

class RegisterUserUseCaseImp implements RegisterUserUseCase {
  
  final UserRepositoryImp _userRepository;

  RegisterUserUseCaseImp(this._userRepository);


  @override
  Future<void> call(UserEntity user) async{
    if(user.isValidEmail() && user.isValidPassword()){
      return _userRepository.saveUser(user);
    }
    throw Exception("Email ou senha inválidos");
  }
}