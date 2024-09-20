import 'package:app/src/features/controllers/game_controller.dart';
import 'package:app/src/models/game_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  final GameController _gameController = GameController();
  Stream _games = const Stream.empty();
  bool _isLoading = true;
  String _status = "";
  String _error = "";

  get isLoading => _isLoading;
  get status => _status;
  get error => _error;
  get games => _games;

  Future<void> getGame() async {
    try {
      _games = await _gameController.getGames();
      _isLoading = false;
      _status = "";
      notifyListeners();
    } on FirebaseException catch (err) {
      _error = err.code;
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addGame(GameModel game) async {
    try {
      await _gameController.addGame(game);
      _isLoading = false;
      _status = "Partida adicionado com Sucesso!";
      notifyListeners();
    } on FirebaseException catch (err) {
      _error = err.code;
      notifyListeners();
    }
  }
}
