import 'package:app/src/features/controllers/user_controller.dart';
import 'package:app/src/models/position_model.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/functions.dart';

class UserProvider extends ChangeNotifier {
  late FirebaseAuth firebaseAuth;
  final UserController _userController =
      UserController(auth: FirebaseAuth.instance);
  bool _isLoading = true;
  String _error = "";
  String _status = "";
  String _name = "";
  String _position = "";
  String _pathImage = "";
  String? _uuid;

  get isLoading => _isLoading;
  get error => _error;
  get status => _status;
  get name => _name;
  get position => _position;
  get uuid => _uuid;
  get pathImage => _pathImage;

  Future<void> create(UserModel user, void Function() page) async {
    String? validateEmail = Functions.validateEmail(user.email!);

    if (validateEmail != null || user.email! != "") {
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
        _error = e.toString().split(":")[1].trim();
        notifyListeners();
      }
    } else {
      _clear();
      notifyListeners();
      _isLoading = false;
      _status = "failed";
      _error = "Campos vazios, preencha todos os campos.";
      notifyListeners();
    }
  }

  Future resetPassword(String email) async {
    try {
      String res = await _userController.resetPassword(email);
      _isLoading = false;
      _status = res;
      notifyListeners();
    } catch (err) {
      _error = err.toString().split(":")[1].trim();
      notifyListeners();
    }
  }

  Future<void> auth(String email, String password) async {
    try {
      _clear();
      notifyListeners();
      String res = await _userController.authUser(email, password);
      if (res == "Success") {
        _isLoading = false;
        _status = res;
        notifyListeners();
        String? userName = _userController.getNameUser();
        PositionModel pos = await _userController.getPositionUser();
        _name = userName!;
        _position = pos.position!;
        notifyListeners();
      }
    } on Exception catch (e) {
      _status = "failed";
      _error = e.toString().split(":")[1].trim();
      debugPrint(_error[0]);
      notifyListeners();
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     UserCredential user = await _userController.signInWithGoogle();
  //     _isLoading = false;
  //     _name = user.user!.displayName!;
  //     _status = "sucess";
  //     notifyListeners();
  //   } catch (err) {
  //     _status = "failed";
  //     _error = err.toString();
  //     notifyListeners();
  //   }
  // }

  // Future<void> signInWithFacebook() async {
  //   try {
  //     UserCredential user = await _userController.signInWithGoogle();
  //     _isLoading = false;
  //     _name = user.user!.displayName!;
  //     _pathImage = user.user!.photoURL!;
  //     _status = "sucess";
  //     notifyListeners();
  //   } catch (err) {
  //     _status = "failed";
  //     _error = err.toString();
  //     notifyListeners();
  //   }
  // }

  Future<void> singOut() async {
    FirebaseAuth.instance.signOut();
    _clear();
    notifyListeners();
  }

  Future<void> getUser() async {
    String? userName = _userController.getNameUser();
    PositionModel pos = await _userController.getPositionUser();
    _name = userName!;
    _position = pos.position!;
    notifyListeners();
  }

  Future<void> setPostionUser(String position) async {
    try {
      String res = await _userController.setPositionUser(position);
      _isLoading = false;
      _status = res;
      notifyListeners();
    } catch (e) {
      _status = "failed";
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> setPhoto(String path) async {
    try {
      _clear();
      await _userController.uploadImageUser(path);
      _isLoading = false;
      _status = "sucess";
      notifyListeners();
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
      String? url = _userController.loadImagePerfil();
      _isLoading = false;
      _status = "sucess";
      _pathImage = url!;
    } catch (e) {
      _isLoading = false;
      _status = "failed";
      _error = e.toString();
      _pathImage = "";
      notifyListeners();
    }
  }

  Future updateUserName(String newName) async {
    try {
      String res = await _userController.updateDisplayName(newName);
      _isLoading = false;
      _status = res;
      notifyListeners();
    } catch (err) {
      _error = err.toString();
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
