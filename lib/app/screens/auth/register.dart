// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:flutter/material.dart';
import 'package:cashflow/app/responsive/layout.dart';
import 'package:cashflow/app/responsive/mobilelayout.dart';
import 'package:cashflow/app/responsive/weblayout.dart';
import 'package:cashflow/app/screens/auth/login.dart';
import 'package:cashflow/core/colors.dart';
import 'package:cashflow/database/backend/auth.dart';
import 'package:cashflow/utils/forms.dart';
import 'package:cashflow/utils/message.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController iEmail = TextEditingController();
  final TextEditingController iPassword = TextEditingController();
  final TextEditingController iBusiness = TextEditingController();
  final TextEditingController iUsername = TextEditingController();
  bool iLoading = false;

  // AUTH FORMS
  @override
  void dispose() {
    super.dispose();
    iEmail.dispose();
    iPassword.dispose();
    iBusiness.dispose();
    iUsername.dispose();
  }

  void signUpUser() async {
    setState(() {
      iLoading = true;
    });

    String res = await Auth().signUpUser(
        email: iEmail.text,
        password: iPassword.text,
        username: iUsername.text,
        business: iBusiness.text);

    setState(() {
      iLoading = false;
    });
    // LOG
    if (res != 'success') {
      warningMessage(context, res);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Layout(
            webLayout: WebLayout(),
            mobileLayout: MobileLayout(),
          ),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 45,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Registrarse',
                style: TextStyle(
                  color: white,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: border, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: card,
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nombres y apellidos',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      controller: iUsername,
                      text: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dirección de correo electrónico',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      controller: iEmail,
                      text: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Contraseña',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      controller: iPassword,
                      text: TextInputType.text,
                      password: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nombre de su negocio',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Forms(
                      controller: iBusiness,
                      text: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        String res = await Auth().signUpUser(
                          email: iEmail.text,
                          password: iPassword.text,
                          username: iUsername.text,
                          business: iBusiness.text,
                        );
                        print(res);
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                          color: btnblue,
                        ),
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                            fontSize: 12.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: brwhite,
                  width: 0.4,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                color: background,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            '¿Ya tienes cuenta? ',
                            style: TextStyle(fontSize: 12.3),
                          ),
                        ),
                        GestureDetector(
                          onTap: navigateToLogin, // ROUTER LOGIN
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: iLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: white,
                                    ),
                                  )
                                : const Text(
                                    'Inicia sesión aquí',
                                    style: TextStyle(
                                      color: blue,
                                      fontSize: 13,
                                    ),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
