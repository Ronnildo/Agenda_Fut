import 'dart:io';

import 'package:app/src/features/controllers/game_controller.dart';
import 'package:app/src/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  final GameController _gameController = GameController();
  Stream<QuerySnapshot>? _games;
  final List<String> _arqv = [];
  bool _isLoading = true;
  String _status = "";
  String _error = "";
  String _fileUp = "";

  get fileUp => _fileUp;
  get isLoading => _isLoading;
  get status => _status;
  get error => _error;
  get arquivos => _arqv;
  Stream<QuerySnapshot>? get games => _games;

  Future<void> getGames(DateTime date) async {
    // print(date);
    try {
      _games = await _gameController.getGames(date);
      _isLoading = false;
      _status = "sucess";
      notifyListeners();
    } catch (err) {
      _isLoading = false;
      _games = const Stream.empty();
      _error = err.toString();
      notifyListeners();
    }
  }

  Future<void> getImage(String nameCompetition, String hour) async {
    try {
      String urlImage = await _gameController.loadImages(nameCompetition, hour);
      _isLoading = false;
      _fileUp = urlImage;
      _status = nameCompetition;
      notifyListeners();
    } on FirebaseException catch (e) {
      _isLoading = false;
      _status = "failed";
      _fileUp = "";
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateImageGame(String competition, String hour, String file) async {
    await _gameController.updateGame(competition, hour, File(file));
    String urlImage = await _gameController.loadImages(competition, hour);
    _isLoading = false;
    _fileUp = urlImage;
    notifyListeners();
  }

  Future<void> addGame(File path, String date, GameModel game) async {
    try {
      await _gameController.addGame(game, date, path);
      _isLoading = false;
      _fileUp = "";
      _status = "Partida adicionado com Sucesso!";
      getImage(game.nameCompetition!, date);
      notifyListeners();
    } on FirebaseException catch (err) {
      _error = err.code;
      notifyListeners();
    }
  }
}
