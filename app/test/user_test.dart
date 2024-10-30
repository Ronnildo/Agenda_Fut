import 'package:app/firebase_options.dart';
import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/test.dart';

late UserProvider userProvider;
void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
  );
  group('Testing User', () async {
    setUp(() async {
      userProvider = UserProvider();
    });
    var user = UserModel(
      name: "Teste",
      email: "teste@teste.com",
      password: "123456",
    );
    test("Add user", () async {
      await userProvider.create(user, () {});
      expect(userProvider.isLoading, false);
    });
  });
}
