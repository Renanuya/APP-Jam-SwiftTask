import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bildirimler'),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text('Bildirim Başlığı $index'),
                  subtitle: Text('Bildirim açıklaması $index'),
                  trailing: const Icon(Icons.arrow_forward_sharp),
                  onTap: () {},
                ),
              );
            }));
  }
}
