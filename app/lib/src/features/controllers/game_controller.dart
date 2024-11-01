import 'dart:async';
import 'dart:io';

import 'package:app/src/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

      await _firestore
          .collection("matches")
          .doc(userId)
          .collection("games")
          .add(game.toJson());
    } on FirebaseException catch (err) {
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
    } on FirebaseException catch (e) {
      if (e.message == "Not Found.") {
        throw Exception("Imagem não disponível.");
      }
      throw Exception(e.message);
    }
  }

  Future getGames(DateTime date) async {
    String userId = _firebaseAuth.currentUser!.uid;
    int endDay = (24 - date.hour);

    DateTime nextDay = date.add( Duration(
      hours: endDay
    ));

    try {
      Stream<QuerySnapshot> games = _firestore
          .collection("matches")
          .doc(userId)
          .collection("games")
          .where(
            "date",
            isGreaterThanOrEqualTo: Timestamp.fromDate(date.add( Duration(hours: -date.hour))).toDate(),
          )
          .where(
            "date",
            isLessThan: Timestamp.fromDate(nextDay).toDate(),
          )
          .snapshots();
        return games;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  Future updateMatchGame(String docId, String nameCompetition, String home,
      String away, String locale, String fase, DateTime date) async {
    String userId = _firebaseAuth.currentUser!.uid;
    try {
      // DocumentSnapshot doc = await FirebaseFirestore.instance
      //     .collection(userId).doc("jERkT8UrIPySjzEXW5RN").get();
      GameModel gameModel = GameModel(
        nameCompetition: nameCompetition,
        home: home,
        away: away,
        locale: locale,
        fase: fase,
        date: date,
      );
      await _firestore
          .collection("matches")
          .doc(userId)
          .collection("games")
          .doc(docId)
          .update(
            gameModel.toJson(),
          );
    } on FirebaseException catch (err) {
      throw Exception(err.code);
    }
  }

  Future getMatcheId(String docId) async {
      String userId = _firebaseAuth.currentUser!.uid;
    try {
      DocumentSnapshot game = await _firestore
          .collection("matches")
          .doc(userId)
          .collection("games")
          .doc(docId)
          .get();
      
       return game.data();  
    } on FirebaseException catch (err) {
      throw Exception(err.code);
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
