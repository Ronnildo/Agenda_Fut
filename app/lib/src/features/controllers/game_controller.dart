import 'dart:async';
import 'dart:io';

import 'package:app/src/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future addGame(GameModel game, String date, File path) async {
    String userId = _firebaseAuth.currentUser!.uid;
    try {
      String ref =
          'banners/${userId.toString()}_${game.nameCompetition!}_$date.jpg';
      if (path.path != "") {
        await _storage.ref(ref).putFile(path);
      }

      await _firestore.collection(userId).add(game.toJson());
    } on StorageException catch (err) {
      throw Exception(err.message);
    }
  }

  Future updateGame(String nameCompetition, String date, File path) async {
    String userId = _firebaseAuth.currentUser!.uid;
    try {
      String ref = 'banners/${userId.toString()}_${nameCompetition}_$date.jpg';
      if (path.path != "") {
        await _storage.ref(ref).putFile(path);
      }
    } on FirebaseException catch (err) {
      return err.message;
    }
  }

  Future loadImages(String nameCompetition, String date) async {
    String userId = _firebaseAuth.currentUser!.uid;
    try {
      final storageRef = _storage.ref();
      final res = await storageRef
          .child("/banners/${userId}_${nameCompetition}_$date.jpg")
          .getDownloadURL();
      if (res.isNotEmpty) {
        return res;
      } else {
        return "";
      }
    } on StorageException catch (e) {
      if (e.message == "Not Found.") {
        throw Exception("Imagem não disponível.");
      }
      throw Exception(e.message);
    }
  }

  Future getGames(DateTime date) async {
    String userId = _firebaseAuth.currentUser!.uid;

    DateTime nextDay = date.add(const Duration(
      days: 1,
    ));

    try {
      QuerySnapshot getDocs = await _firestore.collection(userId).get();
      List documents = [];
      for (DocumentSnapshot item in getDocs.docs) {
        var dados = item.id;
        documents.add(dados);
      }
      Stream<QuerySnapshot> games = _firestore
          .collection(userId)
          .where("date",
              isGreaterThanOrEqualTo: Timestamp.fromDate(date).toDate())
          .where("date",
              isLessThan: Timestamp.fromDate(nextDay).toDate())
          .snapshots();
      return [games, documents];
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  Future delete(String id) async {
    String userId = _firebaseAuth.currentUser!.uid;
    try {
      await _firestore.collection(userId).doc(id).delete();

      return "sucess";
    } on FirebaseException catch (err) {
      throw Exception(err.code);
    }
  }
}
