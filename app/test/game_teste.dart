// import 'package:app/src/features/controllers/game_controller.dart';
// import 'package:app/src/models/game_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class MockFirebaseStorage extends Mock implements FirebaseStorage {}

// // ignore: subtype_of_sealed_class
// class MockCollectionReference extends Mock implements CollectionReference {
//   @override
//   Future<DocumentReference<Map<String, dynamic>>> add(
//     Map<String, dynamic> data,
//   ) async {
//     final newDocument = doc();
    
//     super.noSuchMethod(
//       Invocation.method(#add, [data]),
//       returnValue: Future.value(await newDocument.set(data);),
//     );
//   }
// }

// class MockDocumentReference extends Mock implements DocumentReference {}

// class MockFirabaseFirestore extends Mock implements FirebaseFirestore {}

// void main() {
//   MockFirebaseStorage mockFirebaseStorage = MockFirebaseStorage();
//   MockFirabaseFirestore mockFirabaseFirestore = MockFirabaseFirestore();
//   GameController gameController = GameController();

//   setUp(() {});
//   tearDown(() {});

//   test("Add matche test", () {
//     when(mockFirabaseFirestore
//             .collection("matches")
//             .doc("userId")
//             .collection("games")
//             .add(GameModel(
//                     nameCompetition: "nameCompetition",
//                     home: "home",
//                     away: "away",
//                     locale: "locale",
//                     fase: "fase",
//                     date: DateTime.now())
//                 .toJson()))
//         .thenAnswer((realInvocation) async => MockCollectionReference());
//   });
// }
