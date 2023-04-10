import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/square_tile.dart';
import 'package:flutter_application_1/components/swifttask_button.dart';
import 'package:flutter_application_1/components/swifttask_textfield.dart';
import 'package:flutter_application_1/loginPages/auth_page.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/utils.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, this.onTap}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final eMailController = TextEditingController();
  final checkPasswordControll = TextEditingController();
  final passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    if (passwordController.text == checkPasswordControll.text) {
      try {
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: eMailController.text.trim(),
                  password: passwordController.text.trim())
              .then((value) async {
            await value.user?.updateDisplayName(nameController.text);
          });
        } finally {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AuthPage()));
        }
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        // showErorrmessage(e.code);
        Utils.errorSnackBar(e.code);
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
      Utils.errorSnackBar('Şifreler eşleşmiyor');
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
                    Navigator.pop(context);
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
                    'Giriş yap',
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
            'Zaten bir hesabın var mı?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                        controller: nameController,
                        hintText: 'İsminizi girin',
                        obscureText: false,
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
                      SizedBox(
                        height: sHeight * 0.02,
                      ),
                      SwiftTaskTextField(
                        controller: checkPasswordControll,
                        hintText: 'Şifreni tekrar yaz',
                        obscureText: true,
                      ),
                      SizedBox(
                        height: sHeight * 0.02,
                      ),
                      SizedBox(
                        height: sHeight * 0.09,
                        child: SwifTtaskButton(
                          text: 'Kayıt ol',
                          onTap: signUserUp,
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
                              child: Text('Or continue with',
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
