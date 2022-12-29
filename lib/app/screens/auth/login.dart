// DART
import 'package:flutter/material.dart';
// ignore_for_file: use_build_context_synchronously

// RESPONSIVE
import 'package:cashflow/app/responsive/layout.dart';
import 'package:cashflow/app/responsive/weblayout.dart';
import 'package:cashflow/app/responsive/mobilelayout.dart';

// SCREENS
import 'package:cashflow/app/screens/auth/register.dart';

// PUBLIC
import 'package:cashflow/core/colors.dart';

// WIDGETS
import 'package:cashflow/utils/forms.dart';
import 'package:cashflow/utils/message.dart';

// FIREBASE AUTH
import 'package:cashflow/database/backend/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

// APP
class _LoginState extends State<Login> {
  // iFORMS
  final TextEditingController iEmail = TextEditingController();
  final TextEditingController iPassword = TextEditingController();

  // LOADING
  bool iLoading = false;

  // AUTH FORMS
  @override
  void dispose() {
    super.dispose();
    iEmail.dispose();
    iPassword.dispose();
  }

  // AUTH
  void loginUser() async {
    // CHECK
    setState(() {
      iLoading = true;
    });

    // VERIFICATION
    String res = await Auth().loginUser(
      email: iEmail.text,
      password: iPassword.text,
    );

    // POPUP MENUS
    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Layout(
            webLayout: WebLayout(),
            mobileLayout: MobileLayout(),
          ),
        ),
      );
    } else {
      // MESSAGE REPORT
      warningMessage(context, res);
    }

    // CHECK
    setState(() {
      iLoading = false;
    });
  }

  // ROUTER PAGE
  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Register(),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   'assets/svg/box.svg',
              //   color: white,
              //   height: 64,
              // ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Iniciar Sesión",
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
                        height: 15,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contraseña",
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
                        height: 15,
                      ),
                      InkWell(
                        onTap: loginUser, // USER METHODS
                        child: iLoading
                            ? Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  color: loading,
                                ),
                                child: const Text(
                                  'Iniciando sesión ...',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  color: button,
                                ),
                                child: const Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
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
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: brwhite, width: 0.4),
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
                              '¿Eres nuevo?',
                              style: TextStyle(fontSize: 12.3),
                            ),
                          ),
                          GestureDetector(
                            onTap: navigateToSignup, // ROUTER REGISTER
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: const Text(
                                ' Crear cuenta',
                                style: TextStyle(
                                  color: blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400
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
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
