import 'package:app/src/features/widgets/custom_input.dart';
import 'package:app/src/features/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomTitle(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomInput(
                    labeltext: "Digite seu E-mail",
                    controller: _emailController,
                    icon: Icons.mail,
                  ),
                  CustomInput(
                    labeltext: "Digite seu Senha",
                    controller: _passController,
                    icon: Icons.visibility,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3DB62A),
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        20,
                      ),
                    ),
                    child: const Text("Entrar"),
                  ),
                ],
              ),
            ),
            Placeholder(
              fallbackHeight: 150,
              fallbackWidth: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Text("Não tem uma Conta?"),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Cadastre-se Agora!"),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.mail_outlined),
                      Icon(Icons.facebook),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundTitle = Paint()
      ..color = const Color(0xFF3DB62A)
      ..style = PaintingStyle.fill;

    // canvas.drawRect(Offset.zero & size, backgroundTitle);
    // final paintGreen = Paint()
    //   ..color = const Color(0xFFDDDDD1)
    //   ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * -0.3, 1.5)
      ..quadraticBezierTo(
          size.width * .7, size.height * .7, size.width * .5, 0.1)
      // ..lineTo(size.width, size.height)
      // ..lineTo(size.width, 0)
      ..close();

    canvas.clipPath(path);
    canvas.drawRect(Offset.zero & size, backgroundTitle);
  }

  @override
  bool shouldRepaint(covariant _MyPainter oldDelegate) => true;
}
