import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePage2State createState() => _ProfilePage2State();
}

void singOut() async {
  await FirebaseAuth.instance.signOut();
}

class _ProfilePage2State extends State<ProfilePage2> {
  double progressValue = 0.5;
  double progressValue2 = 0.7;
  double progressValue3 = 1;
  double progressValue4 = 0.6; // İlerleme çubuğu değeri

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              onPressed: () {
                singOut();
                //PAGE PUSHLAYACAK
                // IconButton pressed
              },
              icon: const Icon(Icons.logout),
              iconSize: sHeight * 0.037,
              tooltip: 'Add',
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
              radius: 75.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              '${FirebaseAuth.instance.currentUser!.displayName}',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Text(
                'Yazılımcı',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 80.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color.fromARGB(255, 100, 99, 99),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Flutter İlerleme',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      color: Colors.blue, // İlerleme çubuğu rengi
                      backgroundColor:
                          Colors.grey[300], // İlerleme çubuğu arka plan rengi
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 80.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color.fromARGB(255, 100, 99, 99),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Proje Yönetimi İlerleme',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: LinearProgressIndicator(
                      value: progressValue2,
                      color: Colors.blue, // İlerleme çubuğu rengi
                      backgroundColor:
                          Colors.grey[300], // İlerleme çubuğu arka plan rengi
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 80.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color.fromARGB(255, 100, 99, 99),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Teknoloji girişimciligi İlerleme',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: LinearProgressIndicator(
                      value: progressValue3,
                      color: Colors.blue, // İlerleme çubuğu rengi
                      backgroundColor:
                          Colors.grey[300], // İlerleme çubuğu arka plan rengi
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 80.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color.fromARGB(255, 100, 99, 99),
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Yazılımcılar için İngilizce İlerleme',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: LinearProgressIndicator(
                      value: progressValue4,
                      color: Colors.blue, // İlerleme çubuğu rengi
                      backgroundColor:
                          Colors.grey[300], // İlerleme çubuğu arka plan rengi
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
}
