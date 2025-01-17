// ignore_for_file: use_build_context_synchronously

import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/auth/login_page.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/custom_input.dart';
import 'package:app/src/features/widgets/custom_title.dart';
import 'package:app/src/features/widgets/snackbar_auth.dart';
import 'package:app/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // Implementar lógica de cadastro
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomTitle(
              key: Key("title"),
              heightdiv: 2.8,
            ),
            ListTile(
              key: const Key("infosText"),
              title: Text(
                "Começe Agora",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                "Crie sua conta super rápido",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
            CustomInput(
              key: const Key("nameInput"),
              hintText: "Nome",
              label: "Digite seu Nome",
              controller: _nameController,
              icon: Icons.person,
              obscureText: false,
              error: "",
            ),
            CustomInput(
              key: const Key("emailInput"),
              hintText: "exemplo@gmail.com",
              label: "E-mail",
              controller: _emailController,
              icon: Icons.mail,
              obscureText: false,
              error: "",
            ),
            // const DropDownTypeUser(),
            CustomInput(
              key: const Key("passwordInput"),
              label: "Senha",
              hintText: "Crie sua Senha",
              controller: _passwordController,
              icon: isVisible ? Icons.visibility : Icons.visibility_off,
              obscureText: !isVisible,
              error: "",
              visibility: visibility,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtom(
              key: const Key("btnRegister"),
              onTap: () => registerUser(
                _nameController.text,
                _emailController.text,
                _passwordController.text,
              ),
              title: "Cadastrar",
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tem uma conta?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    key: const Key("loginText"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  visibility() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    } else {
      setState(() {
        isVisible = true;
      });
    }
  }

  login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
    clear();
  }

  Future<void> registerUser(
    String name,
    String email,
    String password,
  ) async {
    await Provider.of<UserProvider>(context, listen: false).create(
      UserModel(name: name, email: email, password: password),
      login,
    );
    if (await Provider.of<UserProvider>(context, listen: false).status ==
        "failed") {
      CustomSnackBar(context: context)
          .showError(Provider.of<UserProvider>(context, listen: false).error);
    } else {
      CustomSnackBar(context: context)
          .showError(Provider.of<UserProvider>(context, listen: false).status);
    }
  }

  clear() {
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
    });
  }
}
