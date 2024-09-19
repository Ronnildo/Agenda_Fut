import 'package:app/src/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GameController{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> addGame(GameModel game) async {
    String userId =  _firebaseAuth.currentUser!.uid;
    try{
      await _firestore.collection(userId).add(game.toJson());
      return "sucess";
    } on FirebaseException catch(err){
      print(err.code);
      return "error";
    }
  }

}