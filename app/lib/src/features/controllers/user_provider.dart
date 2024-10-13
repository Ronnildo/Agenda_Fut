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
  String _pathImage = "";
  String? _uuid;

  get isLoading => _isLoading;
  get error => _error;
  get status => _status;
  get name => _name;
  get uuid => _uuid;
  get pathImage => _pathImage;

  Future<void> create(UserModel user, void Function() page) async {
    try {
      _clear();
      notifyListeners();
      await _userController.createUser(user);

      _isLoading = false;
      _status = "Cadastro realizado com sucesso.";
      page();
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _status = "failed";
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> auth(UserModel user, void Function() login) async {
    try {
      _clear();
      notifyListeners();
      await _userController.authUser(user);
      _isLoading = false;
      _status = "sucess";
      print(status);
      login();
      notifyListeners();
    } catch (e) {
      _status = "failed";
       print(status);
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> singOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> getNameUser() async {
    String? user = await _userController.getUser();
    _name = user;
    notifyListeners();
  }

  Future<void> setPhoto(String path) async {
    try {
      _clear();
      notifyListeners();
      String res = await _userController.uploadImageUser(path);
      _isLoading = false;
      _status = res;
    } catch (e) {
      _isLoading = false;
      _status = "failed";
      _error = e.toString();
      _pathImage = "";
      notifyListeners();
    }
  }

  Future<void> getPhoto() async {
    try {
      String? url = await _userController.loadImagePerfil();
      _isLoading = false;
      _pathImage = url;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _status = "failed";
      _error = e.toString();
      _pathImage = "";
      notifyListeners();
    }
  }

  Future<void> _clear() async {
    _isLoading = true;
    _status = "";
    _error = "";
    _pathImage = "";
    notifyListeners();
  }
}
