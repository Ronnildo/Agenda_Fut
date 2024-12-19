import 'package:app/src/features/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets("Register Page widgets test", (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: const Register(),
      navigatorObservers: [mockObserver],
    ));
    expect(find.byType(Register), findsOneWidget);

    // teste de titulo
    expect(find.byKey(const Key('title')), findsOne);
    expect(find.text("Fut Agenda"), findsOneWidget);

    expect(find.byKey(const Key("infosText")), findsOneWidget);

    // teste de textos E-mail input
    expect(find.text("Nome"), findsOneWidget);
    expect(find.text("Digite seu Nome"), findsOneWidget);
    expect(find.text("E-mail"), findsOneWidget);
    expect(find.text("exemplo@gmail.com"), findsOneWidget);
    // teste de textos Senha input
    expect(find.text("Senha"), findsOneWidget);
    expect(find.text("Crie sua Senha"), findsOneWidget);

    // teste de textos Buttom
    expect(find.text("Cadastrar"), findsOneWidget);

    // teste de textos para criar conta
    expect(find.text("Tem uma conta?"), findsOneWidget);
    expect(find.text("Login"), findsOneWidget);

    // testes input widget
    await tester.enterText(find.byKey(const Key("nameInput")), "Teste");
    await tester.enterText(
        find.byKey(const Key("emailInput")), "teste@gmail.com");
    await tester.enterText(find.byKey(const Key("passwordInput")), "123456");
    await tester.pump();

    expect(find.text("Teste"), findsOneWidget);
    expect(find.text("teste@gmail.com"), findsOneWidget);
    expect(find.text("123456"), findsOneWidget);
  });

  testWidgets("errors snackbar Register Page test",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Register(),
    ));
    expect(find.byType(Register), findsOneWidget);

    final btnRegister = find.byKey(const Key("btnRegister"));
    await tester.dragUntilVisible(
        btnRegister, find.byType(SnackBar), const Offset(100, 60));
    await tester.tap(btnRegister);
    await tester.pump();

    expect(
        find.text("Campos vazios, preencha todos os campos."), findsOneWidget);
  });
}
