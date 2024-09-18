import 'package:app/src/features/controllers/user_controller.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  final UserController _userController = UserController();
  bool _isLoading = true;
  String error = ""; 

  get isLoading => _isLoading;

  Future<void> add(UserModel user) async{
    try{
      await _userController.adduser(user);
      _isLoading = false;
      notifyListeners();
    }on FirebaseException catch (err){
      error = err.message.toString();
      notifyListeners();
    }
  }

  Future<void> create(UserModel user) async {
    try{
      await _userController.createUser(user);
      _isLoading = false;
      notifyListeners();
    }on FirebaseAuthException catch (err){
      error = err.message.toString();
      notifyListeners();
    }
  }
}
