import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginPages/auth_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
        Navigator.pop(context);
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
      height: sWidth,
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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 8,
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
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: sHeight * 0.03,
                        ),
                        Image.asset('assets/images/goal.jpg',
                            height: sHeight * 0.25),
                        const Text('Zamanımız değerli',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(
                          height: sHeight * 0.07,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60.0),
                          child: Text(
                              'Hayatının her anını genç ve özgürce yaşaman için yardım eli uzatıyoruz',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                        SizedBox(
                          height: sHeight * 0.08,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13)),
                                minimumSize: const Size(300, 50),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                backgroundColor:
                                    //  Color.fromRGBO(220, 4, 240, 0.08),
                                    const Color.fromARGB(255, 43, 0, 235)
                                        .withOpacity(0.4),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthPage()));
                              },
                              child: const Text('Sonraki!')),
                        ),
                      ],
                    ),
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
