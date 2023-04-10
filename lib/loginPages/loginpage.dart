import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/square_tile.dart';
import 'package:flutter_application_1/components/swifttask_button.dart';
import 'package:flutter_application_1/components/swifttask_textfield.dart';
import 'package:flutter_application_1/loginPages/auth_page.dart';
import 'package:flutter_application_1/loginPages/registerpage.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final eMailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: eMailController.text, password: passwordController.text);
      } finally {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AuthPage()));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErorrmessage(e.code);
    }
  }

  void showErorrmessage(String mesasage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mesasage),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sHeight,
      width: sWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(30, 7, 237, 1),
            Color.fromRGBO(158, 129, 225, 1),
            Color.fromRGBO(194, 94, 230, 1),
            Color.fromRGBO(91, 91, 224, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                    // onPressed handler
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0.001,
                    shadowColor:
                        const Color.fromARGB(137, 255, 255, 255), // gölge rengi
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kayıt ol',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
          title: const Text(
            'Hesabın yok mu?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return const Text(
                              'Swift Task',
                              style: TextStyle(
                                fontSize: 48,
                                fontFamily: 'Pacifico',
                                color: Colors.white,
                              ),
                            );
                          }),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60.0),
                        topRight: Radius.circular(60.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(
                  width: sWidth,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: sHeight * 0.03,
                      ),
                      Center(
                        child: Text(
                          'Tekrar hoş geldin!',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sHeight * 0.02,
                      ),
                      SwiftTaskTextField(
                        controller: eMailController,
                        hintText: 'E-mail',
                        obscureText: false,
                      ),
                      SizedBox(
                        height: sHeight * 0.02,
                      ),
                      SwiftTaskTextField(
                        controller: passwordController,
                        hintText: 'Şifre',
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          "Sakin ol ve şifreni hatırlamaya çalış!"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("Tamam"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Şifreni mi unuttun?',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sHeight * 0.02,
                      ),
                      SizedBox(
                        height: sHeight * 0.09,
                        child: SwifTtaskButton(
                          text: 'Giriş yap',
                          onTap: signUserIn,
                        ),
                      ),
                      SizedBox(
                        height: sHeight * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey[400],
                                thickness: 0.5,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('Veya bunlarla devam et',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  )),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey[400],
                                thickness: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SwiftTasksSquareTile(
                            imagePath: 'assets/images/google.png',
                            onTap: () => AuthService().signInWithGoogle(),
                          ),
                          SizedBox(
                            width: sWidth * 0.05,
                          ),
                          SwiftTasksSquareTile(
                            imagePath: 'assets/images/apple.png',
                            onTap: () => AuthService().signInWithGoogle(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: sHeight * 0.06,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
