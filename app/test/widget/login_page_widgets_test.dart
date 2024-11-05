import 'package:app/src/app.dart';
import 'package:app/src/features/pages/auth/login_page.dart';
import 'package:app/src/features/widgets/snackbar_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Login Page Fut Agenda test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));
    expect(find.byType(LoginPage), findsOneWidget);

    // teste de titulo
    expect(find.byKey(const Key('title')), findsOne);
    expect(find.text("Fut Agenda"), findsOneWidget);

    // teste de textos E-mail input
    expect(find.text("E-mail"), findsOneWidget);
    expect(find.text("Digite seu E-mail"), findsOneWidget);
    // teste de textos Senha input
    expect(find.text("Senha"), findsOneWidget);
    expect(find.text("Digite sua Senha"), findsOneWidget);
    expect(find.text("Esqueceu a senha?"), findsOneWidget);

    // teste de textos Buttom
    expect(find.text("Entrar"), findsOneWidget);

    // teste de textos para criar conta
    expect(find.text("Não tem uma Conta?"), findsOneWidget);
    expect(find.text("Cadastre-se Agora"), findsOneWidget);

    // testes input widget
    await tester.enterText(
        find.byKey(const Key("emailInput")), "teste@gmail.com");
    await tester.enterText(find.byKey(const Key("passwordInput")), "123456");
    await tester.pump();

    expect(find.text("teste@gmail.com"), findsOneWidget);
    expect(find.text("123456"), findsOneWidget);
  });

}
