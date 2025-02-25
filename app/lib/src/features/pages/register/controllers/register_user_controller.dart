import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:flutter/foundation.dart';

import '../domain/usecases/register_use_usecase/register_user_usecase_imp.dart';

class RegisterUserController extends ChangeNotifier {
  final RegisterUserUseCaseImp _registerUserUseCaseImp;

  RegisterUserController(this._registerUserUseCaseImp);

  Future<void> saveUser(String name, String email, String password) async {
    final user = UserEntity(name: name, email: email, password: password);
    await _registerUserUseCaseImp(user);
    notifyListeners();
  }
}
