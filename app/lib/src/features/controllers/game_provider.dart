import 'dart:io';

import 'package:app/src/features/controllers/game_controller.dart';
import 'package:app/src/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  final GameController _gameController = GameController();
  late Stream<QuerySnapshot> _games;
  List<ListResult> _refs = [];
  List<String> _arqv = [];
  bool _isLoading = true;
  String _status = "";
  String _error = "";
  String _fileUp = "";

  get fileUp => _fileUp;
  get isLoading => _isLoading;
  get status => _status;
  get error => _error;
  get arquivos => _arqv;
  Stream<QuerySnapshot> get games => _games;

  loadImages(String nameCompetition) async {
    _refs = await _gameController.loadImages(nameCompetition);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getGames() async {
    try {
      _games = await _gameController.getGames();
      _isLoading = false;
      notifyListeners();
    } on FirebaseException catch (err) {
      _error = err.code;
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getImage(String nameCompetition) async {
    try {
      _refs = await _gameController.loadImages(nameCompetition);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception("Get Image Filed: $e");
    }
  }

  Future<void> uploadPath(String file) async {
    _fileUp = file;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addGame(File path, GameModel game) async {
    try {
      await _gameController.addGame(game, path);
      _isLoading = false;
      _fileUp = "";
      _status = "Partida adicionado com Sucesso!";
      notifyListeners();
    } on FirebaseException catch (err) {
      _error = err.code;
      notifyListeners();
    }
  }
}
