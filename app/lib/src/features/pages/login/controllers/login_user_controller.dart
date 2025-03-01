import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:app/src/features/pages/login/domain/repositories/login_user_repository.dart';
import 'package:flutter/material.dart';

class LoginUserController extends ChangeNotifier{
  final LoginUserRepository _loginUserRepository;
  LoginUserController(this._loginUserRepository);

  bool _isLoading = true;
  bool _success = true;

  get isLoading => _isLoading;
  get success => _success;

  Future<void> login(String email, String password) async {
    final user = UserEntity(name: "", email: email, password: password);
    try{
      await _loginUserRepository.loginUser(user);
      _isLoading = false;
      _success = true;
      notifyListeners();      
    }catch(e){
      throw Exception("Erro ao fazer login.");
    }

  }
}