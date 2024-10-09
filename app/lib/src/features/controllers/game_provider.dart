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

  Future<void> getGames() async {
    try {
      _games = await _gameController.getGames();
      _isLoading = false;
      _status = "sucess";
      notifyListeners();
    } catch (err) {
      _error = err.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getImage(String nameCompetition) async {
    try {
      String urlImage = await _gameController.loadImages(nameCompetition);
      // print(urlImage);
      _isLoading = false;
      _fileUp = urlImage;
      _status = nameCompetition;
      notifyListeners();
    } on FirebaseException catch (e) {
      _isLoading = false;
      _fileUp = "";
      _status = "failed";
      _error = e.toString();
      _isLoading = true;
      notifyListeners();
    }
  }

  Future<void> uploadPath(String file) async {
    _isLoading = false;
    _fileUp = file;
    notifyListeners();
  }

  Future<void> resetPath() async {
    _isLoading = false;
    _fileUp = "";
    notifyListeners();
  }

  Future<void> updateImageGame(String competition, String file) async {
    await _gameController.updateGame(competition, File(file));
    String urlImage = await _gameController.loadImages(competition);
    _isLoading = false;
    _fileUp = urlImage;
    notifyListeners();
  }

  Future<void> addGame(File path, GameModel game) async {
    try {
      await _gameController.addGame(game, path);
      _isLoading = false;
      _fileUp = "";
      _status = "Partida adicionado com Sucesso!";
      getImage(game.nameCompetition!);
      notifyListeners();
    } on FirebaseException catch (err) {
      _error = err.code;
      notifyListeners();
    }
  }
}
