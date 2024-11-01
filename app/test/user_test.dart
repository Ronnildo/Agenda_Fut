import 'dart:io';

import 'package:app/src/features/controllers/user_controller.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {
  @override
  Future<String> updatePhotoURL(String? photoURL) => super.noSuchMethod(
        Invocation.method(#updatePhotoURL, [photoURL]),
        returnValue: Future.value(""),
      );

  @override
  Future<String?> updateDisplayName(String? displayName) => super.noSuchMethod(
        Invocation.method(#updateDisplayName, [displayName]),
        returnValue: Future.value(""),
      );

  @override
  String? get displayName => super.noSuchMethod(
        Invocation.getter(
          #displayName,
        ),
        returnValue: "",
      );

  @override
  String? get photoURL => super.noSuchMethod(
        Invocation.getter(
          #photoURL,
        ),
        returnValue: "",
      );
}

class MockUserCredential extends Mock implements UserCredential {}

final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
          Invocation.method(#createUserWithEmailAndPassword, [email, password]),
          returnValue: Future.value(MockUserCredential()));

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
          Invocation.method(#signInWithEmailAndPassword, [email, password]),
          returnValue: Future.value(MockUserCredential()));
  @override
  Future<String> sendPasswordResetEmail({
    required String email,
    ActionCodeSettings? actionCodeSettings,
  }) =>
      super.noSuchMethod(
        Invocation.method(#sendPasswordResetEmail, [email, actionCodeSettings]),
        returnValue: Future.value(""),
      );
}

void main() {
  final MockFirebaseAuth mockAuth = MockFirebaseAuth();
  final MockUserCredential mockUserCredential = MockUserCredential();
  final UserController user = UserController(auth: mockAuth);

  setUp(() {});
  tearDown(() {});

  test("emit occurs", () {
    expectLater(user.user, emitsInOrder([_mockUser]));
  });
  test("Create Account test", () async {
    UserModel userModel = UserModel(
        name: "Teste", email: "tesetasa@gmail.com", password: "123456");
    when(
      mockAuth.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!),
    ).thenAnswer((realInvocation) async => mockUserCredential);
    expect(await user.createUser(userModel), "Success");
  });

  test("Create Account Exception default test", () async {
    UserModel userModel = UserModel(
        name: "Teste", email: "tesetasa@gmail.com", password: "123456");
    when(
      mockAuth.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!),
    ).thenAnswer(
      (realInvocation) async =>
          throw FirebaseAuthException(code: "", message: "Error"),
    );
    expect(await user.createUser(userModel), "Error");
  });

  test("Sing In test", () async {
    UserModel userModel = UserModel(
        name: "Teste", email: "tesetasa@gmail.com", password: "123456");
    when(
      mockAuth.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!),
    ).thenAnswer((realInvocation) async => mockUserCredential);
    expect(await user.authUser(userModel), "Success");
  });

  test("Sing In Exception test", () async {
    UserModel userModel = UserModel(
        name: "Teste", email: "tesetasa@gmail.com", password: "123456");
    when(
      mockAuth.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!),
    ).thenAnswer(
      (realInvocation) async =>
          throw FirebaseAuthException(code: "", message: "Error"),
    );
    expect(await user.authUser(userModel), "Error");
  });

  test("Reset password test", () async {
    when(mockAuth.sendPasswordResetEmail(email: "ronildosp03@gmail.com"))
        .thenAnswer((_) async => "");
    expect(await user.resetPassword("ronildosp03@gmail.com"),
        "Verifique seu e-mail para redefir sua senha.");
  });

  test("Upload Image Perfil test", () async {
    when(_mockUser.updatePhotoURL(File("../assets/images/google.png").path))
        .thenAnswer((_) async => "");
    expect(
        await user.uploadImageUser("../assets/images/google.png"), "Success");
  });

  test("Update Name User test", () async {
    when(_mockUser.updateDisplayName("User")).thenAnswer((_) async => "");
    expect(await user.updateDisplayName("User"), "Success");
  });

  test("Get Photo User test", () async {
    when(_mockUser.photoURL).thenAnswer((_) => "");
    expect(user.loadImagePerfil(), "");
  });

  test("Get Name User test", () async {
    when(_mockUser.displayName).thenAnswer((_) => "");
    expect(user.getNameUser(), "");
  });
}
