import 'package:app/src/features/controllers/user_controller.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  final UserController _userController = UserController();
  bool _isLoading = true;
  String _error = ""; 
  String _status = "";
  String _name = "";
  String _uuid = "";

  get isLoading => _isLoading;
  get error => _error;
  get status => _status;
  get name => _name;
  get uuid => _uuid;

  Future<void> add(UserModel user) async{
    try{
      await _userController.adduser(user);
      _isLoading = false;
      notifyListeners();
    }on FirebaseException catch (err){
      _error = err.message.toString();
      notifyListeners();
    }
  }

  Future<void> create(UserModel user) async {
    try{
      String res = await _userController.createUser(user);
      if(res == "sucess"){
        _isLoading = false;
        _status = "Usuário Cadastrado!";
        notifyListeners();
      }else if (res == "password"){
        _isLoading = false;
        _status = "Senha muito fraca!";
        notifyListeners();
      }else if (res == "email"){
        _isLoading = false;
        _status = "E-mail já Cadastrado!";
        notifyListeners();
      }else{
        _isLoading = false;
        _status = "Erro E-mail ou Senha Inválidos!";
        notifyListeners();
      }
    }on FirebaseException catch (err){
      _error = err.message.toString();
      notifyListeners();
    }
  }

  Future<void> auth(UserModel user, void Function() function) async{
     try {
       String auth = await _userController.authUser(user);
       if(auth == "sucess"){
        _isLoading = false;
        _status = "SingIn";
        notifyListeners();
        function();
       }
       else if(auth == "email"){
        _status = "E-mail não Cadastrado!";
        _isLoading = false;
        notifyListeners();
       }else if(auth == "password"){
         _status = "Senha inválida!";
        _isLoading = false;
        notifyListeners();
       }else if (auth == "error"){
        _status = "E-mail ou Senha Inválidas!";
       }
     }on FirebaseException catch (e) {
        _error = e.message.toString();
        _isLoading = false;
        notifyListeners();
     }
  }
  Future<void> singOut(void Function() function) async{
    await FirebaseAuth.instance.signOut();
  }

  Future<void> getUser() async{
    String? user = await _userController.getUser();
    _name = user;
    notifyListeners();
  }
}
