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
  List _ids = [];
  String _idDoc = "";

  get fileUp => _fileUp;
  get isLoading => _isLoading;
  get status => _status;
  get error => _error;
  get ids => _ids;
  get idDoc => _idDoc;
  get arquivos => _arqv;
  Stream<QuerySnapshot>? get games => _games;

  Future<void> addGame(File path, String date, GameModel game) async {
    try {
      await _gameController.addGame(game, date, path);
      _isLoading = false;
      _status = "Partida adicionado com Sucesso!";
      notifyListeners();
    } catch (err) {
      _isLoading = false;
      _status = "failed";
      _error = err.toString();
      notifyListeners();
    }
  }

  Future<void> getGames(DateTime date) async {
    try {
      List data = await _gameController.getGames(date);
      _games = data[0];
      _ids = data[1];
      _isLoading = false;
      notifyListeners();
    } catch (err) {
      _isLoading = false;
      _games = const Stream.empty();
      _error = err.toString();
      notifyListeners();
    }
  }

  Future<void> getImage(String nameCompetition, String date) async {
    try {
      String urlImage = await _gameController.loadImages(nameCompetition, date);
      _isLoading = false;
      _fileUp = urlImage;
      _status = "sucess";
      notifyListeners();
    } on FirebaseException catch (e) {
      _isLoading = false;
      _status = "failed";
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateImageGame(
      String competition, String date, String file) async {
    await _gameController.updateGame(competition, date, File(file));
    String urlImage = await _gameController.loadImages(competition, date);
    _isLoading = false;
    _fileUp = urlImage;
    notifyListeners();
  }

  Future<void> setImageGame(
      String competition, String date, String file) async {
    await _gameController.updateGame(competition, date, File(file));
    String urlImage = await _gameController.loadImages(competition, date);
    _isLoading = false;
    _fileUp = urlImage;
    notifyListeners();
  }

  Future<void> delete() async {
    try {
      await _gameController.delete(_idDoc);
      _isLoading = false;
      _status = "Partida deletada com sucesso.";
      notifyListeners();
    } catch (err) {
      _error = err.toString();
      notifyListeners();
    }
  }

  Future<void> setId(String id) async {
    _idDoc = id;
  }

  Future<void> updateMatchGame(String nameCompetition, String home, String away,
      String locale, String fase, DateTime date) async{
    await _gameController.updateMatchGame(nameCompetition, home, away, locale, fase, date);
  }
}
