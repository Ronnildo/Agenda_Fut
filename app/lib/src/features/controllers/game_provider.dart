import 'dart:io';
import 'package:app/src/features/controllers/game_controller.dart';
import 'package:app/src/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  // Controle de Requisições
  final GameController _gameController = GameController();
  Stream<QuerySnapshot> _games = const Stream.empty();
  // Representações do Estado de Game
  bool _isLoading = true;
  String _status = "";
  String _error = "";
  String _fileUp = "";
  String _id = "";
  String _home = "";
  String _away = "";
  String _locale = "";
  DateTime? _date;

  // Get métodos
  get fileUp => _fileUp;
  get isLoading => _isLoading;
  get status => _status;
  get error => _error;
  get id => _id;
  get home => _home;
  get away => _away;
  get locale => _locale;
  get date => _date;
  Stream<QuerySnapshot>? get games => _games;

  /// Função para Adicionar uma partida
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

  /// Função para Listar partidas do usuário
  Future getGames(DateTime date) async {
    try {
      _games = await _gameController.getGames(date);
      _isLoading = false;
      _status = "sucess";
      notifyListeners();
    } catch (err) {
      _games = const Stream.empty();
      _error = err.toString();
      notifyListeners();
    }
  }

  /// Função que retorna a imagem (Banner ou arte da partida) referente a partida
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

  /// Função para Atualizar a imagem (Banner ou arte da partida) de uma partida selecionada
  Future<void> updateImageGame(
      String competition, String date, String file) async {
    await _gameController.updateGame(competition, date, File(file));
    String urlImage = await _gameController.loadImages(competition, date);
    _isLoading = false;
    _fileUp = urlImage;
    notifyListeners();
  }

  /// Função para Atualizar a imagem (Banner ou arte da partida) de uma partida no momento da inserção
  /// da partida
  Future<void> setImageGame(
      String competition, String date, String file) async {
    await _gameController.updateGame(competition, date, File(file));
    String urlImage = await _gameController.loadImages(competition, date);
    _isLoading = false;
    _fileUp = urlImage;
    notifyListeners();
  }

  /// Função para Delatar uma partida listada
  Future<void> delete() async {
    try {
      await _gameController.delete(_id);
      _isLoading = false;
      _status = "Partida deletada com sucesso.";
      notifyListeners();
    } catch (err) {
      _error = err.toString();
      notifyListeners();
    }
  }

  /// Função para Atualizar detalhes de uma partida imagem (Banner ou arte da partida) e
  /// Demais informações de uma partida selecionada.
  Future<void> updateMatchGame(
      String docId,
      String nameCompetition,
      String home,
      String away,
      String locale,
      String fase,
      DateTime date) async {
    await _gameController.updateMatchGame(
        docId, nameCompetition, home, away, locale, fase, date);
  }

  Future<void> getMatcheDetails(String docId) async {
    try {
      Map<String, dynamic> doc = await _gameController.getMatcheId(docId);
      GameModel game = GameModel.fromJson(docId, doc);
      _isLoading = false;
      _home = game.home!;
      _away = game.away!;
      _locale = game.locale!;
      _date = game.date!;
      notifyListeners();
    } catch (err) {
      _error = err.toString();
      notifyListeners();
    }
  }

  Future setId(String id) async {
    _id = id;
  }
}
