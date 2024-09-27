import 'package:app/src/features/controllers/user_controller.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserController _userController = UserController();
  bool _isLoading = true;
  String _error = "";
  String _status = "";
  String _name = "";
  String? _uuid;

  get isLoading => _isLoading;
  get error => _error;
  get status => _status;
  get name => _name;
  get uuid => _uuid;

  Future<void> add(UserModel user) async {
    try {
      await _userController.adduser(user);
      _isLoading = false;
      notifyListeners();
    } on FirebaseException catch (err) {
      _error = err.message.toString();
      notifyListeners();
    }
  }

  Future<void> create(UserModel user) async {
    try {
      await _userController.createUser(user);

      _isLoading = false;
      _status = "Cadastro Realizado com Sucesso!";
      notifyListeners();
    } catch (err) {
      throw Exception("Senha fraca!");
    }
  }

  Future<void> auth(UserModel user, void Function() login) async {
      try {
        await _userController.authUser(user);
        _status = "sucess";
        _isLoading = false;
        login();
        notifyListeners();
      }catch (e) {
        _status = "failed";
        _error = e.toString();
        notifyListeners();
      }
      _status = "";
      notifyListeners();
    
  }

  Future<void> singOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> getUser() async {
    String? user = await _userController.getUser();
    _name = user;
    notifyListeners();
  }
}
