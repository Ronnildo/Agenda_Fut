// ignore_for_file: use_build_context_synchronously

import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/login/presentation/login_page.dart';
import 'package:app/src/features/pages/register/controllers/register_user_controller.dart';
import 'package:app/src/features/pages/widgets/app_bar_widget.dart';
import 'package:app/src/features/pages/widgets/custom_input.dart';
import 'package:app/src/features/pages/widgets/snackbar_auth.dart';
// import 'package:app/src/models/user_model.dart';
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
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  // Implementar lógica de cadastro
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Cadastro",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Preencha todos os dados para criar sua conta",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(
                  height: 32,
                ),
                CustomInput(
                  key: const Key("nameInput"),
                  hintText: "Digite seu nome",
                  label: "Nome Completo",
                  controller: _nameController,
                  icon: Icons.person,
                  obscureText: false,
                  error: "",
                ),
                SizedBox(
                  height: 12,
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
                SizedBox(
                  height: 12,
                ),
                CustomInput(
                  key: const Key("passwordInput"),
                  label: "Senha",
                  hintText: "********",
                  controller: _passwordController,
                  icon: isVisible ? Icons.visibility : Icons.visibility_off,
                  obscureText: !isVisible,
                  error: "",
                  visibility: visibility,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomInput(
                  key: const Key("confirmPasswordInput"),
                  label: "Confirmar Senha",
                  hintText: "********",
                  controller: _passwordConfirmController,
                  icon: isVisible ? Icons.visibility : Icons.visibility_off,
                  obscureText: !isVisible,
                  error: "",
                  visibility: visibility,
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () => registerUser(
                    _nameController.text,
                    _emailController.text,
                    _passwordController.text,
                  ),
                  child: Text(
                    "Cadastrar",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
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
    await Provider.of<RegisterUserController>(context, listen: false).saveUser(
      name,
      email,
      password,
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
