// ignore_for_file: use_build_context_synchronously

import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/auth/login_page.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/custom_input.dart';
import 'package:app/src/features/widgets/custom_title.dart';
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
              heightdiv: 2.8,
            ),
            ListTile(
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
              hintText: "Nome",
              label: "Nome Completo",
              controller: _nameController,
              icon: Icons.person,
              obscureText: false,
              error: "",
            ),
            CustomInput(
              hintText: "exemplo@gmail.com",
              label: "E-mail",
              controller: _emailController,
              icon: Icons.mail,
              obscureText: false,
              error: "",
            ),
            // const DropDownTypeUser(),
            CustomInput(
              label: "Senha",
              hintText: "Crie sua Senha",
              controller: _passwordController,
              icon: Icons.visibility,
              obscureText: true,
              error: "",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtom(
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

  login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
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
    if (await Provider.of<UserProvider>(context, listen: false).status == "failed") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            Provider.of<UserProvider>(context, listen: false).error,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              Provider.of<UserProvider>(context, listen: false).status,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
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
