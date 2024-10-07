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

  Future<String> addGame(GameModel game, File path) async {
    String userId = _firebaseAuth.currentUser!.uid;
    try {
      String ref = 'banners/${userId.toString()}_${game.nameCompetition!}.jpg';
      if (path.path != "") {
        await _storage.ref(ref).putFile(path);
      }

      await _firestore.collection(userId).add(game.toJson());
      return "sucess";
    } on FirebaseException catch (err) {
      return err.code;
    }
  }

  Future loadImages(String nameCompetition) async {
    String userId = _firebaseAuth.currentUser!.uid;
    try {
      final storageRef = _storage.ref();
      final res = await storageRef.child("/banners").listAll();
      for (var item in res.items) {
        if(item.fullPath.split("/")[1] == "${userId}_$nameCompetition.jpg"){
          final url = await storageRef.child("/banners/${userId}_$nameCompetition.jpg").getDownloadURL();
          return url;
        }else{
          return "";
        }
      }
    } on StorageException catch (e) {
      if (e.message == "Not Found.") {
        throw Exception("Imagem não disponível.");
      }
      throw Exception(e.message);
    }
  }

  Future getGames() async {
    String userId = _firebaseAuth.currentUser!.uid;
    try {
      Stream<QuerySnapshot> games = _firestore.collection(userId).snapshots();
      return games;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
}
